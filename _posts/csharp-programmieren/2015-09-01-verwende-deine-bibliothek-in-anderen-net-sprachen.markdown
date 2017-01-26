---
layout: post
title: Verwende deine C# Bibliothek in anderen .NET Sprachen
date: 2015-09-01T06:00:00+02:00
share: true
excerpt: Der Trick mit CLSCompliant
modified:
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Compiler, Runtime]
image:
  feature: csharp-programmieren.jpg
---

Knapp 60 Programmiersprachen werden, laut [Wikipedia](https://de.wikipedia.org/wiki/Liste_von_.NET-Sprachen), aktuell von .NET unterstützt. Dabei hat jede ihre Stärken und Schwächen. Du kannst, je nach Aufgabe entsprechend, dir eine passende auswählen. So kannst du beispielsweise für die Automatisierung von Administrationsaufgaben Windows Power Shell oder auch IronRuby verwenden. Du könntest auch entscheiden, dass du einige Algorithmen in F#, aber die Oberfläche deiner Anwendung lieber in C# mit WPF, entwickeln möchtest.

Dies wird dir ermöglicht durch die *Common Language Specification (CLS)*. Diese, durch die [ECMA](http://www.ecma-international.org/publications/standards/Ecma-335.htm) standardisierte Spezifikation, definiert welche Features alle Sprachen in .NET gemeinsam haben. Wenn du dich bei der Entwicklung einer Bibliothek in C# an die Regeln der *CLS* hälst, kann deine Bibliothek aus Anwendungen benutzt werden, die in einer anderen *CLS* konformen Sprache geschrieben wird. So ist es beispielsweise sehr einfach möglich, dass du Klassen aus einer C#-Assembly in einem PowerShell-Skript oder einer VB.NET Anwendung benutzt.

Grundsätzlich kannst du in diesem Kontext zwischen *Language Independence* und *Cross-Language Interop* unterscheiden. Bei der *Language Independence*, also Sprachunabhängigkeit, geht es darum, dass du eine Komponente (z.B. eine Bibliothek verpackt in eine Assembly) so erstellst, dass sie von jeder anderen .NET-Sprache benutzt werden kann. Das *Cross-Language Interop* geht sogar noch einen Schritt weiter. Dabei geht es darum, dass du in einer Komponente mehrere Sprachen verwendest.

Wenn du eine Bibliothek in C# erstellen willst, die sprachunabhängig verwendet werden kann, dann benötigst du das Attribut `CLSCompliant`. Möchtest du deine ganze Assembly so definieren, fügst du einfach der Datei `AssemblyInfo.cs` folgende Zeile hinzu: `[assembly: CLSCompliant(true)]`.

Damit prüft der Compiler die öffentliche Schnittstelle deiner Assembly, ob sie gegen Regeln der *CLS* verstößt. Eine dieser Regeln besagt, dass Ganzzahlen nicht `unsigned` definiert sein dürfen (mit Ausnahme von `Byte`). Sollte die öffentliche Schnittstelle deiner Assembly dennoch einen `unsigned` Datentypen verwenden, musst du dies entweder ändern, oder die Methode / Eigenschaft mit `[CLSCompliant(false)]` definieren. Dadurch sagst du, dass diese Methode / Eigenschaft nicht in einer anderen Sprache verwendet werden kann.

Sprachunabhängigkeit bekommst du nicht umsonst. Wenn du also sicher bist, dass du sie nicht brauchst, dann solltest du auch `CLSCompliant` nicht verwenden, oder `[assembly: CLSCompliant(false)]` definieren. Jedoch gerade für Bibliotheken oder sehr wichtige Teile deiner Anwendung, wie das Model mit der Businesslogik, ist *CLS*-Konformität eine super Möglichkeit für Wiederverwendung.

Jetzt erstmal viel Spaß mit der Erkundung von Sprachunabhängigkeit

Jan


### Merke

-	Die *Common Language Specification (CLS)* definiert welche Features alle Sprachen in .NET gemeinsam haben.
-	Sprachunabhängigkeit (*Language Independence*) besagt, dass eine Komponente in jeder anderen .NET-Sprache verwendet werden kann.
-	Es gibt die Möglichkeit mehrere Sprachen innerhalb einer Komponente (z.B. Assembly) zu verwenden. Dies wird *Cross-Language Interop* genannt.
-	Mit `[assembly: CLSCompliant(true)]` definierst du eine ganze Assembly als sprachunabhängig. Diese Anweisung kann außerhalb von Klassen und Namensräumen verwendet werden. Am besten in der Datei `AssemblyInfo.cs`.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was bedeutet Sprachunabhängigkeit?
-	Wie kannst du einzelne Methoden / Eigenschaften als nicht sprachunabhängig definieren?
-	Wie wird eine Assembly als sprachunabhängig definiert?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Ein gutes Beispiel für Sprachunabhängigkeit zeigt dir die [C#-Anbindung von Tinkerforge](https://github.com/Tinkerforge/generators/blob/master/csharp/IPConnection.cs)
-	Das `CLSCompliant` Attribut ist auf [MSDN](https://msdn.microsoft.com/de-de/library/system.clscompliantattribute(v=vs.110).aspx) genauer beschrieben.
-	Eine sehr umfangreiche Einführung in das Thema gibt es ebenfalls auf [MSDN](https://msdn.microsoft.com/de-de/library/vstudio/12a7a7h3(v=vs.110).aspx)
