# Prueft vor dem Veroeffentlichen, ob noch Platzhalter in der Landingpage stehen.
# Aufruf in PowerShell im Ordner der Seite:  .\Pruefen.ps1
$ordner = $PSScriptRoot
$fehler = @()
$checks = @(
  @{ Datei = "index.html";       Muster = "NEWSLETTER-FORMULAR-URL"; Text = "Newsletter-Formular-Adresse fehlt" },
  @{ Datei = "index.html";       Muster = 'DISCORD_INVITE = ""';     Text = "Discord-Einladungslink fehlt" },
  @{ Datei = "index.html";       Muster = 'name="robots" content="noindex"'; Text = "noindex steht noch drin (erst zum Start entfernen)" },
  @{ Datei = "impressum.html";   Muster = "VORLAGE";                 Text = "Impressum ist noch Vorlage" },
  @{ Datei = "impressum.html";   Muster = "[Vorname";                Text = "Impressum: Name/Anschrift fehlen" },
  @{ Datei = "datenschutz.html"; Muster = "PLATZHALTER";             Text = "Datenschutzerklaerung fehlt" },
  @{ Datei = "robots.txt";       Muster = "Disallow: /";             Text = "robots.txt sperrt Suchmaschinen noch (erst zum Start aendern)" }
)
foreach ($c in $checks) {
  $pfad = Join-Path $ordner $c.Datei
  if ((Test-Path $pfad) -and (Select-String -Path $pfad -SimpleMatch -Pattern $c.Muster -Quiet)) { $fehler += $c.Text }
}
foreach ($bild in "hero.jpg","shot-1.jpg","shot-2.jpg","shot-3.jpg") {
  if (-not (Test-Path (Join-Path $ordner "img\$bild"))) { $fehler += "Bild fehlt: img\$bild" }
}
if ($fehler.Count -eq 0) { Write-Host "Alles ausgefuellt - bereit zum Veroeffentlichen." -ForegroundColor Green }
else { Write-Host "Noch offen:" -ForegroundColor Yellow; $fehler | ForEach-Object { Write-Host " - $_" } }
