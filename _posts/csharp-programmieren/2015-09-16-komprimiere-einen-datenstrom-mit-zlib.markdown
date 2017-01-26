---
layout: post
title: Komprimiere deinen Datenstrom mit zlib
date: 2015-09-16T06:00:00+02:00
excerpt: InspirationsMoment - System.IO.Compression.DeflateStream
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Inspiration, Komprimierung, Serialisierung]
image:
  feature: csharp-programmieren.jpg
---

Willkommen zum ersten InspirationMoment. Wenn du davon noch nichts gehört hast, bekommst du im Hintergrundartikel ["Mehr Output! Weniger Input!"](/hintergrund/mehr-output-weniger-input/) mehr Informationen dazu.

### DeflateStream

Es geht heute um die Klasse `DeflateStream`. Du findest sie im Namensraum `System.IO.Compression`. Mit ihr kannst du einen Datenstrom, welcher von `System.IO.Stream` abgeleitet wurde, komprimieren. Seit .NET 4.5 wird dazu die zlib Bibliothek verwendet. Davor wurde eine Kombination des [LZ77 Algorithmus](https://de.wikipedia.org/wiki/LZ77) und [Huffman-Kodierung](https://de.wikipedia.org/wiki/Huffman-Kodierung) verwendet.

Ab .NET 4.0 kann diese Klasse auch mit Dateien umgehen, die größer als 4GB sind.

### Interessante Links 

-	Die Beschreibung der Klasse findest du auf [MSDN](https://msdn.microsoft.com/de-de/library/system.io.compression.deflatestream(v=vs.110).aspx). Dort gibt es auch ein Beispiel wie `DeflateStream` mit `FileStream` verwendet wird.
-	Auf Github.com habe ich von [Teodor92](https://github.com/Teodor92/University/blob/master/eBusiness/SimpleBookstore/SimpleBookStore.Common/Extensions/CompressStringExtensions.cs) eine Klasse gefunden die den `DeflateStream` in Extension-Methods kapselt. Dort kannst du sehen wie `DeflateStream` mit `MemoryStream` zusammen arbeitet.
-	Natürlich hat auch Mono die Klasse `DeflateStream`. Dazu gibt es auf [GitHub.com](https://github.com/n4t/mono/blob/master/mcs/class/System/Test/System.IO.Compression/DeflateStreamTest.cs) sogar einige Unittests.


Viel Spaß mit dem Komprimieren deiner Daten

Jan


PS: Gefällt dir das Konzept des InspirationsMoment? Über ein kurzes [Feedback](mailto:jan@lernmoment.de) würde ich mich freuen.
