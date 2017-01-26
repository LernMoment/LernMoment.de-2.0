---
layout: post
title: yield return - Schlüsselwort für verzögerte Ausführung
date: 2015-09-24T06:00:00+02:00
excerpt: Ist deine IEnumerable eifrig oder träge?
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Methoden, Generics]
image:
  feature: csharp-programmieren.jpg
---

Wenn du eine eigene Methode zum Iterieren von Auflistungen (das muss nicht unbedingt eine *Collection* sein) schreibst, dann kann dir `yield return` Arbeit abnehmen. Dabei musst du dich entscheiden, ob du alle Elemente auf einmal bearbeitest (*eager evaluation*), oder ob du ein Element immer nur dann bearbeitest, wenn es gerade gebraucht wird (*lazy evaluation*).

#### Sofortige Ausführung

Wenn du eine Methode wie zum Beispiel `int Quadriere(int wert)` hast, und diese auf eine ganze Reihe von Werten anwenden möchtest, kannst du das so machen:

```cs
IEnumerable<int> ZahlenreiheQuadrieren(int maxIndex)
{
  var result = new int[maxIndex];
  for(int i = 0; i < maxIndex; i++)
  {
      result[i] = Quadriere(i);
  }
  return result;
}
```

Es gibt wesentlich elegantere Möglichkeiten, aber mit dieser Lösung kommst du zum Ziel. Rufst du diese Methode wie folgt auf, dann wird das neue Feld sofort angelegt, mit den entsprechenden Zahlen gefüllt und du hast direkten Zugriff darauf:

```cs
IEnumerable<int> quadrierteZahlen = ZahlenreiheQuadrieren(5);
```

#### Verzögerte, aber eifrige Ausführung

Eine ähnliche Lösung kannst du auch mit `yield return` erzeugen:

```cs
IEnumerable<int> ZahlenreiheQuadrieren(int maxIndex)
{
    var result = new int[maxIndex];
    for(int i = 0; i < maxIndex; i++)
    {
        result[i] = Quadriere(i);
    }
    foreach(var value in result)
    {
        yield return value;
    }
}
```

Rufst du diese Variante auf, ist der Ablauf anders. Denn das Aufrufen, also `IEnumerable<int> quadrierteZahlen = ZahlenreiheQuadrieren(5);` erzeugt nun nicht mehr sofort das Feld und macht alle Berechnungen, sondern es wird lediglich ein Objekt angelegt und `quadrierteZahlen` zugewiesen. Dieses Objekt weiß, dass bei jedem Zugriff auf `quadrierteZahlen` der definiert Methodenrumpf ausgeführt werden muss und speichert für `maxIndex` den Wert 5.

Erst wenn du das erstmal auf `quadrierteZahlen` zugreifst (z.B. erste Iteration von `foreach(var quadratZahl in quadrierteZahlen) ...`), wird das entsprechende Feld angelegt, alle Zahlen berechnet und schließlich die erste berechnete Zahl zurückgegeben. Durch die Verwendung von `yield return` gibt es also eine verzögerte Ausführung des Methodenrumpfes. *Eager evaluation* bedeutet hier, dass bei der ersten Iteration alles bearbeitet wird und in den folge Iterationen nur noch das jeweilige Element zurückgegeben wird.

#### Verzögerte und träge Ausführung

Du kannst das ganze aber auch noch weiter verzögern:

```cs
IEnumerable<int> ZahlenreiheQuadrieren(int maxIndex)
{
    for(int i = 0; i < maxIndex; i++)
    {
        yield return Quadriere(i);
    }
}
```

Bei dieser Variante wird die Berechnung tatsächlich erst in jeder Iteration von `foreach(var quadratZahl in quadrierteZahlen) ...` ausgeführt. Es gibt also keinen initialen Aufwand um das Feld anzulegen und alle Elemente darin zu berechnen, sondern der Aufwand ist gleichmäßig über die Iterationen der `foreach` Schleife verteilt.

#### Nicht jedes IEnumerable<T> verhält sich gleich

Wenn du dir die 3 Varianten anschaust, gibt es einen wesentlichen Unterschied. Bei der *sofortigen Ausführung*, bekommst du einen *Iterator*, der dir direkten Zugriff auf die Auflistung ermöglicht. So kannst du mit dem *Iterator* Werte direkt in der Auflistung verändern (sofern der Typ der Auflistung dies erlaubt) und siehst bei weiterer Verwendung der gleichen *Iterator*-Instanz die Änderungen. Im Beispiel oben, referenziert der *Iterator* das temporäre Feld und bewahrt es so vor dem *Garbage Collector*.

Bei der *verzögerten Ausführung*, egal ob eifrig oder träge, ist das anders. Sie bewirkt, dass im Moment des Zugriffs auf ein Element der Auflistung mit dem *Iterator*, dieses Element erst erzeugt wird. Sofern dieses Element nicht explizit referenziert wird, ist es sofort für den *Garbage Collector* freigegeben. Nur mit dem *Iterator* kannst du also die Auflistung nicht ändern. Entsprechende Beispiele findest du im Quelltext zu diesem LernMoment.

Jetzt erstmal viel Spaß mit beim eifrigen oder trägen Zugriff

Jan

### Merke

-	Ein `IEnumerable<T>` verhält sich bei *sofortiger Ausführung* wesentlich anders als bei *verzögerter Ausführung*.
-	Erstellst du eine *Iterator*-Methode mit `yield return`, handelt es sich um verzögerte Ausführung.
-	Bearbeitest du alle Elemente einer Auflistung (z.B. beim Sortieren) und gibst sie dann mit `yield return` zurück, heißt das *eifrige Ausführung* bzw. *eager evaluation*.
-	Bearbeitest du immer genau ein Element beim Zugriff auf den *Iterator*, wird das *träge Ausführung* bzw. *lazy evaluation* genannt.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was ist der Unterschied zwischen *sofortiger Ausführung* und *verzögerter Ausführung*?
-	Wie erstellst du eine *"eifrige" Iterator*-Methode?
-	Wie erstellst du eine *"träge" Iterator*-Methode?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/YieldAnweisung).
-	Insbesondere die Problematik mit Änderung von Werten bei *verzögerter Ausführung* ist in [diesem Artikel](http://www.daedtech.com/getting-too-cute-with-c-yield-return) beschrieben.
-	Die Einführung in das Thema von Microsoft ist auf [MSDN](https://msdn.microsoft.com/de-de/library/vstudio/bb943859.aspx) zu finden.
-	Eine unglaublich präzise Erklärung gibt es in [dieser Antwort](http://stackoverflow.com/a/2515920/5258906) auf StackOverflow.
