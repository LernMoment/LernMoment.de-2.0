---
layout: post
title: Kombinierte Formatierung - Enumformate
excerpt: Enums ausgeben mit ein wenig HEXerei
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, String, Datentypen]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-28T06:00:00+02:00
---

Im LernMoment [Flag(ge) zeigen für Bitpopelei](/csharp-programmieren/flagge-zeigen-fuer-bitpopelei/) ging es gerade erst um Enums und Bitfelder. In diesem LernMoment erfährst du, wie du diese als Text oder Zahl ausgeben kannst. Im LernMoment [Kombinierte Formatierung für Konsole, Datei, ...](/csharp-programmieren/kombinierte-formatierung-fuer-konsole-datei/) bekommst du die allgemeinen Grundlagen zu diesem Thema.

Laut [Dokumentation](https://msdn.microsoft.com/de-de/library/c3s1ez6e(v=vs.110).aspx) musst du für die Formatierung von Enums die Methode `Enum.ToString` verwenden. Du kannst aber, genau wie bei den Zahlenformaten, einfach den Formatbezeichner getrennt durch einen Doppelpunkt nach dem Index angeben. Bei der Formatierung von Enums gibt es allerdings keine Genauigkeitsangabe. Einen Ausdruck wie diesen `{0:X2}` lässt der Compiler zwar zu, aber es gibt eine `FormatException` bei der Ausführung.

Hier ein Beispiel (dabei ist `Farbe` als Enum mit `[Flags]` Attribut definiert und `KombinierteFarben` ohne dies Attribut):

```cs
static void Main()
{
	var meineFarbe = Farbe.Blau | Farbe.Weiss;
	var kombiFarbe = KombinierteFarben.Gelb | KombinierteFarben.Pink;

	Console.WriteLine("Meine ausgewählte Farbe als Zeichenfolge ist: {0:G}", meineFarbe);
	Console.WriteLine("Meine ausgewählte Farbe als Ganzzahl ist: {0:D}", meineFarbe);
	Console.WriteLine("Meine ausgewählte Farbe in Hexadezimal: 0x{0:x}", meineFarbe);
	Console.WriteLine("Meine kombinierte Farbe mit Formatierungszeichen 'G' ist: {0}", kombiFarbe.ToString("G"));
	Console.WriteLine("Meine kombinierte Farbe mit Formatierungszeichen 'F' ist: {0}", kombiFarbe.ToString("F"));
}
```

Wie du siehst, kann der Formatbezeichner entweder direkt nach dem Index verwendet oder der `ToString` Methode übergeben werden. Bei der Formatierung von Enums macht es keinen Unterschied, ob du den Formatbezeichner groß oder klein schreibst. Die Ausnahme ist hier `X`. Je nachdem, ob du diesen groß oder klein schreibst, werden etwaige Buchstaben in Hexadezimalzahlen ausgegeben.

Die vier für Enums definierten Formatbezeichner haben folgende Bedeutung:

-	`G` bzw. `g` - gibt den entsprechenden Text des aktuellen Wertes einer Enum aus. Sofern die Enum mit `[Flags]` und als gültiges Bitfeld definiert ist, werden die einzelnen Bestandteile eines kombinierten Wertes mit Komma getrennt ausgegeben. Im Beispiel oben wird für `kombiFarbe.ToString("G")` nur eine Ganzzahl ausgegeben, weil die zugrundeliegende Enum nicht mit `[Flags]` definiert ist.
-	`F` bzw. `f` - wie `G`, jedoch kann dieser Formatbezeichner auch ein Bitfeld ausgeben, wenn die Enum *nicht* mit `[Flags]` definiert ist. Achtung: Die Enum muss trotzdem in Zweierpotenzen nummeriert sein!
-	`D` bzw. `d` - gibt die entsprechende Ganzzahl des aktuellen Wertes einer Enum aus.
-	`X` bzw. `x` - gibt die entsprechende Ganzzahl im Hexadezimalformat aus. Wie bei Zahlenformaten wird kein führendes `0x` ausgegeben. Dies musst du in den Text integrieren.

Jetzt erstmal viel Spaß mit dem Formatieren deiner Enums

Jan


### Merke

-	Du kannst den Formatbezeichner für Enums sowohl nach dem Index einfügen (z.B. `{1:G}`), als auch der `ToString` Methode übergeben.
-	`G` und `F` geben den Wert als Text aus. Dabei kann `F` auch kombinierte Werte als Text ausgeben, wenn die Enum nicht mit `[Flags]` definiert ist.
-	Du verwendest `D`, wenn du den Wert als Ganzzahl haben willst. Mit `X` bekommst du die Zahl in Hexadezimal.
-	Es gibt für die Ausgabe von Enums keine Genauigkeitsangabe wie bei Zahlen.
-	Dein Enum wird automatisch mit `G` formatiert, wenn du keinen Formatbezeichner angibst.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Welchen Formatbezeichner verwendest du, wenn du den Text eines Enum-Wertes ausgeben willst?
-	Was musst du beachten, wenn du ein Bitfeld hast und einen kombinierten Wert ausgeben möchtest?
-	Wo kannst du den Formatbezeichner für Enums verwenden?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/KombinierteFormatierung).
-	Eine ausführliche Beschreibung der Formatbezeichner findest du bei [MSDN](https://msdn.microsoft.com/de-de/library/c3s1ez6e(v=vs.110).aspx)
