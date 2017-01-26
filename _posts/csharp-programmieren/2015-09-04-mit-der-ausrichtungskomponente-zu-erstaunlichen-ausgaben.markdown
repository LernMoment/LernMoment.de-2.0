---
layout: post
title: Mit der Ausrichtungskomponente zu erstaunlichen Ausgaben
date: 2015-09-04T06:00:00+02:00
excerpt: Tabellarische Ausgabe mit kombinierter Formatierung
share: true
modified:
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, String, Datentypen]
image:
  feature: csharp-programmieren.jpg
---

Insbesondere die Konsole ist nun nicht gerade der Ort für eine schöne Benutzerschnittstelle, aber gerade in technischen Bereichen hilft dir eine Konsolenanwendung häufig weiter. Die Ausrichtungskomponente ist Teil der kombinierten Formatierung. Damit kannst du auch auf der Konsole (oder in Dateien) deine Daten übersichtlich anzeigen. Gerade für Log-Dateien ist beispielsweise die tabellarische Ausgabe relevant.

Die Ausrichtungskomponente ist ein optionaler Bestandteil des Formatierungselements. Wie im LernMoment - [Kombinierte Formatierung für Konsole, Datei, ...](http://www.lernmoment.de/csharp-programmieren/kombinierte-formatierung-fuer-konsole-datei/) beschrieben, wird das `{0:D}` in `Console.WriteLine("LernMoment ist erschienen am {0:D}", datum);` als Formatierungselement bezeichnet. Dabei steht vor dem Doppelpunkt der Index und der Doppelpunkt mit nachfolgenden Zahlen und Buchstaben wird Formatzeichenfolge genannt.

Zwischen diese beiden Komponenten kannst du nun optional die Ausrichtungskomponente einfügen. Sie wird vom Index mit einem Komma getrennt und ist eine positive oder negative Ganzzahl. Sie definiert einen Minimalwert für die Feldbreite. Ist der Wert den du anzeigen möchtest beispielsweise 10 Zeichen lang und du hast deine Ausrichtungskomponente auf 15 gesetzt, werden 5 Leerzeichen eingefügt, bevor der weitere Text eingefügt wird. Mit dem Vorzeichen der Ausrichtungskomponente kannst du entscheiden ob es rechtsbündig oder linksbündig sein soll. Setzt du ein Minus vor die Ausrichtungskomponente, wird erst der Wert eingesetzt und dann die restliche Feldbreite mit Leerzeichen aufgefüllt. Ein Minus steht also für linksbündig.

Sollte dein Wert länger sein, dann wird natürlich der ganze Wert angezeigt. Gerade für tabellarische Ausgabe ist dies etwas problematisch. Denn wenn du nicht genau weißt, wie lang die einzelnen Werte in den jeweiligen Spalten sein werden, hilft dir die Ausrichtungskomponente leider nicht viel. Im folgenden Beispiel siehst du wie die tabellarische Ausgabe geht:

```cs
static void LernMomentAusgeben(LernMoment lm)
{
	string tags = TagsFormatieren(lm.Tags);

	Console.WriteLine("{0, -40}{1, -25:ddd dd MMMM yyyy}{2, 35}", lm.Name, lm.VeroeffentlichtAm, tags);
}
```

Den restlichen Quelltext findest du im Beispiel (siehe unten). Hier werden die ersten beiden Spalten linksbündig formatiert (Minuszeichen) und die letzt rechtsbündig. Auch siehst du wie alle drei Komponenten des Formatierungselements kombiniert werden:

1.	`{` mit dem Index
2.	optional: `, ` mit der ganzzahligen Ausrichtungskomponente
3.	optional: `:` mit den Formatzeichenfolgen
4.	`}` um das Formatierungselement zu beenden

Bei mir sieht die Ausgabe des Beispiels dann so aus:

```sh
bash$ mono TabellarischeAusgabe.exe 

LERNMOMENTE:
Name                                    Veroeffentlicht am                                      Tags
────────────────────────────────────────────────────────────────────────────────────────────────────
Die Klasse File                         Sun 26 July 2015                              {Syntax, File}
Von Prozessen zu Tasks                  Thu 20 August 2015           {Syntax, TPL, Parallelisierung}
```

Wenn die Ausrichtungskomponente für deine Ausgabe in einer Tabelle nicht genügt, gibt es einige Bibliotheken die eine umfangreichere Formatierung machen. Im Bereich *Weitere Informationen* findest du entsprechende Links.

Jetzt erstmal viel Spaß mit dem Formatieren deiner Ausgabe als Tabelle

Jan


### Merke

-	Das Formatierungselement kann optional eine Ausrichtungskomponente enthalten. Dies ist ein ganzzahliger Wert mit optionalem Vorzeichen.
-	Die Ausrichtungskomponente wird durch ein Komma vom Index getrennt. Die Formatzeichenfolge kommt nach der Ausrichtungskomponente.
-	Mit der Ausrichtungskomponente definierst du einen Minimalwert für die Feldbreite.
-	Wenn der Wert länger ist, als in der Ausrichtungskomponente definiert, wird der Wert **nicht** gekürzt.
-	Verwendest du eine negative Ausrichtungskomponente, wird der Wert linksbündig angezeigt. Ansonsten werden die Leerzeichen vor dem Wert eingesetzt (rechtsbündig).

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie sieht ein Formatierungselement aus, welches ein Datum mit Index 2, einer minimalen Feldbreite von 10 (linksbündig) und der Formatzeichenfolge `D` verwendet?
-	Wie sieht das Formatierungselement aus, wenn dein Wert rechtsbündig ausgegeben werden soll?
-	Was passiert, wenn dein Wert länger als die minimale Feldbreite ist?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/KombinierteFormatierung).
-	Eine sehr gute Beschreibung der kombinierten Formatierung gibt es bei [MSDN](https://msdn.microsoft.com/de-de/library/txafckwd(v=vs.110).aspx).
-	Eine Bibliothek die sich voll auf die Formatierung in Tabellenform konzentriert gibt es bei [Github](https://github.com/khalidabuhakmeh/ConsoleTables)
-	Eine weitere Bibliothek findest sich ebenfalls bei [Github](https://github.com/superlogical/TableParser)
