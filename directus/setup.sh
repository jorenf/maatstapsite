#!/usr/bin/env bash
# =============================================================================
# Maatstap — Directus CRM/CMS Setup Script
# =============================================================================
# Gebruik:
#   chmod +x directus/setup.sh
#   ./directus/setup.sh
#
# Wat doet dit script?
#   1. Vraagt om je Directus URL + admin-token
#   2. Maakt alle collecties en velden aan via de Directus API
#   3. Stelt publieke toegang in voor contactformulier + tickets
#   4. (Optioneel) laadt seed-data in
#
# Vereisten: curl, jq
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC}   $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERR]${NC}  $1"; exit 1; }

# -----------------------------------------------------------------------------
# 0. Config
# -----------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCHEMA_FILE="$SCRIPT_DIR/schema.json"
SEED_FILE="$SCRIPT_DIR/seed.json"

if [ ! -f "$SCHEMA_FILE" ]; then
  error "schema.json niet gevonden in $SCRIPT_DIR"
fi

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   Maatstap — Directus CRM Setup          ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Lees configuratie uit env of vraag interactief
DIRECTUS_URL="${DIRECTUS_URL:-}"
DIRECTUS_TOKEN="${DIRECTUS_TOKEN:-}"

if [ -z "$DIRECTUS_URL" ]; then
  read -rp "Directus URL (bijv. http://localhost:8055): " DIRECTUS_URL
fi
if [ -z "$DIRECTUS_TOKEN" ]; then
  read -rsp "Admin static token: " DIRECTUS_TOKEN
  echo ""
fi

DIRECTUS_URL="${DIRECTUS_URL%/}"  # trailing slash weghalen

# Test verbinding
info "Verbinding testen met $DIRECTUS_URL …"
STATUS=$(curl -sf -o /dev/null -w "%{http_code}" \
  -H "Authorization: Bearer $DIRECTUS_TOKEN" \
  "$DIRECTUS_URL/server/info" || echo "000")

if [ "$STATUS" != "200" ]; then
  error "Kan Directus niet bereiken (HTTP $STATUS). Controleer URL en token."
fi
success "Verbonden met Directus."

# -----------------------------------------------------------------------------
# Hulpfuncties
# -----------------------------------------------------------------------------

api_post() {
  local endpoint="$1"
  local body="$2"
  curl -sf -X POST \
    -H "Authorization: Bearer $DIRECTUS_TOKEN" \
    -H "Content-Type: application/json" \
    -d "$body" \
    "$DIRECTUS_URL$endpoint" || true
}

api_patch() {
  local endpoint="$1"
  local body="$2"
  curl -sf -X PATCH \
    -H "Authorization: Bearer $DIRECTUS_TOKEN" \
    -H "Content-Type: application/json" \
    -d "$body" \
    "$DIRECTUS_URL$endpoint" || true
}

collection_exists() {
  local col="$1"
  local status
  status=$(curl -sf -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer $DIRECTUS_TOKEN" \
    "$DIRECTUS_URL/collections/$col" || echo "000")
  [ "$status" = "200" ]
}

field_exists() {
  local col="$1" field="$2"
  local status
  status=$(curl -sf -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer $DIRECTUS_TOKEN" \
    "$DIRECTUS_URL/fields/$col/$field" || echo "000")
  [ "$status" = "200" ]
}

# -----------------------------------------------------------------------------
# 1. Collecties aanmaken
# -----------------------------------------------------------------------------
echo ""
info "Stap 1/4 — Collecties aanmaken …"

COLLECTIONS=$(jq -c '.collections[]' "$SCHEMA_FILE")

while IFS= read -r col; do
  name=$(echo "$col" | jq -r '.collection')
  if collection_exists "$name"; then
    warn "  $name — bestaat al, sla over"
    continue
  fi
  api_post "/collections" "$col" > /dev/null
  success "  $name — aangemaakt"
done <<< "$COLLECTIONS"

# -----------------------------------------------------------------------------
# 2. Velden aanmaken
# -----------------------------------------------------------------------------
echo ""
info "Stap 2/4 — Velden aanmaken …"

FIELDS=$(jq -c '.fields[]' "$SCHEMA_FILE")

while IFS= read -r field; do
  col=$(echo "$field" | jq -r '.collection')
  fname=$(echo "$field" | jq -r '.field')

  if field_exists "$col" "$fname"; then
    warn "  $col.$fname — bestaat al, sla over"
    continue
  fi
  api_post "/fields/$col" "$field" > /dev/null
  success "  $col.$fname — aangemaakt"
done <<< "$FIELDS"

# -----------------------------------------------------------------------------
# 3. Relaties aanmaken
# -----------------------------------------------------------------------------
echo ""
info "Stap 3/4 — Relaties aanmaken …"

RELATIONS=$(jq -c '.relations[]' "$SCHEMA_FILE")

while IFS= read -r rel; do
  col=$(echo "$rel" | jq -r '.collection')
  field=$(echo "$rel" | jq -r '.field')
  related=$(echo "$rel" | jq -r '.related_collection')

  # Check of relatie al bestaat
  existing=$(curl -sf \
    -H "Authorization: Bearer $DIRECTUS_TOKEN" \
    "$DIRECTUS_URL/relations/$col/$field" 2>/dev/null || echo "{}")
  if echo "$existing" | jq -e '.data.collection' > /dev/null 2>&1; then
    warn "  $col.$field → $related — bestaat al, sla over"
    continue
  fi
  api_post "/relations" "$rel" > /dev/null
  success "  $col.$field → $related"
done <<< "$RELATIONS"

# -----------------------------------------------------------------------------
# 4. Publieke toegang voor formulieren
# -----------------------------------------------------------------------------
echo ""
info "Stap 4/4 — Publieke toegang instellen voor formulieren …"

# Haal public role ID op
PUBLIC_ROLE=$(curl -sf \
  -H "Authorization: Bearer $DIRECTUS_TOKEN" \
  "$DIRECTUS_URL/roles?filter[name][_eq]=Public" | jq -r '.data[0].id // empty')

if [ -z "$PUBLIC_ROLE" ]; then
  warn "Public role niet gevonden — sla toegangsinstelling over."
  warn "Stel handmatig in: Settings → Access Policies → Public"
  warn "Geef Create-toegang op: contacts, leads, tickets"
else
  for col in contacts leads tickets; do
    api_post "/permissions" "{
      \"role\": \"$PUBLIC_ROLE\",
      \"collection\": \"$col\",
      \"action\": \"create\"
    }" > /dev/null
    success "  Public Create-toegang op $col"
  done
fi

# -----------------------------------------------------------------------------
# 5. Seed-data (optioneel)
# -----------------------------------------------------------------------------
echo ""
if [ -f "$SEED_FILE" ]; then
  read -rp "Wil je seed-data laden (hero, stats, FAQs, testimonials, pricing)? [j/N] " LOAD_SEED
  if [[ "$LOAD_SEED" =~ ^[jJ]$ ]]; then
    info "Seed-data laden …"

    SEEDS=$(jq -c 'to_entries[]' "$SEED_FILE")
    while IFS= read -r entry; do
      col=$(echo "$entry" | jq -r '.key')
      items=$(echo "$entry" | jq -c '.value[]?')
      if [ -z "$items" ]; then
        # Singleton (object, niet array)
        body=$(echo "$entry" | jq -c '.value')
        api_patch "/items/$col" "$body" > /dev/null
        success "  $col (singleton) bijgewerkt"
        continue
      fi
      while IFS= read -r item; do
        api_post "/items/$col" "$item" > /dev/null
      done <<< "$items"
      success "  $col — seed geladen"
    done <<< "$SEEDS"
  fi
fi

# -----------------------------------------------------------------------------
# Klaar
# -----------------------------------------------------------------------------
echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   Setup voltooid!                                        ║"
echo "╠══════════════════════════════════════════════════════════╣"
echo "║                                                          ║"
echo "║  Directus Admin:  $DIRECTUS_URL/admin"
printf "║  %-56s║\n" ""
echo "║  Nieuwe collecties in het CRM:                           ║"
echo "║    • companies     — Bedrijven                           ║"
echo "║    • crm_contacts  — Contactpersonen                     ║"
echo "║    • leads         — Inkomende leads                     ║"
echo "║    • deals         — Sales pipeline                      ║"
echo "║    • activities    — Calls, mails, meetings               ║"
echo "║    • tasks         — To-do's                             ║"
echo "║    • customers     — Actieve klanten                     ║"
echo "║    • subscriptions — Abonnementen                        ║"
echo "║                                                          ║"
echo "║  Site-collecties:                                        ║"
echo "║    • contacts  — Websiteformulier inzendingen            ║"
echo "║    • tickets   — Support tickets                         ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
