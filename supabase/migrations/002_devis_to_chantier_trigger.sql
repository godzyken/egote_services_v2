-- Migration 002: Trigger automatique pour transformer un devis validé en Chantier/Projet
-- Respecte le principe de non-modification des structures existantes d'Emap Services et Egote Services.

create or replace function public.handle_accepted_devis()
returns trigger as $$
begin
  -- Si le devis passe au statut 'accepted' (validé)
  if new.status = 'accepted' and (old.status is null or old.status <> 'accepted') then
    -- Vérifie si un chantier n'existe pas déjà pour ce devis
    if not exists (select 1 from public.chantiers where client_id = new.client_id and description like '%' || new.id || '%') then
      insert into public.chantiers (
        title,
        description,
        client_id,
        status
      )
      values (
        'Projet / Chantier - ' || initcap(new.service_type),
        'Généré automatiquement depuis le devis validé (ID: ' || new.id || ')',
        new.client_id,
        'active'
      );
    end if;
  end if;
  return new;
end;
$$ language plpgsql security definer;

-- Association du trigger sur la table devis
drop trigger if exists on_devis_accepted on public.devis;
create trigger on_devis_accepted
  after update on public.devis
  for each row
  execute function public.handle_accepted_devis();
