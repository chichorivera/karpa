-- Phase 3: unit_pricing table and chat system
-- Run in Supabase SQL Editor

-- ─── UNIT PRICING ────────────────────────────────────────────────────────────

DROP TABLE IF EXISTS public.unit_pricing CASCADE;

CREATE TABLE public.unit_pricing (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  unit_id         uuid NOT NULL REFERENCES public.units(id) ON DELETE CASCADE,
  date_from       date NOT NULL,
  date_to         date NOT NULL,
  price_per_night integer NOT NULL CHECK (price_per_night > 0),
  label           text,
  created_at      timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT valid_range CHECK (date_to >= date_from)
);

CREATE INDEX unit_pricing_unit_id_idx ON public.unit_pricing(unit_id);
CREATE INDEX unit_pricing_dates_idx   ON public.unit_pricing(unit_id, date_from, date_to);

ALTER TABLE public.unit_pricing ENABLE ROW LEVEL SECURITY;

CREATE POLICY "host gestiona precios" ON public.unit_pricing
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM public.units u
      JOIN public.campings c ON c.id = u.camping_id
      WHERE u.id = unit_id AND c.owner_id = auth.uid()
    )
  );

CREATE POLICY "precios visibles" ON public.unit_pricing
  FOR SELECT USING (true);

-- ─── CHAT / CONVERSATIONS ────────────────────────────────────────────────────

DROP TABLE IF EXISTS public.messages     CASCADE;
DROP TABLE IF EXISTS public.conversations CASCADE;

CREATE TABLE public.conversations (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  camping_id  uuid NOT NULL REFERENCES public.campings(id) ON DELETE CASCADE,
  traveler_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  host_id     uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now(),
  UNIQUE(camping_id, traveler_id)
);

CREATE INDEX conversations_traveler_idx ON public.conversations(traveler_id);
CREATE INDEX conversations_host_idx     ON public.conversations(host_id);

ALTER TABLE public.conversations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "participantes ven conversacion" ON public.conversations
  FOR SELECT USING (traveler_id = auth.uid() OR host_id = auth.uid());

CREATE POLICY "viajero crea conversacion" ON public.conversations
  FOR INSERT WITH CHECK (traveler_id = auth.uid());

CREATE TABLE public.messages (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  conversation_id uuid NOT NULL REFERENCES public.conversations(id) ON DELETE CASCADE,
  sender_id       uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  body            text NOT NULL CHECK (char_length(body) > 0 AND char_length(body) <= 2000),
  read_at         timestamptz,
  created_at      timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX messages_conversation_idx ON public.messages(conversation_id, created_at);

ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "participantes ven mensajes" ON public.messages
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM public.conversations c
      WHERE c.id = conversation_id
        AND (c.traveler_id = auth.uid() OR c.host_id = auth.uid())
    )
  );

CREATE POLICY "participantes envian mensajes" ON public.messages
  FOR INSERT WITH CHECK (
    sender_id = auth.uid() AND
    EXISTS (
      SELECT 1 FROM public.conversations c
      WHERE c.id = conversation_id
        AND (c.traveler_id = auth.uid() OR c.host_id = auth.uid())
    )
  );

-- Trigger: update conversations.updated_at on new message
CREATE OR REPLACE FUNCTION public.update_conversation_timestamp()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE public.conversations SET updated_at = now() WHERE id = NEW.conversation_id;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_new_message ON public.messages;
CREATE TRIGGER on_new_message
  AFTER INSERT ON public.messages
  FOR EACH ROW EXECUTE FUNCTION public.update_conversation_timestamp();
