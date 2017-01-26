---
layout: post
title: Kombinierte Formatierung für Konsole, Datei, ...
excerpt: Tipps wie du mühelos Werte in Strings einfügst und formatierst
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Konzept, String]
image:
  feature: csharp-programmieren.jpg
modified: 2015-09-03T17:00:00+02:00
date: 2015-08-12T06:00:00+02:00
---

Du schreibst häufiger Konsolenanwendungen, bearbeitest Dateien, manipulierst Zeichenketten oder gibst einfach ein paar Informationen auf `Console`, `Debug` oder `Trace` aus? Dann hast du die kombinierte Formatierung bereits verwendet. Da es sich dabei um eine mächtige Funktion von C# handelt, solltest du sie wirklich beherrschen. Deshalb gibt es in den nächsten Wochen immer mal wieder einen LernMoment zu diesem Thema.

Bevor ich dir Details zeige, hier erstmal die grundlegende Idee:

```cs
static void Main()
{
	string name = "Kombinierte Formatierung";
	DateTime datum = new DateTime(2015, 08, 12, 09, 30, 00);

	Console.WriteLine("LernMoment '{0}', erschienen am {1:D}, um {1:t}", name, datum);
}
```

Wenn du dies Programm ausführst, solltest du eine Ausgabe wie diese bekommen:

```sh
bash$  mono Einfuehrung.exe

LernMoment 'Kombinierte Formatierung', erschienen am Wednesday, 12 August 2015, um 09:30
```

Die kombinierte Formatierung kann für Methoden verschiedener Klassen angewendet werden. Dazu zählen unter anderem `String.Format`, `Console.WriteLine`, `TextWriter.WriteLine` und seine Erben `StreamWriter` und `HtmlTextWriter`.

Wie du im Beispiel oben bei `Console.WriteLine` sehen kannst, besteht die kombinierte Formatierung aus statischem Text mit Formatierungselementen und einer Liste von Objekten. Über die Formatierungselemente kannst du steuern, welche Objekte wo in deinen Text eingesetzt werden und wie sie formatiert werden sollen.

Du machst ein Formatierungselement kenntlich durch die geschweiften Klammern. Darin verwendest du den Index eines Objekts aus der Objektliste. Dabei ist wichtig, dass die Liste mit Index 0 startet. Der Compiler überprüft nicht die richtige Verwendung des Index. Wenn du also einen Index verwendest, den es nicht gibt, dann merkst du dies erst bei der Ausführung in Form einer `FormatException`.

Du kannst Objekte in mehreren Formatierungselementen verwenden. So ist es möglich, dass du den Wert eines Objektes mit unterschiedlichen Formatierungen anzeigst. Dies siehst du in dem Beispiel oben. Dort habe ich einmal `datum` mit dem langen Datumsmuster (`:D`) und einmal mit dem kurzen Zeitmuster (`:t`) formatiert.

Neben vielen weiteren Mustern für Datum und Zeit gibt es auch verschiedenste Formatierungsoptionen für Zahlen, Enums und andere Typen. Dabei musst du auch noch die jeweiligen Spracheinstellungen berücksichtigen. Bei mir ist zum Beispiel Englisch als Sprache des Betriebssystems eingestellt. Daher sieht die Ausgabe des Beispiels noch etwas komisch aus. Auch das lässt sich ändern. Dazu mehr in dem nächsten LernMoment in dieser Serie.

Jetzt erstmal viel Spaß mit dem Formatieren deiner Ausgaben

Jan


### Merke

-	Mit der kombinierten Formatierung kannst du Werte aus Objekten in einen String einfügen und formatieren.
-	Es gibt Methoden an verschiedenen Klassen, die diese Formatierung unterstützen (u.a. `String.Format`, `Console.WriteLine`, `TextWriter.WriteLine` und `Console.WriteLine`)
-	Die kombinierte Formatierung besteht aus zwei Teilen: 1) einem String mit Formatierungselementen und 2) einer Liste von Objekten, deren Werte in den String eingefügt werden.
-	Das Formatierungselement besteht mindestens aus einem Paar geschweifter Klammern und dem Index des Objektes, dessen Wert eingefügt werden soll. Das erste Objekt hat den Index 0.
-	Im Formatierungselement kann nach dem Index ein Doppelpunkt gefolgt von Formatierungsinformationen stehen.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Welche Bestandteile hat ein Formatierungselement?
-	An welchen Klassen kann die kombinierte Formatierung eingesetzt werden?
-	Wie kannst du ein Datum inklusive Wochentag ausgeben?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den Quelltext zum heutigen LernMoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/KombinierteFormatierung)
-	Eine sehr gute Beschreibung der kombinierten Formatierung gibt es bei [MSDN](https://msdn.microsoft.com/de-de/library/txafckwd(v=vs.110).aspx).
