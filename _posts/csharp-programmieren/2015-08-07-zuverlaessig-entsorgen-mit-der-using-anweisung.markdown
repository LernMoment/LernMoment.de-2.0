---
layout: post
title: Zuverlässig Entsorgen mit der using Anweisung
excerpt: Wie du auch in Ausnahmefällen sicherstellst, dass Dispose aufgerufen wird.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Dispose, Garbage Collection]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-07T06:00:00+02:00
---

Das `using` Schlüsselwort wird in zwei Bereichen eingesetzt. Du brauchst es einmal um Namensräume bekannt zu machen und als Anweisung in einer Methode:

> Stellt [sie] eine intuitive Syntax bereit, die die richtige Verwendung von IDisposable-Objekten sicherstellt.
> -- <cite>[MSDN](https://msdn.microsoft.com/de-de/library/yh598w02.aspx)</cite>

Ein Quelltextausschnitt, den du häufig sehen wirst ist folgender:

```cs
using (var writer = new StreamWriter("LernMomentLog.txt")) 
{
	// Hier mehr Quelltext um tatsächlich in die Datei zuschreiben
}
```

Die Idee bei der `using` Anweisung ist, dass Objekte, die `IDisposable` implementieren, immer richtig vom [Garbage Collector](/csharp-programmieren/der-garbage-collector/) abgeräumt werden. Dabei brauchst du dich um nichts weiter zu kümmern. Egal ob der Quelltext innerhalb der `using` Anweisung durch eine Exception abgebrochen wird, oder einfach normal beendet wird, die `Dispose` Methode von `sw` wird aufgerufen. So wird sichergestellt, dass die letzten Daten in die Datei geschrieben werden und diese dann geschlossen wird.

Somit kannst du dir als Regel merken, dass du `using` immer verwenden kannst (und solltest), wenn du eine Instanz einer Klasse anlegst, die `IDisposable` implementiert. Du kannst `using` allerdings nur innerhalb einer Methode anwenden. Wenn es also darum geht, dass du Klassenattribute hast die einen Typ mit `IDisposable` verwenden, dann musst du selber sicherstellen, dass `Dispose` aufgerufen wird.

Sofern du mehrere Objekte der gleichen Klasse in einem Block verwenden willst, kannst du einfach durch Komma separiert die Objekte erzeugen:

```cs
using (StreamWriter logWriter = new StreamWriter("LernMomentLog.txt"),
		   			textWriter = new StreamWriter("LernMoment.txt"))
{
	// Hier mehr Quelltext um tatsächlich in die Datei zuschreiben
}
```

Dabei ist zu beachten, dass du nicht `var` verwenden kannst. Du musst dann explizit den Datentyp definieren. Eine `using` Anweisung ist immer nur für einen Datentypen. Die Objekte auf die sich das `using` bezieht, also das was in den runden Klammern steht, können innerhalb des `using` Blocks nicht geändert werden. Du kannst ihnen also nicht einen neuen Wert zuweisen.

Auch solltest du beachten, dass, die innerhalb der `using` Anweisung angelegten Objekte, nach der `using` Anweisung "verschwinden". Somit kannst du keine Factory-Methoden mit dieser Anweisung erstellen. Natürlich kannst du dir ein Objekt aus einer Factory-Methode geben lassen und innerhalb einer `using` Anweisung verwenden.

Wirklich gut ist die Integration mit `async` und `await` gelöst. Du kannst das `await` Schlüsselwort an jeder beliebigen Stelle innerhalb der `using` Anweisung benutzen. Das ist auch nicht weiter verwunderlich. Wie im [LernMoment - Einführung in Async/ Await](/csharp-programmieren/einfuehrung-in-async-und-await/) erklärt, wird eine Methode am `await` Schlüsselwort "nur" unterbrochen.

Jetzt erstmal viel Spaß beim einfachen und sicheren Verwenden von Klassen mit `IDisposable`

Jan


### Merke

-	Mit `using` stellst du sicher, dass `Dispose` auf jeden Fall aufgerufen wird.
-	Die Anweisung kann nur mit Objekten einer Klasse verwendet werden, die `IDisposable` implementiert.
-	Es können auch mehrere Objekt in einer `using` Anweisung verwendet werden. Sie müssen allerdings den gleichen Typ haben.
-	Du kannst `var` in einer `using` Definition verwenden, wenn du nur ein Objekt hast.
-	`using` kann ohne Probleme mit `await` kombiniert werden.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Auf welchen Objekten kannst du `using` anwenden?
-	Was steht in den runden Klammern einer `using` Anweisung?
-	Kannst du ein Objekt, welches in einer `using` Anweisung angelegt wurde später (nach der geschlossenen geschweiften Klammer) noch verwenden?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quellcode zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/UsingAnweisung).
-	Mehr Details zu der `using` Anweisung findest du bei [MSDN](https://msdn.microsoft.com/de-de/library/yh598w02.aspx).
-	Ein paar Probleme scheint es zugeben bei der Verwendung von `using` im Kontext von [Windows Communication Foundation](https://msdn.microsoft.com/de-de/library/aa355056.aspx).
-	[Beispiele und Erklärungen](http://stackoverflow.com/questions/16566547/do-using-statements-and-await-keywords-play-nicely-in-c-sharp) zum Thema `await` und `using`.
