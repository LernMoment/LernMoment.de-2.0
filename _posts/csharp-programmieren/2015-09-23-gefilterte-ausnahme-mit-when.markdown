---
layout: post
title: Gefilterte Ausnahme mit "when"
date: 2015-09-23T06:00:00+02:00
excerpt: InspirationsMoment - Exception Filter
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Inspiration, Ausnahme]
image:
  feature: csharp-programmieren.jpg
---

Du weißt nicht was ein InspirationsMoment ist? Im Hintergrundartikel ["Mehr Output! Weniger Input!"](/hintergrund/mehr-output-weniger-input/) bekommst du mehr Informationen dazu.

### Exception Filter mit `when`

C# 6.0 kommt mit einer Funktionalität die es für VB.NET und F# schon lange gibt. Es handelt sich dabei um *Exception Filter*. Hier ein Beispiel:

```cs
try {
  // Dein Code der eine Ausnahme schmeißen könnte
} catch (Exception e) when (
  (DateTime.Now.DayOfWeek == DayOfWeek.Saturday)
  || (DateTime.Now.DayOfWeek == DayOfWeek.Sunday)) {
  // Am Wochenende hast du bestimmt keine Lust dich um Bugs zu kümmern, oder?
  // Nur ein Scherz, aber es zeigt wie es geht.
}
```

Der entscheidende Punkt ist, dass das Filtern mit `when` nicht durch ein `catch-rethrow` erfolgt. Die *Exception* wird also gar nicht erst gefangen, sondern gleich zum Aufrufer durchgelassen. Dies ist nicht nur ganz nett, sondern hat einen wichtigen Vorteil für das *Debugging*.

Wenn ein *Exception Filter* `false` zurück gibt, wird der *Stack Trace* nicht verändert. Du bekommst also nicht eine Reihe von `catch-throw` Einträgen, wenn du dir den *Callstack* anschaust.

### Interessante Links 

-	In [diesem Artikel](http://www.informit.com/articles/article.aspx?p=2424332) beschreibt Bill Wagner in großem Detail was *Exception Filter* sind und vor allem wie sie angewendet werden können.
-	Eine ausführlichere Beschreibung findest du (leider nur in Englisch) im [Blog von BlackRabbitCoder](http://geekswithblogs.net/BlackRabbitCoder/archive/2015/04/09/c.net-little-wonders-exception-filtering-in-c-6.aspx).
-	Das Quelltextbeispiel habe ich bei [Jimmy Bogard](https://lostechies.com/jimmybogard/2015/07/17/c-6-exception-filters-will-improve-your-home-life/) gefunden und angepasst.

Viel Spaß beim Entscheiden ob du eine Ausnahme behandel willst oder nicht

Jan


PS: Gefällt dir das Konzept des InspirationsMoment? Über ein kurzes [Feedback](mailto:jan@lernmoment.de) würde ich mich freuen.
