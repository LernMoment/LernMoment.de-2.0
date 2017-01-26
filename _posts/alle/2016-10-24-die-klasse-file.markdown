---
layout: post
title: "Die Klasse File"
excerpt: Wie du einfach eine Datei bearbeitest. (Video & Artikel)
share: true
categories: alle
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [C#, File, Syntax]
image:
  feature: csharp-programmieren.jpg
date: 2016-10-24T06:00:00+02:00
---

> NEU: Dieser Artikel als Video im [kostenlosen C# Tutorial Deutsch](https://youtu.be/KjP9v7xPUQE).
> Den Quellcode zum Beispielprogramm findest du auf [GitHub](https://github.com/LernMoment/csharp/tree/master/DieKlasseFile).

Der Namespace `System.IO` bietet dir viele Klassen um Dateien zu erstellen, bearbeiten, komprimieren, löschen und noch vieles mehr. In diesem LernMoment zeige ich dir die Klasse `System.IO.File`, welche viele von den täglichen Aufgaben sehr einfach erledigt. Es handelt sich dabei um eine rein statische Klasse. Du solltest aber wissen, dass es andere Klassen gibt, die bezüglich der Ausführungszeit die selben Aufgaben schneller erledigen. Dafür sind sie auch etwas komplexer in der Verwendung.

Für viele Datei-Operationen macht es Sinn, dass du überprüfst, ob die Datei bereits existiert:

```cs
string dateiPfadUndName = @"c:\temp\test.txt";
if ( File.Exists(dateiPfadUndName) )
{
	// Datei kann geöffnet und bearbeitet werden
}
```

Die Methode erwartet den Pfad (egal ob relativ, absolut oder UNC) und gibt per `bool` das Resultat zurück. Dabei ist zu beachten, dass auch ein `false` zurück kommt, wenn der Pfad nicht korrekt ist. Wenn du also statt `@"C:\temp\test.txt"` nur `"C:\temp\test.txt"` verwendest, dann kommt immer ein `false` aus der Methode `File.Exists` zurück, weil der Pfad nicht korrekt ist. Mit dem `@` werden alle Zeichen die als "Escape-Sequenz" interpretiert werden, wie zum Beispiel das `\`, als normales Zeichen verwendet. Alternativ könntest du auch `"C:\\temp\\test.txt"` schreiben.

Mehr über Pfade erfährst du auch im Artikel [Pfade trennen sich auf allen Plattformen anders](/csharp-programmieren/pfade-trennen-sich-auf-allen-plattformen-anders/).

<div class="subscribe-notice">
<h5>Lerne alles über C# und professionelle Softwareentwicklung</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

Der nächste Schritt ist schon die Verwendung einer `File.Read*`, `File.Write*` oder `File.Append*` Methode. Die unterschiedlichen Ausprägungen dieser Methoden sind [hier](https://msdn.microsoft.com/de-de/library/system.io.file(v=vs.110).aspx) beschrieben. Diese Methoden öffnen bzw. erstellen eine Datei, lesen oder schreiben den angegebenen Inhalt und schließen die Datei wieder. Um beispielsweise den Inhalt einer Datei zeilenweise zu lesen und auf der Console auszugeben, schreibst du einfach folgendes:

```cs
foreach(string zeile in File.ReadLines(dateiPfadUndName))
{
	Console.WriteLine(zeile);
}
```

`File.Read*` erstellt keine Datei, wenn sie nicht vorhanden ist. Würde wohl auch keinen Sinn machen. Dafür versucht sie aber die Codierung (UTF8 und UTF32 werden unterstützt) automatisch zu erkennen. Bei den `File.Write*` Methoden musst du berücksichtigen, dass sie eine Datei neu erstellen oder eine vorhandene überschreiben. Die `File.Append*` Methoden hängen den Inhalt an eine bestehende Datei an, oder erstellen diese, wenn sie nicht existiert.

Übrigens, `File.ReadLines` und `File.ReadAllLines` unterscheiden sich in ihrem Verhalten. Ersteres liest, wenn zum Beispiel in einer `foreach` Schleife verwendet, immer nur eine Zeile. Die Datei bleibt also geöffnet und für andere gesperrt, bis alle Zeilen verarbeitet wurden. Bei `File.ReadAllLines` wird erst alles gelesen und dann verarbeitet. Somit verbraucht sie mehr Speicher, aber blockiert die Datei nicht so lange. 

Jetzt viel Spaß mit der einfachen Bearbeitung von Dateien

Jan

PS: Dieser Artikel ist eine überarbeitete Version des [ursprünglichen Artikels](/csharp-programmieren/die-klasse-file/).

### Merke

-	Mit der Klasse `System.IO.File` kannst du schnell Quellcode zum bearbeiten von Dateien erstellen. Ähnliches kannst du mit `System.IO.FileInfo` machen. Die Klasse ist komplizierter, aber bezüglich Laufzeit schneller.
-	`File.Exists` sagt dir nur ob eine Datei existiert, aber nicht ob dein Pfad ungültige Zeichen enthält.
-	Wenn du eine Datei neu erstellen oder überschreiben willst, dann verwende eine der `File.Write*` Methoden.
-	Willst du eine Datei neu erstellen oder an eine bestehende etwas anhängen, dann nimmst du eine `File.Append*` Methode.
-	Wenn du Speicher sparen willst und deine Datei beim lesen länger blockieren kannst, verwendest du besser `File.ReadLines` als `File.ReadAllLines`.

### Lernquiz

Verwende folgende Fragen um das gelernte von heute zu festigen:

-	In welchem Namensraum befindet sich die Klasse `File`?
-	Musst du eine Datei explizit öffnen oder schließen, wenn du `File.Read*` oder `File.Write*` verwendest?
-	Welche Methoden kannst du aus der Klasse `File` verwenden um etwas an eine Datei anzuhängen?
-	Welchen Parameter brauchst du immer, wenn du einer der Methoden von `File` zum lesen, schreiben oder anhängen verwenden willst?

Am besten du schaust dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Grundlagen C# und professionelle Softwareentwicklung lernen im Online-Kurs [Einstieg in C#](https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=LM2016_UCSK-110)
-	Das komplette Beispielprogramm zu diesem LernMoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/DieKlasseFile)
-	Die ganzen Methoden der Klasse `File` sind sehr gut [hier](https://msdn.microsoft.com/de-de/library/system.io.file(v=vs.110).aspx) beschrieben.
-	Mehr über Pfade erfährst du auch im Artikel [Pfade trennen sich auf allen Plattformen anders](/csharp-programmieren/pfade-trennen-sich-auf-allen-plattformen-anders/).
