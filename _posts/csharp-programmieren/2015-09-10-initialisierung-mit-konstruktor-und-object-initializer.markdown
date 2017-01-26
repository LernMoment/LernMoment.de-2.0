---
layout: post
title: Initialisierung mit Konstruktor und Object Initializer
date: 2015-09-10T06:00:00+02:00
excerpt: Wie du Objekte sinnvoll initialisierst.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Datentypen, Initialisierung]
image:
  feature: csharp-programmieren.jpg
---

Der Vergleich von Konstruktor und *Object Initializer* ist unfair. Denn ein Konstruktor ist Bürger erster Klasse in C# und der *Object Initializer* ist lediglich ein kleines Hilfsmittel um Quelltext zu verschönern. Trotzdem kannst du mit beiden einem Objekt Initialwerte geben.

Der Konstruktor ist für dich *die* Wahl, wenn es darum geht dein Objekt in einen gültigen Zustand zu bringen. Er ist also ein wichtiger Bestandteil für das Design deiner Klasse. Weitere Eigenschaften und Attribute kannst du dann mit dem *Object Initializer* wie folgt mit Werten belegen:

```cs
var meinLernMoment = new LernMoment("Object Initializer")
{
	EmailAuthor = "jan@lernmoment.de",
	tags = new List<string> {"Syntax", "Initialisierung"}
};
```

Du kannst in den geschweiften Klammern direkt einem oder mehreren (öffentlichen) Eigenschaften oder Attributen einen Wert zuweisen. In diesem Beispiel ist schon fraglich, ob ein Objekt der Klasse `LernMoment` gültig ist, wenn die Liste für das Attribut `tags` nicht alloziert ist. Damit will ich dir auch nur die Syntax zeigen.

Gerade bei dem Attribut `tags` siehst du eine weitere Besonderheit. Verwendest du einen Konstruktor ohne Argumente in Kombination mit einem *Object Initializer*, ist es erlaubt die runden Klammern des Konstruktors wegzulassen.

Der *Object Initializer* wird **nach** dem Konstruktor ausgeführt. Es ist also grundsätzlich möglich, dass du im Konstruktor einer Eigenschaft einen Wert zuweist und diesen nachträglich im *Object Initializer* überschreibst. Das wird allerdings in den wenigsten Fällen Sinn machen.

Im Beispiel oben siehst du einen der möglichen Verwendungszwecke des *Object Initializers*. Wenn du beispielsweise eine Klasse mit einigen öffentlichen Eigenschaften und Attributen hast, dann müsstest du unter Umständen viele überladene Konstruktoren anbieten für die Initialisierung. Eine Alternative ist nun, dass du einen Konstruktor bereitstellst, der das Objekt in einen gültigen Zustand versetzt und dann alles weitere mit dem *Object Initializer* machst.

Gerade im Kontext von *Multithreading*-Anwendungen gibt es noch einen weiteren Vorteil. Der *Object Initializer* ist eine atomare Operation. Wenn du ihn verwendest, wird dir garantiert, dass das angelegte Objekt entweder `null` oder komplett initialisiert ist.  Somit hast du einen Vorteil im Vergleich zu dem folgenden Beispiel, welches inhaltlich genau das gleiche macht:

```cs
var meinLernMoment = new LernMoment("Object Initializer");
meinLernMomnet.EmailAuthor = "jan@lernmoment.de";
meinLernMoment.tags = new List<string>();
meinLernMoment.tags.Add("Syntax");
meinLernMoment.tags.Add("Initialisierung");
```

Die Initialisierung in diesem Beispiel kann an jeder Stelle (nach dem Konstruktor) von einem anderen Thread unterbrochen werden. Bei dem ersten Beispiel könnte sie zwar auch unterbrochen werden, aber dann verweist `meinLernMoment` nicht auf ein gültiges Objekt, sondern auf `null`. 

Für mich ist im direkten Vergleich der beiden Beispiele die Variante mit *Object Initializer* wesentlich besser lesbar. Insbesondere beim schreiben von automatischen *Unit*-Tests, hilft der *Object Initializer* den jeweiligen Testfall präzise zu formulieren.

Jetzt erstmal viel Spaß mit der Initialisierung deiner Objekte

Jan


### Merke

-	Den Konstruktor solltest du immer verwenden um ein Objekt deiner Klasse in einen gültigen Zustand zubringen.
-	Einen *Object Initializer* verwendest du um weitere öffentliche Eigenschaften / Attribute deines Objektes in einer atomaren und "anmutend aussehenden" Operation zu initialisieren.
-	Verwendest du den *Object Initializer* in Kombination mit einem Standardkonstruktor, kannst du die runden Klammern des Konstruktors weglassen.
-	Der *Object Initializer* wird grundsätzlich nach dem Konstruktor ausgeführt.
-	Die Verwendung des *Object Initializers* kann deine *Multithreading*-Anwendung ein wenig robuster machen.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was ist der Unterschied zwischen einem Konstrukor und einem Object Initializer?
-	Wie sieht ein *Object Initializer* aus, der die Eigenschaften `string A` und `int B` mit Werten initialisiert?
-	In welchen Fällen kann dir ein *Object Initializer* helfen?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/ObjektInitialisierung).
-	Eine umfangreichere Erklärung warum der *Object Initializer* eine atomare Operation ist und was dies bedeutet findest du auf [dieser Webseite](http://community.bartdesmet.net/blogs/bart/archive/2007/11/22/c-3-0-object-initializers-revisited.aspx)
-	Wie immer gibt es eine allgemeine Einführung auf [MSDN](https://msdn.microsoft.com/de-de/library/bb384062.aspx)
