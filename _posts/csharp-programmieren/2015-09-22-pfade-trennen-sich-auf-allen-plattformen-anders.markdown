---
layout: post
title: Pfade trennen sich auf allen Plattformen anders
date: 2015-09-22T06:00:00+02:00
excerpt: InspirationsMoment - System.IO.Path.Combine
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Inspiration, File, Cross-Platform]
image:
  feature: csharp-programmieren.jpg
---

Du weißt nicht was ein InspirationsMoment ist? Im Hintergrundartikel ["Mehr Output! Weniger Input!"](/hintergrund/mehr-output-weniger-input/) bekommst du mehr Informationen dazu.

### System.IO.Path

Wie oft hast du in Pfadangaben eigentlich schon `+ "\\" +` oder `@"C:\blabla.txt"` verwendet. Sowohl in [StackOverflow](http://stackoverflow.com) wie auch in [GitHub](https://github.com) kannst du Pfade mit solchen Angaben immer wieder finden. Das Problem damit ist, dass es sowohl für *Cross-Plattform* Anwendungen ungeeignet ist, wie auch häufig zu unerwünschten Resultaten führt: `c:\Program Files\LernMomente\\settings.xml`. Somit kann es nicht nur sein, dass deine Datei nicht gefunden wird, sondern, dass sie auch an einer ganz anderen Stelle liegt als du eigentlich wolltest.

Um dieses Problem zu umgehen, gibt es im Namensraum `System.IO` die Klasse `Path`. Sie kennt nicht nur für alle Plattformen das richtige Pfadtrennzeichen ([DirectorySeparatorChar](https://msdn.microsoft.com/de-de/library/system.io.path.directoryseparatorchar(v=vs.110).aspx)), sondern setzt es auch passend in Pfade ein ([Combine](https://msdn.microsoft.com/de-de/library/fyy7a5kt(v=vs.110).aspx)).

Du solltest also zukünftig nur noch diese Klasse benutzen um immer gültige Pfade zu erstellen. Übrigens, im Gegenteil zu manch anderen Klassen (z.B. `Directory`), überprüfen die meisten Methoden von `Path` nicht ob die in einem Pfad angegebene Datei auch tatsächlich existiert.

### Interessante Links 

-	Die Implementierung von System.IO.Path.Combine bei [Microsoft Reference Source](http://referencesource.microsoft.com/#mscorlib/system/io/path.cs,65c63f5b94b2ac9b).
-	Die Beschreibung der Klasse bei [MSDN](https://msdn.microsoft.com/de-de/library/system.io.path(v=vs.110).aspx) mit einer unglaublich schlechten Übersetzung. Die Beschreibung in Englisch findest du [hier](https://msdn.microsoft.com/en-us/library/system.io.path(v=vs.110).aspx).
-	Es gibt viele Beispiele für die Verwendung dieser Klasse bei GitHub. Ein bekanntes Projekt ist das [aws-sdk-net](https://github.com/aws/aws-sdk-net) von Amazon. Ein Beispiel gibt es in der Klasse [InternalSDKUtils](https://github.com/aws/aws-sdk-net/blob/master/sdk/src/Core/Amazon.Util/Internal/_bcl/InternalSDKUtils.bcl.cs).

Viel Spaß beim *"richtigen"* Trennen deiner Pfade

Jan


PS: Gefällt dir das Konzept des InspirationsMoment? Über ein kurzes [Feedback](mailto:jan@lernmoment.de) würde ich mich freuen.
