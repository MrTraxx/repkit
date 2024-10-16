# Reparaturkit-Skript für FiveM (ESX Framework)

## Beschreibung

Dieses Skript fügt ein benutzbares Reparaturkit (Item: `repkit`) in das ESX-Framework für FiveM hinzu. Spieler können dieses Reparaturkit in ihrem Inventar verwenden, um ihr Fahrzeug zu reparieren. Die Reparatur dauert 10 Sekunden und spielt eine passende Animation ab. Nach erfolgreicher Reparatur wird das Reparaturkit aus dem Inventar entfernt.

## Funktionen

- **Reparaturkit-Item** (`repkit`): Kann direkt über das Inventar verwendet werden.
- **Reparaturprozess**: 10 Sekunden Reparaturzeit mit Animation.
- **Item-Entfernung**: Nach erfolgreicher Reparatur wird das `repkit` aus dem Inventar entfernt.
- **Benachrichtigungen**: Der Spieler wird über den Status der Reparatur informiert.

## Voraussetzungen

- **FiveM**-Server mit **ESX Framework** installiert.
- https://github.com/mitlight/es_extended

## Installation

1. **Datenbank-Änderungen**: Füge das `repkit`-Item zu deiner `items`-Datenbank hinzu.

```sql
INSERT INTO items (name, label, weight, rare, can_remove) VALUES ('repkit', 'Reparaturkit', 1, 0, 1);
```

2. **Dateien hinzufügen**: 
   - Kopiere die **client.lua** und **server.lua** in dein `resources/`-Verzeichnis unter einem Ordner namens `repkit`.

3. **`server.cfg`**: Füge folgendes zu deiner `server.cfg` hinzu, um das Skript zu starten:

   ```bash
   ensure repkit
   ```

## Nutzung

- Spieler können das Reparaturkit über das Inventar benutzen.
- Spieler müssen im Auto sein(Easy umcodierbar falls der Spieler auserhalb des Autos sein soll)
- Sobald das `repkit` benutzt wird, startet der 10-Sekunden-Reparaturprozess und die Animation.
- Nach erfolgreicher Reparatur wird das `repkit` aus dem Inventar entfernt und das Fahrzeug wird repariert.

## Anpassungen

- **Reparaturdauer**: Ändere die Dauer des Reparaturvorgangs, indem du den Wert `duration` in der `client.lua` anpasst.
- **Animation**: Du kannst die Animation anpassen, indem du das `animDict` und `anim` änderst.

## Lizenz

Dies ist ein Open-Source-Projekt und kann nach Belieben bearbeitet oder angepasst werden. Bitte Autoren erwähnen, falls du wesentliche Änderungen machst und veröffentlichst.
