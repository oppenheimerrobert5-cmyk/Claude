#!/usr/bin/env bash
# Ruft den Nutzer über Bland AI an, um ein Update zu geben oder eine Frage/Berechtigung zu klären.
#
# Benötigte Umgebungsvariablen (als Secret in der Umgebung setzen, nie ins Repo):
#   BLAND_API_KEY    – API-Key von https://app.bland.ai
#   MY_PHONE_NUMBER  – Zielnummer im E.164-Format, z. B. +49151...
#
# Nutzung:
#   scripts/call_me.sh "Was gesagt bzw. gefragt werden soll"
set -euo pipefail

: "${BLAND_API_KEY:?BLAND_API_KEY ist nicht gesetzt}"
: "${MY_PHONE_NUMBER:?MY_PHONE_NUMBER ist nicht gesetzt}"

message="${1:?Bitte die Nachricht als erstes Argument angeben}"

task="Du bist Claude, ein KI-Assistent, und rufst Brian an. Sprich Deutsch, sei kurz und freundlich.
Übermittle folgendes Anliegen: ${message}
Wenn es eine Frage ist, hol eine klare Antwort ein (z. B. Ja/Nein) und wiederhole sie zur Bestätigung. Beende danach das Gespräch."

payload=$(jq -n \
  --arg phone "$MY_PHONE_NUMBER" \
  --arg task "$task" \
  '{
     phone_number: $phone,
     task: $task,
     language: "de",
     first_sentence: "Hallo Brian, hier ist Claude.",
     max_duration: 5
   }')

curl -sS --fail-with-body https://api.bland.ai/v1/calls \
  -H "authorization: ${BLAND_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "$payload"
echo
