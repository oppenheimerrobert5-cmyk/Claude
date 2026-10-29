# Claude

## Anrufe über Bland AI

`scripts/call_me.sh` lässt Claude dich über [Bland AI](https://www.bland.ai) anrufen, z. B. für Updates, Rückfragen oder Berechtigungen.

Einrichtung in der Claude-Code-Cloud-Umgebung (Umgebungsmenü in der Titelleiste → Edit):

1. **Secrets / Umgebungsvariablen:** `BLAND_API_KEY` und `MY_PHONE_NUMBER` (E.164, z. B. `+49151...`) setzen.
2. **Netzwerkzugriff:** `api.bland.ai` unter „Allowed domains“ freigeben.
3. Neue Sitzung starten, damit die Einstellungen greifen.

Test:

```bash
scripts/call_me.sh "Das ist ein Testanruf. Funktioniert alles?"
```

Die Telefonnummer und der API-Key gehören nie ins Repository.
