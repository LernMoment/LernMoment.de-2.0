---
layout: post
title: Automatisch Implementierte Eigenschaften - Die C# 6.0 Syntax
excerpt: Wie du mit .NET 4.6 eine Eigenschaft mit nur get automatisch implementieren kannst.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Eigenschaften, C# 6.0]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-04T06:00:00+02:00
---

Die Syntax von automatisch implementierten Eigenschaften ist nicht wirklich kompliziert. Mit C# in der Sprachversion 6.0 sind einige Neuerungen insbesondere für die Initialisierung hinzu gekommen.

Seit C# 3.0 konntest du einfach eine Eigenschaft ohne explizite Definition von `get` und `set` machen:

```cs
public class Eigenschaft
{
	public int AutoEigenschaft { get; set; }
	public int AutoEigenschaftNurLesbar { get; private set; }
}
```

Ab C# 6.0, also .NET 4.6, gibt es auch die Möglichkeit, dass du eine automatisch implementierte Eigenschaft nur mit `get` definierst. Dann wird, die vom Compiler automatisch generierte Variable, die den Wert deiner Eigenschaft hält, als `readonly` angelegt. Außerdem ist es nun auch möglich, dass du einfach einen Initialwert definierst.

Somit kannst du einfach einen zur Laufzeit nicht veränderbaren Datentypen mit automatisch implementierten Eigenschaften erstellen:

```cs
public class ValueObject
{
	public int UnveraenderbareEigenschaft { get; } = 42;
}
```

Vielleicht wunderst du dich wofür eine Eigenschaft mit Konstante gut sein soll. Die Entwickler von C# 6.0 haben es daher auch ermöglicht die Initialisierung im Konstruktor zu machen:

```cs
public class ValueObject
{
	public int UnveraenderbareEigenschaft { get; }

	public ValueObject(int wert)
	{
		UnveraenderbareEigenschaft = wert;
	}
}
```

Du kannst auch die `get` Methode mit [anonymer Methode](http://www.lernmoment.de/csharp-programmieren/anonyme-methode/) und [Lambda-Ausdruck](http://www.lernmoment.de/csharp-programmieren/lambda-ausdruecke-erstellen/) definieren:

```cs
public class ValueObject
{
	public int UnveraenderbareEigenschaft { get; } = 42;
	public double Kehrwert => 1 / ((double)UnveraenderbareEigenschaft);
}

```

Dies ist vielleicht ein wenig gewöhnungsbedürftig und du solltest auch genau überlegen wie du eine solche Eigenschaft einsetzt. Denn obwohl es offenbar eine Eigenschaft nur mit `get` ist, kann sich der Wert verändern. Ich habe keine genau Definition gefunden was bei der Verwendung von Lambda bei nur `get` Eigenschaften passieren soll. Allerdings ist es so, dass du teilweise überraschende Ergebnisse bekommst, wenn du Abhängigkeiten zwischen Eigenschaften einführst. Insbesondere, wenn du Eigenschaften mit `get` und `set` und solche mit nur `get` kombinierst.

Jetzt erstmal viel Spaß beim experimentieren mit automatisch implementierten Eigenschaften in C# 6.0

Jan


### Merke

-	C# 6.0 erlaubt die Definition von Eigenschaften nur mit der `get` Methode.
-	Wenn du eine Eigenschaft nur mit `get` definierst, dann legt der Compiler den Speicherplatz dafür als `readonly` an.
-	Alle Arten von automatisch implementierten Eigenschaften können bei der Definition oder im Konstruktor initialisiert werden.
-	Anstelle der vom Compiler automatisch implementierten `get` Methode, kannst du auch einen Lambda-Ausdruck verwenden.
-	Die Definition einer `private set` Methode ist immer noch möglich.

### Lernquiz 

Verwende folgende Fragen um das gelernte von heute zu festigen:

-	Wie definierst du eine automatisch implementierte Eigenschaft mit Initialwert?
-	Kann der Wert einer automatisch implementierten Eigenschaft mit nur `get` verändert werden?
-	Wie kannst du Lambda-Ausdrücke in Eigenschaften verwenden?

Am besten du schaust dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quellcode zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/AutomatischImplementierteEigenschaftenVerwenden).
