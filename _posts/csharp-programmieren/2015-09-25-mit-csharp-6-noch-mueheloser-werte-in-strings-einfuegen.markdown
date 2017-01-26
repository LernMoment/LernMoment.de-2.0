---
layout: post
title: Mit C# 6.0 noch müheloser Werte in Strings einfügen
date: 2015-09-25T06:00:00+02:00
excerpt: InspirationsMoment - String Interpolation
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Inspiration, Datentypen, C# 6.0]
image:
  feature: csharp-programmieren.jpg
---

Du weißt nicht was ein InspirationsMoment ist? Im Hintergrundartikel ["Mehr Output! Weniger Input!"](/hintergrund/mehr-output-weniger-input/) bekommst du mehr Informationen dazu.

### String Interpolation - Der Turbo für "Kombinierte Formatierung"

Das Thema *kombinierte Formatierung* kennst du bestimmt schon aus einem dieser LernMomente:

-	[Kombinierte Formatierung für Konsole, Datei, ...](/csharp-programmieren/kombinierte-formatierung-fuer-konsole-datei/)
-	[Kombinierte Formatierung - Zahlenformate](/csharp-programmieren/kombinierte-formatierung-zahlenformate/)
-	[Kombinierte Formatierung - Enumformate](/csharp-programmieren/kombinierte-formatierung-enumformate/)
-	[Mit der Ausrichtungskomponente zu erstaunlichen Ausgaben](/csharp-programmieren/mit-der-ausrichtungskomponente-zu-erstaunlichen-ausgaben/)

Nun gibt es in C# 6.0 die neue Funktionalität *"String Interpolation"*. Es ist sozusagen eine Verbesserung der *kombinierten Formatierung*. Du kannst jetzt einfach folgendes schreiben, wenn du einen Wert als Teil eines `string` ausgeben willst:

```
int einWert = 42;
Console.WriteLine($"{einWert} ist die Antwort auf die Frage des Lebens.");
```

Wie du siehst entfällt durch Verwendung der *String Interpolation* das Einfügen der Werte via Index. Du kannst ganz einfach die Werte inklusive der optionalen Formatierung und Ausrichtung in deinen `string` einfügen. Dazu muss der `string` mit einem *$* vor den Anführungszeichen beginnen. Jeden Wert den du einfügen möchtest, must du dann in geschweifte Klammern setzen. Der Compiler sorgt  dafür, dass aus diesem `string` eine *kombinierte Formatierung* mit Index gamcht wird.

### Interessante Links 

-	Die Einführung in dieses Thema bietet wie immer [MSDN](https://msdn.microsoft.com/de-de/library/dn961160.aspx)

Viel Spaß beim einfachen Ausgeben deiner Werte

Jan


PS: Gefällt dir das Konzept des InspirationsMoment? Über ein kurzes [Feedback](mailto:jan@lernmoment.de) würde ich mich freuen.
