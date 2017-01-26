---
layout: post
title: Haben deine Delegates den Func?
excerpt: Vereinfache deinen Quelltext mit Func<...>
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Delegate, Generics]
image:
  feature: csharp-programmieren.jpg
date: 2015-08-17T06:00:00+02:00
modified:
---

Delegates, insbesondere in Kombination mit [Lambda-Ausdrücken](/csharp-programmieren/lambda-ausdruecke-erstellen/), sind sehr praktisch. Gerade wenn du mehrere Delegates mit unterschiedlichen Parametern und Rückgabewerten brauchst, musst du allerdings einiges deklarieren. Dies macht deinen Quelltext teilweise schwer verständlich.

In C# 3.0 (.NET 3.5) hat Microsoft Linq und Erweiterungsmethoden eingeführt. Bei beiden wird häufig ein Delegate verwendet. Daher wurde in der gleichen Version auch das Func<...>-Delegate eingeführt. Aktuell (.NET 4.6) gibt es 17 verschiedene Func<...>-Delegates. Sie unterscheiden sich jedoch lediglich in der Anzahl der Parameter.

Was aber genau ist denn nun dieses Func<...>-Delegate? Schau dir mal die Syntax an:

```cs
public delegate TResult Func<in T, out TResult>(
	T arg
)
```

Es ist nichts weiter als die Deklaration eines Delegates. Da generische Datentypen (`T` und `TResult`) verwendet werden, kannst du bei der Verwendung entscheiden was dein Delegate übergeben bekommt und was es zurück gibt. Damit kannst du nun einfach einen Delegate als Methodenparameter definieren, ohne das du selber einen Delegate deklarieren musst:

```cs
public void DruckeLernMomenteDieBedingungErfuellen(IEnumerable<LernMoment> liste, Func<LernMoment, bool> bedingung)
{
	foreach(LernMoment moment in liste)
	{
		if( bedingung(moment) )
		{
			Console.WriteLine("Der LernMoment - {0} erfüllt die Bedingung.", moment.Name);
		}
	}
}
```

In eine Methode wie oben kannst du nun Delegates in verschiedener Form stecken:

```cs
// natürlich als Lambda:
DruckeLernMomenteDieBedingungErfuellen(eineListe, lm => lm.AnzahlLeser >= 1000);

// Oder auch in dem du direkt eine Methode übergibst
DruckeLernMomenteDieBedingungErfuellen(eineListe, BedingungsMethode);

private static bool BedingungsMethode(LernMoment lm)
{
	return lm.ErschienenAm.Month == 08;
}
```

Die in C# definierten Func<...>-Delegates unterscheiden sich nur in der Anzahl der übergebenen Parameter. Dabei solltest du wissen, dass ein Func<...>-Delegate immer einen Rückgabewert hat. Solltest du mal ein Delegate brauchen ohne Rückgabewert, dann kannst du das Action<...>-Delegate verwenden. Dies ist analog zu Func<...>, jedoch hat es keinen Rückgabewert.

Im Beispiel oben habe ich folgendes verwendet: `Func<LernMoment, bool>`. Wenn du es mit dem LernMoment [Predicate Delegate](/csharp-programmieren/predicate-delegate/) vergleichst, wird dir eine Ähnlichkeit auffallen. Tatsächlich beschreiben beide das gleiche. Während `Predicate<T>` jedoch explizit klar macht, dass es eine Bedingung auf dem spezifiziertem Datentyp angibt, kan `Func<T, bool>` so ziemlich alles beschreiben. Obwohl viele empfehlen nur noch den Func<...>-Delegate zu benutzen, solltest du dir bewusst sein, dass dein Quelltext damit wenigstens in einigen Situation an Ausdrucksstärke verliert.

Jetzt erstmal viel Spaß beim Entdecken des Func

Jan


### Merke

-	Func<...> ist ein vordefiniertes Delegate mit generischen Datentypen.
-	Der Unterschied zum Action-Delegate ist, dass Func-Delegates immer einen Rückgabewert haben müssen.
-	Durch die Verwendung von Func<...>-Delegates ersparst du dir die Deklaration eines eigenen Delegate-Typen
-	Viele Erweiterungsmethoden und Methoden in Linq verwenden Func<...>-Delegates. Du kannst ihnen direkt eine Methode, ein Lambda-Ausdruck oder auch eine anonyme Methode übergeben.
-	Situationsabhängig solltest du überlegen ob du Func<...>-Delegates oder einen eigenen Delegate-Typen verwendest. Den letzterer kann deine Intention im Quelltext klarer ausdrücken.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie definierst du einen Func<...>-Delegate mit einem Rückgabewert vom Typ `string` und 2 Parametern vom Typ `int`?
-	Was ist der Unterschied zwischen `Predicate<T>` und `Func<T, bool>`?
-	Was solltest du allgemein bei der Verwendung von Func<...>-Delegates beachten?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/FuncDelegate).
-	Die verschiedenen Func<...>-Delegates sind [hier](https://msdn.microsoft.com/de-de/library/bb534960(v=vs.110).aspx) beschrieben.
-	Eine ziemlich gute Einführung in das Thema Delegates (inkl. Func & Lambda) findest du [hier](http://www.codeproject.com/Articles/47887/C-Delegates-Anonymous-Methods-and-Lambda-Expressio).
