---
layout: post
title: "TimeSpan - Dauer / Zeitspanne in .NET"
excerpt: "TimeSpan bietet dir einiges an Funktionalität um mit Zeitspannen zu arbeiten. Hier erfährst du was genau."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Datentypen, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-24T07:00:00+01:00
---

> Schau dir auch die weiteren Folgen des [C# Tutorial Deutsch](/csharp-tutorial-deutsch/) an.

`TimeSpan` wirst du spätestens dann verwenden, wenn du mit einem Timer arbeiten möchtest, oder die Differenz von zwei Zeitpunkten (in Form von [DateTime](https://youtu.be/Rlu5rPAQQwk) Objekten) bestimmen willst.

Die Struktur `TimeSpan` ist ähnlich wie [der Datentyp string](/csharp-tutorial-deutsch/der-datentyp-string/) immutable. D.h. wenn du einmal eine Instanz angelegt hast, dann kannst du die Werte dieser Instanz (bzw. Objekt) nicht mehr ändern. Willst du beispielsweise zu einer bestehenden Zeitspanne einfach nochmals 10 Minunten hinzu addieren, wird bei der Addition ein neues Objekt erstellt welches den addierten Wert enthält.

Alles weitere erfährst du hier im Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/kkpE-gCe2t4" frameborder="0" allowfullscreen></iframe>

Wenn dich ein spezifisches Thema aus dem Video interessiert und du nicht das komplette Video schauen möchtest, dann habe ich im folgenden die wichtigsten Themen mit entsprechenden Einsprungpunkten in das Video. Dazu findest du jeweils einen Link der dem Im Video entspricht. So kommst du auch direkt zum passenden Quellcode.

 - *Was ist `TimeSpan` überhaupt?* - Ab ungefähr [27 Sekunden im Video](https://youtu.be/kkpE-gCe2t4?t=27) erkläre ich was die Struktur `TimeSpan` ist und wofür du sie verwenden kannst.
 - *Erstellen eines Objektes mit dem Konstruktor* - Ab [Minute 2:20 im Video](https://youtu.be/kkpE-gCe2t4?t=141) zeige ich dir wie du mithilfe des Konstruktors ein Objekt der Struktur `TimeSpan` anlegst. Den passenden Quellcode dazu findest du [hier](https://gist.github.com/suchja/2e20267ca471c23d9e175a27cd8ec809/50e7a8cbb38d8db155c37fee85a0b56602ee74bc).
 - *Objekte erstellen mit den From-Methoden* - Ab [Minute 3:50 im Video](https://youtu.be/kkpE-gCe2t4?t=230) geht es darum, dass du auch mit den From-Methoden ein Objekt der Struktur `TimeSpan` erstellen kannst. Dies ist sogar ausdrucksstärker, aber funktioniert nur, wenn du deine Zeitspanne aus einem Wert (z.B. nur Minuten oder Millisekunden) erstellen kannst. Brauchst du mehrer (z.B. Stunden und Minuten), dann musst du beim Konstruktor bleiben. Den passenden Quellcode findest du [hier](https://gist.github.com/suchja/2e20267ca471c23d9e175a27cd8ec809/b2c16f0b8bab5670cb517071356130566ae8eaf5).
 - *Objekte erstellen durch Berechnungen mit `DateTime` Objekten* - Ab [Minute 5:15 im Video](https://youtu.be/kkpE-gCe2t4?t=315) zeige ich dir wie du Objekte der Struktur [DateTime]() von einander subtrahieren kannst und damit ein neues `TimeSpan` Objekt erzeugst. Den passenden Quellcode findest du [hier](https://gist.github.com/suchja/2e20267ca471c23d9e175a27cd8ec809/ccb94ac90f2090157558583b70138cc1056b9b9b).
 - *Rechnen mit `TimeSpan` Objekten* - Ab [Minute 7:00 im Video](https://youtu.be/kkpE-gCe2t4?t=421) erkläre ich dir, wie du eine Zeitspanne von einer anderen abziehen oder auch addieren kannst. Den passenden Quellcode findest du [hier](https://gist.github.com/suchja/2e20267ca471c23d9e175a27cd8ec809/d81285434771467458a3cdf0134613e25ebf61a5).
 - *Alles in eine Einheit mit den Total-Eigenschaften* - Ab [Minute 8:38 im Video](https://youtu.be/kkpE-gCe2t4?t=518) siehst du was der Unterschied zwischen `Minutes` und `TotalMinutes` ist. Den passenden Quellcode findest du [hier](https://gist.github.com/suchja/2e20267ca471c23d9e175a27cd8ec809/4093410a6f8ae97f2145048655225583b601f2fe).
 - *Ein TimeSpan Objekt aus einem string konvertieren* - Ab [Minute 10:56 im Video](https://youtu.be/kkpE-gCe2t4?t=657) zeige ich dir wie du mit den Methoden `Parse` und `TryParse` ein Objekt der Struktur `TimeSpan` aus einem `string` erstellen kannst. Den passenden Quellcode findest du [hier](https://gist.github.com/suchja/2e20267ca471c23d9e175a27cd8ec809/abd269b7148b8a4d68c639af927a8d56b1944b64).

<div class="subscribe-notice">
<h5>Du möchtest lernen wie du in C# Anwendungen entwickelst und darin TimeSpan verwendest?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

### Weitere Links

 - Im Artikel [Kombinierte Formatierung für Konsole, ...](/csharp-programmieren/kombinierte-formatierung-fuer-konsole-datei/) zeige ich dir wie du ein `DateTime` Objekt bei der Ausgabe auf die Konsole (oder in eine Datei) formatieren kannst. Diesen Ansatz kannst du ebenfalls für `TimeSpan` verwenden.
 - Eine detailiert Beschreibung aller Möglichkeiten für die Formatierung eines `TimeSpan` Objektes in einen string, findest du [in diesem MSDN-Artikel](https://msdn.microsoft.com/de-de/library/ee372287(v=vs.110).aspx).
 - Die `TimeSpan` Struktur ist natürlich auch auf [MSDN beschrieben](https://msdn.microsoft.com/de-de/library/system.timespan(v=vs.110).aspx).

Jetzt habe ich `TimeSpan.Zero` (also keine Zeit mehr ;) und wünsche dir viel Erfolg beim Verwenden der Struktur `TimeSpan`

Jan
