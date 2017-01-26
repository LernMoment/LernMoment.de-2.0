---
layout: post
title: Kovarianz und Felder
excerpt: "In der Praxis (fast) ganz einfach, aber in der Theorie echt abgefahren"
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Datentypen, Vererbung]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-03T09:04:46+02:00
---

Es gibt Collections, es gibt Generic Collections, es gibt threadsichere (Generic) Collections und bestimmt noch eine Menge andere Auflistungsklassen. Wann verwendest du also überhaupt noch Felder? Sicherlich verwendest du sie nicht sehr häufig. Wenn du sie verwendest, dann solltest du aber auch das Problem kennen, welches sich durch Kovarianz bei Feldern ergibt.

Bei Kovarianz geht es um das zuweisen von Objekten aus unterschiedlichen Vererbungsebenen. Wenn du dich bereits mit Vererbung beschäftigt hast, dann kennst du sicherlich ein ähnliches Beispiel wie dieses:

```cs
class LernMoment { }
class LernMomentCSharp : LernMoment { }

static void Main()
{
	LernMoment deinMoment = new LernMomentCSharp();
}
```

Du kannst eine Objekt einer abgeleiteten Klasse einem Objekt seiner Basisklasse zuweisen. Das ist erstmal nicht erstaunlich und eine der Grundideen bei Objekt-Orientierter-Programmierung. Nicht sonderlich überraschend ist dann auch, dass folgendes ebenfalls geht:

```cs
class LernMoment { }
class LernMomentCSharp : LernMoment { }

static void Main()
{
	LernMoment[] deineMomente = new LernMomentCSharp[10];
}
```

Die Theorie dazu ist, dass "erstelle ein Feld", eine kovariante Aktion auf Datentypen ist. Hä? Die Entwickler von C# wollen dir damit sagen, dass du dich darauf verlassen kannst, dass du ein Feld eines abgeleiteten Typs einem entsprechenden Speicherplatz seines Basistyps zuweisen kannst. Für sich genommen ist diese Theorie sicherlich nicht sonderlich wichtig.

Nun solltest du jedoch wissen, dass es auch Kontravarianz gibt. Diese besagt, dass sich eine Aktion genau umgekehrt verhält. Es gibt also Stellen in C# wo du nur einen Basistypen in einen abgeleiteten Typen stecken kannst. Die Unterscheidung zwischen Kovarianz und Kontravarianz ist insbesondere bei den Generics wichtig. Entsprechend wird es dazu einen weiteren LernMoment geben.

Eine Inkonsistenz ergibt sich jedoch in C# durch die Kovarianz von Feldern. Hier das Beispiel:

```cs
class LernMoment { }
class LernMomentCSharp : LernMoment { }
class LernMomentC : LernMoment { }

static void Main()
{
	LernMoment[] deineMomente = new LernMomentCSharp[10];
	deineMomente[3] = new LernMomentC();
}
```

Grundsätzlich sollte es möglich sein, dass du einen `LernMomentC` in dein Feld vom Typ `LernMoment` steckst. Dies wird dir ja gerade durch die Kovarianz zugesichert. Allerdings ist es in diesem konkreten Fall so, dass hinter `deineMomente` ein Feld vom Typ `LernMomentCSharp` steckt. Das wiederum, darf keine Objekte vom Typ `LernMomentC` aufnehmen, weil sie nicht von `LernMomentCSharp`, sondern von `LernMoment` abgeleitet sind. 

Dieses "Problem", kann nicht mal vom Compiler erkannt werden. Sondern die C# Entwickler mussten teure (bezüglich der Laufzeit) Laufzeitüberprüfungen integrieren. So kommt es, dass das vorherige Beispiel zwar ohne Fehler kompiliert werden kann, aber es eine Excpetion bei der Ausführung gibt.

Jetzt erstmal viel Spaß mit kleinen und großen Datentypen

Jan


### Merke

-	Variablen eines Typ X, kann eine andere Variable des Typ Y zugewiesen werden, wenn Y von X abgeleitet ist. Du könntest auch sagen, dass Y kleiner X ist.
-	Von Kovarianz wird gesprochen, wenn eine Aktion auf Datentypen (z.B. erstelle ein Feld des Typs oder erstelle ein IEnumerable des Typs) sich genauso verhält. Es muss also möglich sein, dass du `X[] test = new Y[2];` machst, wenn gilt Y kleiner X.
-	Kovarianz ist ein theoretisches Konzept. Du kommst sicherlich ohne das Verständnis darum aus, aber es kann dir durch aus helfen einige Sachverhalte in C# im Detail zu verstehen.
-	Wegen der Kovarianz wird bei jedem zuweisen eines Objekts an ein Feld eine Laufzeitüberprüfung statt finden.
-	Probleme die sich aus der Kovarianz bei Feldern ergeben, können erst zur Laufzeit festgestellt werden.

### Lernquiz 

Verwende folgende Fragen um das gelernte von heute zu festigen:

```cs
object[] a = new String[10];
a[1] = 10;
```

-	Wenn um die beiden Zeilen ein komplettes C#-Programm steht, wird der Compiler einen Fehler melden?
-	Es gilt `String` und `Int` erben von `object`. Verstoßen die beiden Zeilen gegen das Konzept der Kovarianz?
-	Wird es einen Fehler geben, wenn du die zwei Zeilen oben in ein korrekts C#-Programm integrierst und ausführst?

Am besten du schaust dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quellcode zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/KovarianteFelder).
-	[MSDN](https://msdn.microsoft.com/de-de/library/ee207183(v=vs.140).aspx) hat eine gute Erklärung, aber nur auf Englisch.
-	Eric Lippert hat C# in diesem Bereich maßgeblich entwickelt und dazu einiges zu sagen. Eine ganze Serie zum Thema Kovarianz und Kontravarianz findest du auf seinem [Blog](http://blogs.msdn.com/b/ericlippert/archive/tags/covariance+and+contravariance/). Der erste Artikel der Serie ist ganz unten.


