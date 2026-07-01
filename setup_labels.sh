#!/usr/bin/env bash
# Run this once with a classic PAT that has repo scope:
#   GH_TOKEN=ghp_... bash setup_labels.sh
set -e
REPO="aralabs-ai/ara-community-issues"

delete_default() {
  gh api "repos/$REPO/labels/$1" --method DELETE 2>/dev/null || true
}

create_label() {
  local name="$1" color="$2" desc="$3"
  gh api "repos/$REPO/labels" --method POST \
    -f name="$name" -f color="$color" -f description="$desc" \
    --silent 2>/dev/null || \
  gh api "repos/$REPO/labels/$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$name'''))")" --method PATCH \
    -f name="$name" -f color="$color" -f description="$desc" --silent
  echo "  ✓ $name"
}

echo "→ Removing default labels..."
for label in "bug" "documentation" "duplicate" "enhancement" "good first issue" \
             "help wanted" "invalid" "question" "wontfix"; do
  delete_default "$(python3 -c "import urllib.parse; print(urllib.parse.quote('$label'))")"
done

echo "→ Creating type labels..."
create_label "type: bug"          "d73a4a" "Something is broken"
create_label "type: enhancement"  "0075ca" "New capability or improvement"
create_label "type: question"     "7b3fa0" "Support or how-to question"
create_label "type: documentation" "1d76db" "Docs missing, wrong, or unclear"
create_label "type: performance"  "e4a317" "Latency regression or throughput issue"
create_label "type: security"     "e05d44" "Security — use email instead"

echo "→ Creating priority labels..."
create_label "P0: critical"  "b60205" "Data loss, crash on start, all users affected"
create_label "P1: high"      "e4613b" "Core functionality broken, no workaround"
create_label "P2: medium"    "fbca04" "Significant issue with a workable workaround"
create_label "P3: low"       "0e8a16" "Minor, cosmetic, or nice-to-have"

echo "→ Creating status labels..."
create_label "status: triage"        "ededed" "Newly filed, not yet reviewed"
create_label "status: confirmed"     "0075ca" "Reproduced and accepted"
create_label "status: needs-info"    "e4a317" "Waiting for more info from reporter"
create_label "status: in-progress"   "bfd4f2" "Being actively worked on"
create_label "status: fixed-in-next" "0e8a16" "Fixed, pending next release"
create_label "status: wont-fix"      "b4b4b4" "Will not address"
create_label "status: duplicate"     "cfd3d7" "Duplicate of another issue"

echo "→ Creating component labels..."
create_label "component: server"     "1abc9c" "Core server / engine"
create_label "component: sdk/python" "1abc9c" "Python SDK"
create_label "component: sdk/java"   "1abc9c" "Java SDK"
create_label "component: sdk/cpp"    "1abc9c" "C++ SDK"
create_label "component: config"     "1abc9c" "server_config.json / feature schema"
create_label "component: install"    "1abc9c" "Packaging / install scripts"
create_label "component: docs"       "1abc9c" "Documentation"

echo "→ Creating special labels..."
create_label "good first issue" "7057ff" "Well-scoped, community contributions welcome"

echo "✅ All labels created."
