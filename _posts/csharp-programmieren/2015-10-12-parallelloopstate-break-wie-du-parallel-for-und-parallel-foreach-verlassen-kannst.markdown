---
layout: post
title: ParallelLoopState.Break - Wie du Parallel.For und Parallel.ForEach verlassen kannst
date: 2015-10-12T06:00:00+02:00
excerpt: Bei der parallelen Abarbeitung von Schleifen ist das Verlassen komplizierter.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Async, Schleifen]
image:
  feature: csharp-programmieren.jpg
---

Im LernMoment ["Parallel.ForEach und thread-lokale Variablen"](/csharp-programmieren/parallel-foreach-und-threadlokale-daten/) hast du gesehen, wie einfach die parallele Ausführung von komplexeren Schleifen sein kann. Willst du deine parallel laufende Schleife allerdings verlassen, dann wird es komplizierter.

Du kannst eine `Parallel.For` oder `Parallel.ForEach` nicht einfach mit `break` unterbrechen. `break` ist ein Schlüsselwort, welches nur in Schleifen (bzw. `switch`-Anweisungen) verwendet werden kann. Um nun die parallele Schleife nicht immer bis zum Ende laufen lassen zu müssen, gibt es die Klasse `ParallelLoopState`. Diese bietet dir eine `Break` Methode an.

Die `ParallelLoopState.Break` Methode ist in ihrem Verhalten dem `break` für sequentielle Schleifen nach empfunden. Hier eine einfache `for`-Schleife:

```cs
for (int i = 1; i <= 40; i++)
{
    Console.Write(i + " ");
    if (i >= 35)
    {
        Console.WriteLine("Schleife wurde verlassen bei Index: {0}", i);
        break;
    }
}
```

Es ist somit klar, dass alle Iterationen bis zur Abbruchbedingung ausgeführt wurden. Genauso ist es auch bei der parallelen Abarbeitung. Dabei gilt zu beachten, dass je nach Anzahl von vorhandenen Prozessoren bzw. Kernen und vielen weiteren Bedingungen der Datenbereich, der in der Schleife bearbeitet werden soll, partitioniert wird. 

Bei dem vorherigen Beispiel könnte es beispielsweise sein, dass die Ausführung der Iterationen mit Index 1 bis 20 der Partition A zugewiesen werden, während die verbleibenden Iterationen der Partition B zugewiesen werden. Wenn diese Partitionen nun parallel bearbeitet werden, wird Partition B sofort abgebrochen. Die Abarbeitung von Partition A wird allerdings nicht gestoppt, weil die Daten bzw. der Index in dieser Partition die Abbruchbedingung noch nicht erfüllen.

Selbst wenn die Abarbeitung von Partition A noch nicht gestartet wurde, und in Partition B bereits die Abbruchbedingung erkannt wurde, wird Partition A ganz normal abgearbeitet. Bei `ParallelLoopState.Break` kannst du also nicht vorhersagen welches Ergebnis du bekommst. Alles hängt von der Partitionierung und der Zuweisung der Partitionen zu Tasks ab.

Ein Objekt der Klasse `ParallelLoopState` wird automatisch angelegt, wenn du eine entsprechende Variante der `Parallel.For` oder `Parallel.ForEach` Methode benutzt. Du kannst bestimmen wie die Instanz heißen soll. Die Aufgabe dieser Klasse ist es Informationen zwischen parallel laufenden Partitionen auszutauschen. Allerdings kannst du darin keine Nutzdaten transportieren, sondern es wird lediglich der Zustand der Schleife ausgetauscht.

Im Kontext von `ParallelLoopState.Break` ist die Eigenschaft `LowestBreakIteration` von Interesse. Damit kannst du feststellen, ob für eine Partition bereits `Break` aufgerufen wurde und wenn ja bei welchem Index. Mit dieser Eigenschaft kannst du ein weiteres Phänomen erkunden. Wie bereits gesagt, mit `ParallelLoopState.Break` wird dir garantiert, dass alle Iterationen bis zur Abbruchbedingung ausgeführt werden. Es kann allerdings auch passieren, dass (wesentlich) mehr Iterationen ausgeführt werden:

```cs
Parallel.For(1, 40, (i, loopState) =>
{
    Console.WriteLine(string.Format(
        "Index: {0}, LowestBreakIteration: {1}", i, loopState.LowestBreakIteration));
    if (i >= 15)
    {
        loopState.Break();
    }
});
 
/* Die vorherige Parallel.For könnte diese Ausgabe erzeugen              
Index: 10 LowestBreakIteration: 
Index: 11 LowestBreakIteration: 
Index: 21 LowestBreakIteration: 
Index: 1 LowestBreakIteration: 
Index: 2 LowestBreakIteration: 21
Index: 3 LowestBreakIteration: 21
Index: 6 LowestBreakIteration: 21
Index: 7 LowestBreakIteration: 21
Index: 8 LowestBreakIteration: 21
Index: 9 LowestBreakIteration: 21
Index: 12 LowestBreakIteration: 21
Index: 13 LowestBreakIteration: 21
Index: 14 LowestBreakIteration: 21
Index: 15 LowestBreakIteration: 21
Index: 4 LowestBreakIteration: 21
Index: 5 LowestBreakIteration: 15
*/
```

In diesem Beispiel siehst du, dass auch die Iteration mit *Index 21* bearbeitet wurde. Dieses ist ein wesentlicher Unterschied zum Verlassen einer sequentiellen Schleife. Gäbe es in diesem Beispiel einen größeren Datenbereich (z.B. 1 - 9999), dann könnten noch wesentlich mehr Iterationen bearbeitet worden sein, als du womöglich erwartet hast.

Das Beispiel zeigt auch, dass `LowestBreakIteration` langsam der eigentlichen Abbruchbedingung entgegenkommen kann. Da durch die Partitionierung die Abbruchbedingung (`i >= 15`) für eine Partition sofort erfüllt war (bei `i == 21`), wurde diese Iteration erstmal als `LowestBreakIteration` benutzt. Möchtest du nach der parallelen Schleife wissen, bei welchem Index aufgehört wurde, stellt dir ein Objekt der Klasse `ParallelLoopResult` diesen Wert in seinr `LowestBreakIteration` bereit.

Jetzt erstmal viel Spaß mit dem vorzeitigem Verlassen von parallelen Schleifen

Jan

### Merke

-	Obwohl die Verwendung von `Parallel.For` und `Parallel.ForEach` einfach ist, hast du es immer noch mit Parallelität zutun. Somit kann auch dieses scheinbar einfache Konstrukt kompliziert werden.
-	Die konkrete Abarbeitung von parallelen Schleifen ist abhängig von der Partitionierung der Daten.
-	Auch wenn `ParallelLoopState.Break` in einer Partition bereits aufgerufen wurde, kann es noch Partitionen geben, die komplett oder teilweise abgearbeitet werden.
-	Genau wie bei einer sequentiellen Schleife werden alle Elemente vom Start bis zur Abbruchbedingung in einer parallelen Schleife bearbeitet. Es kann allerdings auch passieren, dass noch mehr Elemente bearbeitet werden.
-	Die Eigenschaft `LowestBreakIteration` ist innerhalb der parallelen Schleife über eine Instanz von `ParallelLoopState` verfügbar und außerhalb der Schleife über `ParallelLoopResult`.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wenn du eine `Parallel.For`-Schleife von Index 1 bis 1000 hast und diese bei Index 250 verlassen wird, welche Indizes werden auf garantiert bearbeitet?
-	Wie heißt die Methode zum Verlassen einer parallelen Schleife?
-	Was sagt die Eigenschaft `LowestBreakIteration` aus und an welchen Klassen gibt es sie?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	In [diesem umfangreichen Artikel](https://magazin.c-plusplus.net/artikel/Parallelisierung%20mit%20.NET%204.0%20-%20Teil%20I) gibt es eine kurze Beschreibung von `ParallelLoopState.Break` auf Deutsch.
-	Eine verständliche Beschreibung (nur in Englisch) zu diesem Theam findest du im [Artikel](http://www.blackwasp.co.uk/ParallelLoopBreak.aspx) auf BlackWasp.
-	Eine umfangreiche Erläuterung zu parallelen Schleifen gibt es auf [MSDN](https://msdn.microsoft.com/en-us/library/ff963552.aspx). Diese gibt es nicht auf Deutsch und ist teilweise auch schwer verständlich.
-	Die Klasse `Parallel` wird in vielen der ["Samples for Parallel Programming with the .NET Framework"](https://code.msdn.microsoft.com/ParExtSamples) verwendet.
-	Die Beschreibung der Klasse [ParallelLoopState](https://msdn.microsoft.com/de-de/library/system.threading.tasks.parallelloopstate(v=vs.110).aspx) findest bei MSDN auch in Deutsch.
