---
layout: post
title: Ist C# unsicher per Design?
excerpt: Wie du das Schlüsselwort unsafe verwendest.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Konzept, Zeiger]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-11T06:00:00+02:00
---

Bei der Definition und Entwicklung von C# hat das Team rund um [Anders Hejlsberg](https://de.wikipedia.org/wiki/Anders_Hejlsberg), Chef-Architekt von C#, versucht, viele Anwendungsfälle zu berücksichtigen. Ein wichtiger war dabei, dass du selbst entscheiden kannst, ob dir Performance oder Interoperabilität wichtiger sind als Speicherverwaltung, Typsicherheit und so weiter. Anders als in anderen Programmiersprachen mit Laufzeitumgebung (wie beispielsweise Java oder Smalltalk), kannst du direkt in C# Zeiger verwenden, ohne Marshalling.

C# bietet dir das Schlüsselwort `unsafe`. Damit kannst du Zeiger in deinem Quelltext verwenden. Somit kannst du manchmal die Performance verbessern und es ist möglich, mit Programmen bzw. Bibliotheken außerhalb von managed .NET zu interagieren.

Mit diesem Schlüsselwort kannst du einfach einen Block in einer Funktion definieren:

```cs
static void Main()
{
    int var = 20;

    unsafe
    {
    	int* p = &var;
    	Console.WriteLine("Der Wert der Variable ist: {0} ",  var);
    	Console.WriteLine("Der Wert der Variable, auf die der Zeiger zeigt: {0} ",  p->ToString());
    	Console.WriteLine("Die Adresse der Variable ist: {0}",  (int)p);
    }

    Console.ReadKey();
}
```

Du kannst `unsafe` auch auf Methoden, Klassen und Strukturen verwenden. Alleine die Verwendung des Schlüsselwortes `unsafe` reicht allerdings nicht aus. Du musst dem Compiler ganz explizit sagen, dass dein Quelltext diese Funktion verwenden darf. Dazu gibt es die Compiler-Option `/unsafe`. Ein entsprechendes Häkchen findest du in den Projekteinstellungen deiner Entwicklungsumgebung.

Mit diesem Schlüsselwort schaltest du nicht nur die Typsicherheit aus, sondern musst dich auch selbst um den [Garbage Collector](/csharp-programmieren/der-garbage-collector/) kümmern. Dieser versucht nämlich, im Hintergrund die Speicherbelegung zu optimieren. Dazu kann er Objekte im Speicher hin und her schieben. Ein Zeiger ist jedoch letztlich nichts anderes als eine Speicheradresse. So kann es passieren, dass der Garbage Collector das Objekt bereits an eine andere Stelle geschoben hat und dein Zeiger ins "Nichts" bzw. auf ein falsches Objekt zeigt.

Wenn es dir um den Zugriff auf native Programme/Bibliotheken geht, sollte dir bewusst sein, dass es einige Alternativen gibt. Anstelle von `unsafe` und Zeigern, kannst du beispielsweise auch `IntPtr` oder `SafeHandle` verwenden. Sie sind nicht komplett vergleichbar weil sie etwas unterschiedliche Probleme lösen. Allerdings bieten diese Alternativen mehr Sicherheit.

Jetzt erstmal viel Spaß mit unsicherem Quelltext

Jan


### Merke

-	Die Verwendung von Zeigern und `unsafe` in C# war eine bewusste Entscheidung der C# Entwickler.
-	Wenn du mit dieser Methode Zeiger in C# verwendest, gehst du ein höheres Risiko ein als in C/C++, weil du die Eigenheiten von C# und .NET bezüglich Zeigern kennen musst.
-	Der GarbageCollector schiebt Objekte im Speicher ganz nach Bedarf hin und her. Daher kann ein Zeiger plötzlich ins "Nichts" zeigen.
-	`unsafe` kann als Block in einer Methode oder auch auf einer kompletten Methode, Klasse oder Struktur verwendet werden.
-	Die aus C/C++ bekannten Zeigeroperationen wie Dereferenzierung und Arithmetik sind auch in C# im `unsafe` Kontext verfügbar.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was kannst du mit dem Schlüsselwort `unsafe` erreichen?
-	Auf welche Elemente kannst du `unsafe` verwenden?
-	Was sind Probleme bzw. Risiken bei der Verwendung von `unsafe`?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/UnsafeEinfuehrung).
-	[Hier](http://openbook.rheinwerk-verlag.de/visual_csharp_2012/1997_10_010.html#dodtp6507ea6d-ba13-49af-9560-8059bb666759) eine recht allgemeine und oberflächliche Einführung in das Thema `unsafe`
-	In [diesem Interview](http://www.windowsdevcenter.com/pub/a/oreilly/windows/news/hejlsberg%5F0800.html) begründet Anders Hejlsberg, warum `unsafe` wichtig ist für C#.
-	[MSDN](https://msdn.microsoft.com/de-de/library/t2yzs44b.aspx) hat auch eine Einführung in die Verwendung von `unsafe`.
