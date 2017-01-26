---
layout: post
title: Ein Multicast-Delegate erstellen
date: 2015-08-21T06:00:00+02:00
excerpt: Erst kombinieren, dann delegieren
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Delegate]
image:
  feature: csharp-programmieren.jpg
modified:
---

Wenn ich so drüber nachdenke, dann ist es schon logisch, aber ist dir bewusst, dass jedes Delegate ein Multicast-Delegate ist? Außerdem, wie erzeugst du ein solches Multicast-Delegate und wofür setzt du es ein? Schauen wir uns das ganze mal an.

```cs
using System;

public delegate void DeinDelegate();

class Program {
  static void Main() {
    DeinDelegate combine = (DeinDelegate)Delegate.Combine(
                                              new DeinDelegate(StarteErstenSchritt), 
                                              new DeinDelegate(StarteZweitenSchritt)
                                              );

    // Multicast Delegate ausführen
    combine();
  }

  public static void StarteErstenSchritt() {
    Console.WriteLine("Es wird gerade der ERSTE Schritt ausgefuehrt.");
  }

  public static void StarteZweitenSchritt() {
    Console.WriteLine("Es folgt nun der ZWEITE Schritt.");
  }
}
```

Du kannst die `Delegate.Combine` Methode verwenden, um mehrere einzelne Delegates zu einem Multicast-Delegate zu kombinieren. Dabei braucht du für die Deklaration des Delegates nichts spezielles verwenden. Jedes Delegate ist nämlich automatisch ein Multicast Delegate.

Wenn du das Multicast-Delegate ausführst, wie hier mit `combine()` geschehen, dann werden einfach der Reihe nach alle einzelnen Delegates ausgeführt. Bei einem Multicast-Delegate handelt es sich also um eine Art Kette von Funktionen. Wie du im Quelltext des Beispiels für diesen Lernmoment sehen kannst, werden die einzelnen Delegates immer exakt in der Reihenfolge ausgeführt, in der sie auch angemeldet wurden.

Du hast Multicast-Delegates sicherlich schon mal benutzt, auch wenn es dir nicht bewusst ist. Sie sind nämlich die Basis für Events. Bei einem Event können auch mehrere Empfänger angemeldet werden und der Event-Mechanismus basiert auf Delegates.

Daher gibt es auch für Multicast-Delegates eine etwas einfachere Schreibweise:

```cs
  DeinDelegate plusGleich = StarteErstenSchritt;
  plusGleich += StarteZweitenSchritt;
```

Du siehst, es kann einfach der `+=` Operator verwendet werden, um weitere Delegates hinzu zufügen. So kannst du auch zu einem späteren Zeitpunkt noch weitere Delegates hinzufügen. Natürlich kann auch ein Delegate mit dem `-=` Operator wieder abgemeldet werden.

Mit Multicast-Delegates kannst du beispielsweise zur Laufzeit entscheiden ob einem Bearbeitungsschritt noch weitere hinzugefügt werden sollen oder vielleicht wieder welche entfernt werden sollen.

Jetzt erstmal viel Spaß beim Kombinieren und Delegieren

Jan


### Merke

-	Du kannst aus jedem Delegate ein Multicast Delegate machen, in dem du weitere Delegates kombinierst.
-	Mit der `Delegate.Combine` Methode und dem `+=` Operator kannst du Delegates zu einem Multicast Delegate kombinieren.
-	In der Reihenfolge, in der du die Delegates zu einem Multicast Delegate kombinierst, werden sie später auch ausgeführt.
-	Der Event-Mechanismus ist die Standardanwendung von Multicast Delegates.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie werden Multicast Delegates deklariert?
-	Wie kannst du mit wenig Befehlen einen Multicast Delegate erstellen?
-	Wie wird ein Multicast Delegate ausgeführt?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quellcode zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/MulticastDelegateErstellen).
-	Eine umfangreichere Erklärung findest du [hier](http://openbook.rheinwerk-verlag.de/visual_csharp_2012/1997_05_001.html#dodtpc31b034c-07a3-4c58-8260-f33ec088cf36).