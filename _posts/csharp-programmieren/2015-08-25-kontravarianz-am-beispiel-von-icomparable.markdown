---
layout: post
title: Was ist eigentlich Kontravarianz für Generics?
excerpt: Verstehe das Konzept mühelos am Beispiel von IComparable.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Generics, Datentypen]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-25T06:00:00+02:00
---

In [Kovarianz und Felder](/csharp-programmieren/kovariante-felder/) hast du gesehen, dass das Konzept der Kovarianz bei Feldern etwas kompliziert ist, aber die praktische Umsetzung sehr einfach. Nun möchte ich dir zeigen wie du generische Interfaces mit kontravarianten Typen verwendest.

Als Beispiel habe ich mal `IComparable<T>` genommen. Dies ist eines von vielen Interfaces, welches sich mit dem Vergleich von Objekten beschäftigt. Mit `IComparable<T>` kannst du deiner Klasse ein Standardverhalten für das Vergleichen von Objekten deiner Klasse mitgeben. Bei einer Klasse `LernMoment` könntest du beispielsweise sagen, dass eine Instanz von `LernMoment` größer als eine andere ist, wenn die Eigenschaft `ErschienenAm` neuer ist.

Was aber hat das nun mit Kontravarianz zutun? Schau dir dazu mal folgende Aussage für den Typparameter `in T` der Definition `public interface IComparable<in T>` an:

> Dieser Typparameter ist Contravariant. Das heißt, Sie können entweder den angegebenen Typ oder einen weniger abgeleiteten Typ verwenden.
> --<cite>[MSDN](https://msdn.microsoft.com/de-de/library/4d7sx9hd(v=VS.110).aspx)</cite>

Bei Kontravarianz kannst du anstelle vom Typ `T` eine Klasse verwenden von der `T` erbt. Um das etwas genauer anzuschauen, nehmen wir folgende Klassenhierarchie:

```cs
class LernMoment : IComparable<LernMoment> { }
class LernMomentCSharp : LernMoment, IComparable<LernMomentCSharp> { }
```

Das Zitat der MSDN will dir nun sagen, dass du folgendes machen kannst:

```cs
IComparable<LernMomentCSharp> derVergleich = new LernMoment();
```

Die Kontravarianz erlaubt dir, dass du, auch wenn der Typ `IComparable<LernMomentCSharp>` gefordert ist, einen weniger abgeleiteten Typen verwenden kannst. In diesem Beispiel ist das `IComparable<LernMoment>`. Beide Klassen können `CompareTo`, die einzige Methode von `IComparable<T>`, nun nach ihren jeweiligen Bedürfnissen realisieren.

So wäre es möglich, dass `LernMoment` den Vergleich basierend auf der Eigenschaft `ErschienenAm` macht, während `LernMomentCSharp` vielleicht eher die Eigenschaft `Name` verwendet. Das Interface und die `CompareTo` Methode verwendest du übrigens selten direkt. Insbesondere Sortieralgorithmen wie `List<T>.Sort` verwenden sie.

Im [Beispielquelltext](https://github.com/LernMoment/csharp/tree/master/IComparableKontravarianz) zeige ich dir mit welchem einfachen Trick du `List<LernMomentCSharp>.Sort` sagen kannst, welche Variante der `CompareTo` Methode verwendet werden soll.

Jetzt erstmal viel Spaß mit dem Vergleich verschiedener Vererbungsstufen

Jan


PS: Eine wirklich sinnvolle Verwendung von Kontravarianz an generischen Interfaces bietet übrigens `IComparer<T>`. Das ist aber Stoff für einen weiteren LernMoment.

### Merke

-	Kovarianz und Kontravarianz gibt es auch für Delegates und Interfaces mit generischen Typen.
-	Wenn ein generischer Typ in einem Interface kovariant ist, heißt dass, das du den angegebenen Typen oder einen von ihm abgeleiteten verwenden kannst.
-	Wenn ein generischer Typ in einem Interface kontravariant ist, heißt dass, das du den angegebenen Typen oder einen Typen von dem er erbt, verwenden kannst.
-	Mit `IComparable<T>` kannst du das Standardverhalten für Vergleiche (insbesondere für Sortieralgorithmen) einer Klasse definieren.
-	Wenn du zusätzliche Vergleiche brauchst, dann kannst du `IComparer<T>` verwenden.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was bedeutet es, wenn an einem generischen Interface steht, dass der Typparameter kontravariant ist?
-	Was macht `IComparable`?
-	Was ist der Unterschied zwischen Kovarianz und Kontravarianz?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/IComparableKontravarianz).
-	Einen groben Überblick inklusive weiterer Links zum Thema Kovarianz und Kontravarianz findest du [hier](http://blogs.msdn.com/b/csharpfaq/archive/2010/02/16/covariance-and-contravariance-faq.aspx).
-	Eine sehr detailierte und mathematische Erklärung gibt [dieser](http://tomasp.net/blog/variance-explained.aspx/) Artikel.
-	Eine weitere sehr gute Einführung in das Thema findest du auf [MSDN](https://msdn.microsoft.com/de-de/library/dd799517(v=vs.110).aspx)
