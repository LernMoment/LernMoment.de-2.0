---
layout: post
title: Extension Method - Wie du in 4 trivialen Schritten jede Klasse erweitern kannst
date: 2015-09-28T06:00:00+02:00
excerpt: Und warum du es nicht so häufig tun solltest
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Datentypen, Methoden]
image:
  feature: csharp-programmieren.jpg
---

Mit *Extension Methods*, oder *Erweiterungsmethoden* wie sie auf Deutsch heißen, kannst du auch Klassen erweitern, von denen du keinen Quelltext hast. Dabei solltest du allerdings aufpassen, dass du nicht plötzlich eine Sammlung von Funktionalität hast, die du sonst nirgendwo unterbringen konntest. Denn das ist ein (erstes) klares Indiz, dass dein *Design* ein Problem hat.

Die Schritte zum Erstellen und Verwenden einer *Extension Method* sind die folgenden.

#### 1. Entscheiden welchen Typen du erweitern willst

Du kannst jeden Typen erweitern. Egal ob es sich um einen Typen aus dem *.NET-Framework*, eine deiner eigenen Klassen, eine Klasse von einem anderen Entwickler oder auch ein *Interface* handelt. Es ist auch egal wo in der Vererbungshierarchie du ansetzt. So kannst du beispielsweise für `System.Object` wie auch für das *Interface* `System.Collections.Concurrent.IProducerConsumerCollection<T>` eine *Extension Method* definieren. Wobei es für das genannte *Interface* bereits knapp **135** *Extension Methods* gibt.

#### 2. Eine statische Klasse definieren

Eine *Extension Method* ist eine statische Methode die durch den *Compiler* so umgesetzt wird, dass sie sich wie eine *Instanzmethode* verhält. Diese statische Methode muss in einer statischen Klasse definiert sein.

Damit du entscheiden kannst, ob du deine *Extension Methods* in einer Klasse benutzen willst, oder nicht, ist es sinnvoll, dass du einen eigenen *Namensraum* dafür definierst. Das Beispiel von `IProducerConsumerCollection<T>` mit seinen 135 *Extension Methods* zeigt, dass es in *Intellisense* unübersichtlich werden kann, wenn so viele *Extension Methods* existieren. Hast du einen eigenen *Namensraum* für sie, dann kannst du per `using` entscheiden ob sie für eine Klasse relevant sind.

#### 3. Die Methode implementieren mit this

Deine *Extension Method* definierst du nun in der statischen Klasse aus dem vorherigen Schritt mit dem Schlüsselwort `this`. Dieses kommt vor den ersten Parameter der Methode. Dabei ist der erste Parameter von dem Typ, den du erweitern willst. Also jenen für den du dich in Schritt 1 entschieden hast.

Für die sonstige Implementierung der *Extension Method* gelten die gleichen Regeln wie für jede andere statischen Methode auch. Schließlich ist es ja auch eine statische Methode, die lediglich eine kleine Besonderheit hat.

#### 4. Verwende die Methode wie eine Instanzmethode

Du kannst deine *Extension Methode* nun verwenden, wie jede andere *Instanzmethode* deines Typs auch.

Abschließend noch Auszüge aus einem Beispiel welches [hier](http://geekswithblogs.net/BlackRabbitCoder/BlackRabbitCoder/archive/2013/03/08/c.net-little-wonders-extension-methods-demystified.aspx) genauer beschrieben ist. Für dieses Beispiel hat sich [James Michael Hare](http://geekswithblogs.net/BlackRabbitCoder/Default.aspx) entschieden das *Interface* `IEnumerable<T>` zu erweitern (Schritt 1) und ich habe es in der Klasse `LernMoment.Utils.EnumerableExtensions` realisiert (Schritt 2).

```cs
namespace LernMoment.Utils
{
  public static class EnumerableExtensions
  {
    // first argument is the source,second is the max size of each slice
    public static IEnumerable<IEnumerable<T>> Slice<T>(this IEnumerable<T> source, int size)
    {
      // can't slice null sequence
      if (source == null) throw new ArgumentNullException("source");
      if (size < 1) throw new ArgumentOutOfRangeException("size", "The size must be positive.");

      // force into a list to take advantage of direct indexing. Could also force into an 
      // array, use LINQ grouping, do a Skip()/Take(), etc...
      var sourceList = source.ToList();
      int current = 0;

      // while there are still items to "slice" off, keep going
      while (current < sourceList.Count)
      {
        // return a sub-slice using an iterator for deferred execution
        yield return sourceList.GetRange(current, Math.Min(size, sourceList.Count - current));
        current += size;
      }
    }
  }
}

namespace LernMoment
{
  using LernMoment.Utils;
  // die restlichen usings fehlen um das Beispiel klein zu halten
  class Beispiel
  {
    int[] items = Enumerable.Range(1, 1000).ToArray();

    Parallel.ForEach(items.Slice(10), s =>
      {
        foreach (var item in s)
        {
          Console.WriteLine(item);
        }
      });
  }
}
```

Jetzt erstmal viel Spaß mit dem Erweitern von nicht erweiterbaren Typen

Jan

### Merke

-	Mit einer *Extension Method* kannst du Funktionalität zu Typen hinzufügen, die du sonst nicht verändern kannst. Wie zum Beispiel alle Klassen, *Interfaces* und *Enums* aus dem *.NET-Framework*.
-	Durch *Extension Methods* kommst du leicht in die Versuchung dein *objekt-orientiertes Design* aufzuweichen.
-	Eine *Extension Method* ist eine statische Methode in einer statischen Klassen.
-	Der Typen, den du erweitern willst, ist der erste Parameter in der statischen Methode. Wobei du ihm voran ein `this` stellst.
-	Eine *Extension Method* kannst du an dem erweiterten Typ wie eine *Instanzmethode* verwenden.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie sieht der Quelltext für eine *Extension Method* aus, mit der du `String` erweiterst?
-	Für welche Typen kannst du eine *Extension Method* definieren?
-	Wie sieht der Quelltext aus in dem du eine *Extension Method* verwendest?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Eine Einführung in das Thema gibt es bei [MSDN](https://msdn.microsoft.com/de-de/library/bb383977.aspx).
-	In [diesem Artikel](http://geekswithblogs.net/BlackRabbitCoder/BlackRabbitCoder/archive/2013/03/08/c.net-little-wonders-extension-methods-demystified.aspx) gibt James Michael Hare eine detailierte Einführung in das Thema (in Englisch).
-	Scott Hanselman erklärt in [seinem Artikel](http://www.hanselman.com/blog/HowDoExtensionMethodsWorkAndWhyWasANewCLRNotRequired.aspx) warum *Extension Methods* keine Änderung an der *CLR* sondern nur am *Compiler* benötigen. Auch diesen Artikel gibt es nur in Englisch.
