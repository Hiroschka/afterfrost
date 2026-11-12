# Landingpage AfterFrost – vorbereitet für GitHub Pages, noch nicht veröffentlicht

Der Ordner ist fertig für GitHub Pages, aber auf „nicht öffentlich“ gestellt:
- `robots.txt` und `<meta name="robots" content="noindex">` halten Suchmaschinen fern.
- Impressum und Datenschutz sind noch Vorlagen.
- `Pruefen.ps1` zeigt, was vor dem Start noch offen ist.

## Kosten
| Teil | Kostenlos möglich? | Wann es Geld kostet |
| --- | --- | --- |
| Hosting | ja, GitHub Pages (`<dein-name>.github.io/afterfrost`) | nur eine eigene Domain (optional) |
| Newsletter | ja, MailerLite Free bis 250 Abonnenten / 2.500 Mails im Monat; Buttondown bis 100 | ab mehr Abonnenten |
| Impressum/Datenschutz | ja, Generator (z. B. eRecht24) | Anschrift-Service statt Wohnanschrift |
| Markenrecherche | ja, DPMAregister, TMview, WIPO | erst die Anmeldung (DPMA online 290 €, bis 3 Klassen) |

## Schritt A – jetzt: vorbereiten, ohne zu veröffentlichen
Wichtig: Bei kostenlosem GitHub funktioniert Pages nur mit **öffentlichen** Repositories.
Ein privates Repository ist deshalb das „Lager“, bis du startest.

1. github.com → New repository → Name `afterfrost` → **Private** → Create.
   (Nicht das Spiel-Repository verwenden.)
2. „uploading an existing file“ → alle Dateien und den Ordner `img` aus diesem Paket hineinziehen
   (auch `.nojekyll`; falls Windows sie versteckt: Explorer → Ansicht → Ausgeblendete Elemente) → Commit.
3. Nichts weiter einstellen. Solange das Repository privat ist, ist nichts öffentlich.

Ausfüllen (direkt auf GitHub mit dem Stift-Symbol oder lokal):
- `index.html`: unten `var DISCORD_INVITE = "";` und im Formular `action="NEWSLETTER-FORMULAR-URL"`.
- `impressum.html`, `datenschutz.html`.
- Bilder nach `img/` (siehe `img/LIESMICH.txt`).
- Name tauschen, falls nicht AfterFrost: Suchen & Ersetzen in allen HTML-Dateien.

Lokal ansehen: `index.html` doppelklicken. Prüfen: PowerShell im Ordner → `.\Pruefen.ps1`.

## Schritt B – zum Start (erst nach Markenrecherche, Impressum und Datenschutz)
1. `.\Pruefen.ps1` meldet nur noch die beiden Start-Punkte (noindex, robots.txt).
2. In `index.html` die Zeile `<meta name="robots" content="noindex">` löschen.
3. `robots.txt` ersetzen durch:
   ```
   User-agent: *
   Allow: /
   ```
4. Repository → Settings → General → ganz unten „Change visibility“ → **Public**.
5. Settings → Pages → Source „Deploy from a branch“ → Branch `main`, Ordner `/ (root)` → Save.
6. Nach 1–2 Minuten: `https://<dein-github-name>.github.io/afterfrost/`. Einmal am Handy öffnen,
   Newsletter mit eigener Adresse testen (Bestätigungsmail muss kommen).

## Newsletter anschließen (Beispiel MailerLite)
1. Kostenloses Konto, Double-Opt-in einschalten.
2. Forms → Embedded form → im HTML-Code die `action="…"`-Adresse und den Feldnamen der E-Mail
   (meist `fields[email]`) kopieren.
3. In `index.html` die `action` eintragen und beim E-Mail-Feld `name="email"` durch diesen Feldnamen ersetzen.

Anbieterbedingungen und Auftragsverarbeitung selbst prüfen – keine Rechtsberatung.

## Was die Seite bewusst nicht tut
Keine Cookies, keine Tracker, kein Speichern im Browser, keine Google Fonts, keine externen Skripte.
