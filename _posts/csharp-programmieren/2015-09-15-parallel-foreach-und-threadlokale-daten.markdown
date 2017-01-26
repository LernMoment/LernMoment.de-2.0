---
layout: post
title: Parallel.ForEach und thread-lokale Daten
date: 2015-09-15T06:00:00+02:00
excerpt: Der Turboboost für einige deiner Schleifen.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, TPL, Schleifen]
image:
  feature: csharp-programmieren.jpg
---

Neben der Aufgabenparallelität, hat die [TPL](/csharp-programmieren/von-prozessen-bis-tasks/) auch die Datenparallelität eingeführt. Damit kannst du mühelos eine `for` oder `foreach` Schleife parallelisieren. So ist wenigstens die Idee. Auch wenn die Entwickler der TPL einen brillianten Job gemacht haben, hast du es immer noch mit nebenläufiger Programmierung zutun. Daher solltest du dir bei jeder Schleife überlegen welche Auswirkungen eine Parallelisierung haben kann.

Nehmen wir einmal ein typisches Beispiel:

```cs
static void SummenformelSequentiell()
{
	//Alle Zahlen von 1 - 10000000 generieren 
	var zahlen = Enumerable.Range(1, 10000000); 
	long summe = 0;

	foreach(var zahl in zahlen)
	{
		summe += zahl;
	}

	// Resultat ist: 50000005000000

	Console.WriteLine("Die Summe aller Zahlen von 1-10000000 ist: {0}", summe);
}

```

Mit der `ForEach` Methode der Klasse `Parallel` aus dem Namensraum `System.Threading.Tasks`, kannst du diese Ausführung eigentlich ganz einfach parallelisieren. Wenn da nicht die lokale Variable `summe` wäre. Denn was passiert, wenn du die Schleife wie folgt änderst? `Parallel.ForEach(zahlen, zahl => summe += zahl);`

Richtig, das hängt absolut von deinem Rechner ab. Allerdings wirst du nur in den wenigsten Fällen das richtige Ergebnis bekommen. Die Idee ist, dass `Parallel.ForEach` den Inhalt des übergebenen `IEnumerable<T>` partitioniert und versucht mit mehreren *Threads* parallel abzuarbeiten. Verwendest du also eine lokale Variable, ein Klassenattribut, ... auf das nicht *thread-safe* zugegriffen werden kann, wird dies von den *Threads* mehrfach im *inkonsistenten Zustand* hinterlassen, weil sie parallel darauf zugreifen.

Eine mögliche Lösung des Problems ist `lock { summe += zahl }` zu verwenden. Damit erhälst du zwar das richtige Ergebnis, aber in vielen Fällen blockieren sich die *Threads* soviel, dass es keinen Gewinn bei der Ausführungszeit gibt. Der bessere Weg heißt *thread-local data*.

Sowohl `Parallel.ForEach` wie auch `Parallel.For` erlauben es, dass du eine für den *Thread* lokale Variable definierst. Jedesmal, wenn ein Bereich deiner Daten, an einen *Thread* zur Abarbeitung gegeben wird, wird diese Variable initialisiert und steht solange für den *Thread* bereit, wie er Iterationen auf den Daten ausführt. Ist der *Thread* dann fertig, kannst du entscheiden wie der Wert der lokalen Variablen verwendet werden soll. Zurück zum Beispiel von eben:

```cs
Parallel.ForEach<int, long>
( 
	zahlen,
	() => 0L,
	(zahl, loopState, zwischenSumme) =>
	{ 
    	zwischenSumme += zahl;                      //Bilde lokale zwischenSumme - pro Thread 
    	return zwischenSumme; 
	}, 
	zwischenSumme => Interlocked.Add(ref summe, zwischenSumme)
);
```

Damit ist die ursprünglich einfache `foreach` Schleife schon wesentlich komplexer geworden. Was aber bedeutet es nun im Detail? Das ist immer noch nicht so kompliziert. 

Der erste Parameter von `Parallel.ForEach` sind die Daten auf denen gearbeitet werden soll. Als nächstes musst du dem Thread mitteilen, wie seine lokale Variable initialisiert werden soll. Dies geht einfach über ein `Func<TLocal>` delegate. Dann folgt der eigentliche Schleifenrumpf. Dort taucht zum erstmal die *thread-lokale Variable* auf. Hier heißt sie `zwischenSumme`. Im letzten Parameter definierst du was mit der *thread-lokalen Variable* geschehen soll, wenn der Thread fertig ist mit der Berechnung.

Obwohl auch in diesem Szenario für die Bildung der Gesamtsumme ein `lock` bzw. in diesem Beispiel `Interlocked.Add` verwendet wird, ist die Ausführung wesentlich schneller. Denn es wird nicht bei jeder Iteration zwischen den *Threads* synchronisiert, sondern nur noch, wenn der jeweilige *Thread* fertig ist. Auch dann ist nicht mal sicher, dass die *Threads* sich blockieren.

Jetzt erstmal viel Spaß mit dem Synchronisieren von parallelen Schleifen

Jan


### Merke

-	Mit `Parallel.ForEach` und `Parallel.For` kannst du eine Parallelität beim bearbeiten deiner Daten erreichen.
-	Auch wenn du dabei nicht direkt mit `Thread` oder `Task` arbeitest, musst du trotzdem die üblichen Fallen der nebenläufigen Programmierung beachten.
-	Eine *thread-lokale Variable* erspart dir das ständige blockieren von Threads bei der Synchronisation.
-	Wenn du eine *thread-lokale Variable* verwendest, ist diese nur innerhalb des Kontexts von `Parallel.ForEach` bzw. `Parallel.For` verfügbar.
-	Neben der Verwendung im Schleifenrumpf, musst du *thread-lokale Variablen* initialisieren und solltest definieren, wie das Resultat verwendet wird, wenn der Thread fertig ist.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Welche Möglichkeiten gibt es zur Synchronisation von Threads bei der Verwendung von `Parallel.ForEach` und `Parallel.For`?
-	Wie kannst du eine *thread-lokale Variable* vom Typ `float` auf den Wert `3.14` initialisieren?
-	Wie kannst du den Wert einer *thread-lokalen Variable* verwenden, wenn der *Thread* fertig ist?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/ParallelForEach).
-	Eine detailierte Einführung auf Englisch gibt es bei [BlackWasp](http://www.blackwasp.co.uk/ParallelLoopSynch.aspx).
-	Die Beschreibung der verwendeten Methode auf [MSDN](https://msdn.microsoft.com/de-de/library/dd991486(v=vs.110).aspx).
-	Eine umfangreiche Einführung in das Thema Datenparallelität findest du ebenfalls auf [MSDN](https://msdn.microsoft.com/de-de/library/dd537608(v=vs.110).aspx)
