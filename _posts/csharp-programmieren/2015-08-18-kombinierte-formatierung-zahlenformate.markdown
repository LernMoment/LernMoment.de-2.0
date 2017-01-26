---
layout: post
title: Kombinierte Formatierung - Zahlenformate
excerpt: Von C wie Währung bis X wie HEXerei 
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, String, Datentypen]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-18T04:00:00+02:00
---

Nachdem du dich bereits mit der [allgemeinen Einführung](/csharp-programmieren/kombinierte-formatierung-fuer-konsole-datei/) der kombinierten Formatierung beschäftigt hast, geht es nun darum Zahlen zu formatieren.

Lass uns gleich mit einem Beispiel beginnen:

```cs
static void Main()
{
	uint anzahlLernMomente = 18;

	Console.WriteLine("Es sind bisher {0:N0} LernMomente erschienen!", anzahlLernMomente);
	Console.WriteLine();
}
```

Ganz allgemein kannst du bei Zahlen nach dem Formatbezeichner (im vorherigen Beispiel `N`) noch eine Genauigkeitsangabe verwenden. Je nach Formatbezeichner gibt diese die Anzahl der Nachkommastellen oder die Mindestanzahl von Ziffern an. Die wichtigsten Formatbezeichner für Zahlen sind:

-	`N` - damit kannst du sowohl Ganze Zahlen, wie auch Zahlen mit Nachkommastelle formatieren. Die Genauigkeitsangabe bezieht sich hier auf die Anzahl der Nachkommastellen. So kannst du mit `N0` die Zahl ohne Nachkommastelle ausgeben. Sofern es sich bei der Zahl um eine negative Zahl handelt, wird ein Minuszeichen eingesetzt. Trennzeichen für Tausender- und Dezimalstellen werden entsprechend der Sprache verwendet.
-	`C` - formatiert deine Zahl als Währung. Auch dieser Formatbezeichner kann auf alle numerischen Typen angewendet werden. Die Genauigkeitsangabe bezieht sich wieder auf die Anzahl der Nachkommastellen. Sowohl ein Minuszeichen, als auch die sprachabhängigen Trennzeichen für Tausender- und Dezimalstellen werden nach Bedarf eingesetzt. Zusätzlich wird je nach Sprache das passende Währungssymbol verwendet.
-	`X` - gibt eine Ganze Zahl im Hex-Format aus. Wenn du ein vorangestelltes `0x` haben möchtest, dann musst du dies in deinen statischen Text vor das Formatierungselement schreiben. Du kannst auch `x` als Formatbezeichner wählen. Dann werden kleine Buchstaben für die Zahl verwendet. Die Genauigkeitsangabe bezieht sich hier auf die Mindestanzahl von Ziffern bzw. Zeichen.

Wenn die Genauigkeitsangabe sich auf die Anzahl der Nachkommastellen bezieht, wird nicht automatisch gerundet. Es werden nur die restlichen Stellen weggelassen. Für die passende Rundung musst du selber sorgen.

Jetzt erstmal viel Spaß mit dem Formatieren deiner Zahlen

Jan


### Merke

-	Eine Zahl hinter dem Formatbezeichner definiert entweder die Mindestanzahl von Ziffern oder die Anzahl der Nachkommastellen.
-	Durch die Verwendung der Genauigkeitsangabe wird nicht automatisch gerundet.
-	`N` kann verwendet werden für Ganze Zahlen und welche mit Nachkommastelle.
-	`C` formatiert deine Zahl als Währung.
-	Mit `X` und `x` kannst du Ganze Zahlen im Hex-Format ausgeben lassen.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie grenzt du die Genauigkeit bei den Nachkommastellen ein?
-	Welches Formatierungselement verwendest du für eine negative Währung mit 3 Nachkommastellen?
-	Wie kannst du eine Ganze Zahl mit kleinen Buchstaben und mindestens 6 Stellen im Hex-Format ausgeben?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den Quelltext zum heutigen LernMoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/KombinierteFormatierung)
-	Eine sehr gute Beschreibung der kombinierten Formatierung gibt es bei [MSDN](https://msdn.microsoft.com/de-de/library/txafckwd(v=vs.110).aspx).
