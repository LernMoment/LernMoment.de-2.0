---
layout: post
title: Herausforderung - Schaffst du es ein Singleton zu implementieren?
date: 2015-10-06T06:00:00+02:00
excerpt: In 5 Minuten und ohne Hilfe?
modified: 2015-10-07T13:00:00+02:00
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Übung, Pattern, Async]
image:
  feature: csharp-programmieren.jpg
---

Heute will ich es wissen. Bist du zu 100% bereit ein Meister der Softwareentwicklung in C# zu werden? Hier auf LernMoment.de findest du verschiedene Wege dein Wissen und deine Fähigkeiten zu erweitern. Du bekommst kleine Lerneinheiten und kontinuierliche Wissensabfrage. Es fehlt aber noch das Üben.

Kontinuierliches und fokussiertes Üben ist ein weiterer wichtiger Schlüssel zur professionellen Softwareentwicklung. Ganz wichtig dabei ist, dass es einen Unterschied macht ob du dir Zeit nimmst eine Fähigkeit zu üben, oder ob du "nur" diese Fähigkeiten beim Arbeiten übst. Gerade eine fokussierte Übungseinheit bringt dich wesentlich weiter.

Auch das Üben machst du hier auf LernMoment.de in kleinen Einheiten. Somit brauchst du wenig bis gar keine Motivation dafür. 

### Herausforderung - thread-safe Singleton

Ich habe eine Herausforderung für dich. Letzte Woche gab es den LernMoment ["Ist dein Singleton thread-safe?"](/csharp-programmieren/ist-dein-singleton-thread-safe/) Heute ist es Zeit festzustellen, wie viel du davon umsetzen kannst. Dabei ist es ganz wichtig, dass du nur deine Entwicklungsumgebung oder einen Editor öffnest und ohne irgendeine Hilfe die Klasse implementierst. Also nicht mal gerade im LernMoment oder auf einer anderen Webseite nachschauen. Einfach nur dein Quelltext und du!

Stelle dir einen Timer (z.B. in deinem Mobiltelefon) auf 5 Minuten. Nun implementiere innerhalb dieser 5 Minuten eine Klasse die das *Singleton Pattern* in einer Variante umsetzt, die *thread-safe* ist. Wenn du möchtest kannst du noch ein kleines Hauptprogramm schreiben, welches dein *Singleton* benutzt, aber das ist optional.

Ich werde heute genau diese Herausforderung angehen und meine Lösung dann hier veröffentlichen. Wenn du möchtest, kannst du mir deine Lösung per [E-Mail](mailto:jan@lernmoment.de) schicken. Du bekommst dann von mir eine kurze Rückmeldung dazu.

### Update - 07. Oktober 2015: Mein Singleton

Wie ist es dir ergangen mit dieser Herausforderung? Ich muss sagen, dass ich heute nicht auswendig mein *Singleton* realisieren konnte. Da muss ich wohl noch ein wenig üben! Wenn du willst, kannst du mir immer noch deine Lösung schicken. Es würde mich unglaublich freuen, wenn neben meiner Version die ich dann mit "ein paar mal" nachschauen erstellt habe, noch weitere Lösungen hier veröffentlicht werden.

Ich habe mich für die Version entschieden, bei der `Lazy<T>` benutzt wird. Sie kann also nur in .NET 4+ verwendet werden. Diese Lösung findest du ebenfalls im [LernMoment GitHub Repository](https://github.com/LernMoment/csharp/tree/master/Singleton).

```cs
using System;

/// <summary>
/// Ein Singleton basierend auf Lazy<T>
/// </summary>
sealed class MeinSingleton
{
	private static readonly Lazy<MeinSingleton> dieInstanz = new Lazy<MeinSingleton>(() => new MeinSingleton());

	public static MeinSingleton Instanz { get {return dieInstanz.Value;}}

	private MeinSingleton()
	{
		// Keinen öffentlichen Standardkonstruktor erlauben.
	}

	public void SagHallo()
	{
		Console.WriteLine("Hallo da draußen!");
	}
}

/// <summary>
/// Zeigt wie das Singleton verwendet werden kann
/// </summary>
class UebungSingletonImplementieren
{
	static void Main()
	{
		MeinSingleton halloSager = MeinSingleton.Instanz;

		halloSager.SagHallo();
	}
}
```

### Vorsicht bei der Verwendung von Singletons

Bereits im LernMoment ["Ist dein Singleton thread-safe?"](/csharp-programmieren/ist-dein-singleton-thread-safe/) habe ich darauf hingewiesen, dass ein *Singleton* nicht immer praktisch ist. Beim Versuch diese Herausforderung zu lösen mit dem Ziel ein *"testbares" Singleton* zu erstellen, bin ich auf einige Artikel und Videos von [Misko Hevery](http://misko.hevery.com/about/) gestoßen. Die absolut anschaulich zeigen welche Probleme ein *Singleton* beim Testen machen kann. Einen Überblick der relevanten Artikel (alle nur in Englisch verfügbar) findest du auf [StackOverflow](http://stackoverflow.com/a/2085988/5258906).

Viel Spaß beim fokussierten Üben des *Singleton Patterns*

Jan


PS: Hast du Fragen zu dieser Herausforderung, oder anderen Themen auf LernMoment.de? Dann schicke mir eine [E-Mail](mailto:jan@lernmoment.de). Ich werde dir persönlich antworten. Versprochen!
