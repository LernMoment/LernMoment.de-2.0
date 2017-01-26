---
layout: post
title: Flag(ge) zeigen für Bitpopelei
date: 2015-08-26T06:00:00+02:00
excerpt: "Wie du mit [Flags] schnell ein Bitfeld aus deiner Enum machst."
share: true
modified:
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Datentypen, Enum]
image:
  feature: csharp-programmieren.jpg
---

Insbesondere wenn du Daten mit eingebetteten Systemen austauschst, kommst du früher oder später an den Punkt, dass du auf einzelne Bits zugreifen musst. Für die Wartbarkeit und Verständlichkeit deines Quelltextes ist es da gut, wenn du `Enum` verwendest. So können auch andere verstehen was die Bits und Bytes bedeuten.

Das Attribut `[Flags]` an einem `Enum` sagt, dass die Enumeration als Bitfeld verwendet werden soll. Um deine `Enum` tatsächlich so verwenden zu können, musst du allerdings noch ein paar weitere Vorkehrungen treffen.

Auch eine `Enum` mit `[Flags]` wird nicht automatisch in zweier Potenzen nummeriert. Wenn du also ein Bitfeld aufbauen willst, dann musst du die Nummerierung von Hand machen. Dies ist in den meisten Fällen auch sinnvoll, weil die Beziehung zwischen Name und Nummer vordefiniert ist (z.B. in einem Kommunikationsprotokoll). Ein Bitfeld, welches Informationen über den Gerätefehlerzustand liefert, könnte dementsprechend so erstellt werden:

```cs
[Flags]
enum DeviceErrorStatus : byte
{
	None = 0,
	HardwareError = 1,
	Hardware_CommunicationError = 2,
	Hardware_TemperatureTooHigh = 4,
	Hardware_MemoryCrcError = 8,
	WatchdogError = 16,
	SoftwareError = 32
}
```

Ein weiterer wichtiger Aspekt bei der Definition eines Bitfeldes ist die Verwendung von 0. Jede Variable vom Typ deiner `Enum` wird mit `0` initialisiert. Du solltest also bei der Definition deiner `Enum` darauf achten, dass der Eintrag mit der Enumerationskonstanten `0` entweder ein Standardwert ist oder `None`.

Eine andere Möglichkeit um Werte in Zweierpotenzen für die Einträge zu definieren ist der Schiebeoperator:

```cs
[Flags]
enum AccessRights : byte
{
	None	= 0,
	Read	= 1 << 0, // 1
	Write	= 1 << 1, // 2
	Execute	= 1 << 2, // 4

	ReadWrite = Read | Write
}
```

In dem vorherigen Beispiel siehst du gleich noch eine weitere Möglichkeit von `Enum` mit `[Flags]` Attribut. Du kannst einzelne Bits mit `OR` bzw. `|` kombinieren. So kannst du für häufig genutzte Kombinationen auch einen passenden Namen definieren. Dies macht deinen Quelltext verständlicher.

Jetzt erstmal viel Spaß beim Definieren von Bitfeldern

Jan

PS: Methoden und Operatoren, die dir bei der Verwendung eines Bitfelds behilflich sind, gibt es in einem weiteren LernMoment.

### Merke

-	Das `[Flags]` Attribut an einer `Enum` sagt, dass es für die `Enum` nicht nur einen ausgewählten Wert gibt, sondern das sie als Bitfeld behandelt werden soll.
-	Trotz `[Flags]` Attribut musst du selber für eine gültige Nummerierung in zweier Potenzen sorgen.
-	Der Wert `0` sollte entweder ein Standardwert sein oder `None`, da jede Instanz deines `Enums` mit `0` initialisiert wird.
-	Wenn du häufig Kombinationen von Bits verwendest, kannst du dafür einen Eintrag in deiner `Enum` definieren.
-	Neben der expliziten Nummerierung (0, 1, 2, 4, 8, ...) kannst du auch den Schiebeoperator `<<` bei der Definition verwenden.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie nummerierst du eine `Enum` die als Bitfeld verwendet werden soll?
-	Wie kannst du einen eigenen Eintrag für eine Kombination von Bits in einem Bitfeld machen?
-	Was passiert, wenn du das `[Flags]` Attribut an eine `Enum` schreibst?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/FlagsAttribut).
-	Eine gute Beschreibung zum Thema Bitfelder findest du auf [MSDN](https://msdn.microsoft.com/de-de/library/system.flagsattribute(v=vs.110).aspx).
