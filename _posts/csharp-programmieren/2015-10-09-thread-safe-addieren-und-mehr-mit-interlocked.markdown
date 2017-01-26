---
layout: post
title: Thread-safe addieren und mehr mit Interlocked
date: 2015-10-09T06:00:00+02:00
excerpt: InspirationsMoment - Interlocked
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Inspiration, Async, TPL]
image:
  feature: csharp-programmieren.jpg
---

Bereits im LernMoment ["Ist dein Singleton thread-safe?"](/csharp-programmieren/ist-dein-singleton-thread-safe/) hast du die Klasse `Interlocked` verwendet. Es handel sich dabei um eine statische Klasse im Namensraum `System.Threading`. Somit ist sie nicht Bestandteil der TPL. Die Klasse existiert schon wesentlich länger als die TPL, aber du kannst sie auch im Kontext von TPL einsetzen.

Die Grundidee dieser Klasse ist, dass einfache Operationen wie `Add`, `Increment` und `Decrement` als atomare Operationen bereitgestellt werden. In C# sind nämlich auch Operatoren wie `++` oder `--` nicht atomar und somit auch **nicht** thread-safe.

Wie du die einfachen Methoden dieser Klasse verwendest ist selbsterklärend. In den Links unten findest du weitere Informationen. Zusätzlich wird es bald auch einen eigenen LernMoment zu dieser Klasse geben. In dem wirst du insbesondere erfahren wie `Interlocked`, `lock` und `volatile` zusammenhängen.

### Interessante Links 

-	Die Beschreibung der [Klasse auf MSDN](https://msdn.microsoft.com/de-de/library/system.threading.interlocked(v=vs.110).aspx) ist mal wieder unglaublich schlecht bzw. teilweise gar nicht übersetzt.
-	Peter Mandl, Autor des Buches "Grundkurs Betriebssysteme", stellt in [einem Unterkapitel](https://books.google.de/books?id=T5SLBAAAQBAJ&pg=PA193&lpg=PA193&dq=c%23+Interlocked&source=bl&ots=4UaTs3rUwz&sig=aXZtk6hFlQ3n4-4uJ1CEzwkauJc&hl=de&sa=X&ved=0CE8Q6AEwCWoVChMImp-YnNS0yAIVwekUCh2UYgnB#v=onepage&q=c%23%20Interlocked&f=false) ebenfalls die Klasse vor.

Viel Spaß beim atomaren Addieren aus unterschiedlichen *Threads*

Jan


PS: Hast du Fragen zu diesem InspirationsMoment, oder anderen Themen auf LernMoment.de? Dann schicke mir eine [E-Mail](mailto:jan@lernmoment.de)
