---
layout: post
title: Warum das Abmelden von Events überbewertet ist.
date: 2015-09-21T06:00:00+02:00
excerpt: Und wann du es trotzdem machen solltest.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Memory Leak, Event]
image:
  feature: csharp-programmieren.jpg
---

Hast du eine Ahnung was in fast jedem Artikel zum Thema *Memory Leak* in .NET vorkommt? Es ist das Abmelden von Events. Nun bin ich bei *Stack Overflow* über [eine Aussage](http://stackoverflow.com/questions/4526829/why-and-how-to-avoid-event-handler-memory-leaks/4526840#4526840) von C# Autorität [Jon Skeet](http://stackoverflow.com/users/22656/jon-skeet) gestolpert, die mich verwundert hat:

> However, in my experience this is rarely actually a problem - because typically I find that the publisher and subscriber have roughly equal lifetimes anyway.
> It is a possible cause... but in my experience it's rather over-hyped. Your mileage may vary, of course... you just need to be careful.
> --<cite>[Jon Skeet](http://stackoverflow.com/a/4526840/5258906)</cite>

Hinzu kommt, dass mit *anonymen Methoden*, *Lambda-Ausdrücken*, ... C# um Konstrukte erweitert wurde, die sich gar nicht so einfach abmelden lassen. Ist das alles also nur ein Hype wie Jon Skeet sagt? Die Antwort ist wie so häufig: Es kommt darauf an. 

Wichtig in diesem Kontext ist die Überlegung was überhaupt ein *Memory Leak* ist. Da managed .NET in einem Sandkasten ausgeführt wird, gibt es **keine** Speicherlöcher, die die Lebenszeit einer Anwendung überdauern. Du hast ein *Memory Leak* in deiner Anwendung, wenn Objekte nicht vom *Garbage Collector* abgeräumt werden, von denen du es erwartet hättest. Es geht also darum, dass deine .NET Anwendung unnötig viel Speicher während ihrer Ausführung benötigt.

Nun zurück zum Abmelden von Events. Aus dem Zitat wird klar, dass Jon darüber spricht, dass *Publisher* und *Subscriber* eine ähnlich hohe Lebenserwartung haben. So ist es zum Beispiel häufig bei Oberflächen. Du meldest ein Objekt für einen *Button-Click* an. Dieses Objekt wird nun ungefähr so lange existieren wie der Button. Selbst, wenn das Objekt wesentlich eher abgeräumt werden könnte, ist es immer noch die Frage, wie groß das potentielle *"Memory Leak"* welches dadurch entsteht, ist.

Anders sieht es aus, wenn du es mit langen Lebenszyklen zutun hast. Damit meine ich sowohl die Lebensdauer der Anwendung wie auch die Lebensdauer des *Publishers* eines *Events*. Hast du eine Anwendung, die über Tage, Wochen oder Monate kontinuierlich Speicher verbraucht, ist das schon problematisch.

Die wesentliche Frage die du dir in diesem Zusammenhang stellen solltest, ist, lebt der *Publisher* wensentlich länger als der *Subscriber*. Dies kann zum Beispiel der Fall sein, wenn du ein `event` als `static` definierst. Eine andere Möglichkeit ist, wenn dein *Publisher* ein *Singleton* ist.

Haben deine Klassen beispielsweise ein *Service, Server, Manager, Repository oder Controller* im Namen und bieten *Events* an? Dann solltest du schon mal über die Lebenszeit deren Objekte nachdenken. 

Neben dem eigentlichen Speicherverbrauch, der für eine kurzlebige Anwendung, manchmal nicht so problematisch ist, kannst du auch ein Performanceproblem bekommen. Stell dir vor, dass du einen *Service* hast, an dem sich kontinuierlich neue *Subscriber* für ein *Event* anmelden. Nun verteilen die *Subscriber* diese *Events* unter Umständen auch noch an einige "Unterobjekte" weiter.

Was passiert? Korrekt! Es kann nun schnell dazu kommen, dass das Auslösen eines *Events*, tausende von weiteren *Events* nach sich zieht. Das alles nur, weil du zwar deine *Subscriber* richtig freigegeben hast (z.B. `Dispose` aufgerufen hast oder alle weiteren Referenzen gelöscht hast), aber das *Event* nicht abgemeldet hast.

Einige tausend *Events* wirst du auf einem aktuellen Rechner meistens noch nicht merken, aber wenn es mehr werden, dann dies deine Performance schon negativ beeinflussen.

Jetzt erstmal viel Spaß mit dem Überlegen ob du deine Events abmeldest oder nicht

Jan

### Merke

-	Ein *Memory Leak* oder *Speicherloch* in .NET bedeutet, dass Objekte nicht vom *Garbage Collector* abgeräumt werden, von denen du es erwartet hättest.
-	Wenn *Publisher* und *Subscriber* eine ähnliche Lebensdauer haben, dann ist das Abmelden nicht notwendig.
-	Langlebige Objekte, welche *Events* anbieten, können nicht nur ein Speicher-, sondern auch ein Performanceproblem, erzeugen, wenn kurzlebige Objekte sich von dem *Event* nicht wieder abmelden.
-	Insbesondere bei *static event* und *Singletons* mit *Events* musst du vorsichtig sein.
-	Klassen die im Namen *Service, Server, Manager, Repository oder Controller* haben und *Events* anbieten, sind potentielle Quellen für *Speicherlöcher*.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was bedeutet es, wenn du ein *Speicherloch / Memory Leak* in deiner .NET Anwendung hast?
-	Warum kann das Abmelden von *Events* nicht nötig / wichtig sein?
-	Wann solltest du *Events* auf jeden Fall abmelden?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Zu diesem LernMoment gibt es keinen Quellcode.
-	Ein Beispiel in dem nicht nur der Speicher, sondern auch die Performance zum Problem wird, findest du in [diesem Artikel](http://blogs.msdn.com/b/tess/archive/2006/01/23/net-memory-leak-case-study-the-event-handlers-that-made-the-memory-baloon.aspx) im MSDN-Blog von Tess Ferrandez.
-	In [diesem Artikel](http://blog.scottlogic.com/2010/02/19/forcing-event-consumer-cleanup-without-weak-events.html) von Collin Eberhardt findest du eine Methode, welche du zum Auffinden von noch bestehenden *Event-Referenzen* verwenden kannst. Nach Aussage von WPF-Guru Josh Smith ein Ansatz der in keinem `ViewModelBase` fehlen sollte.
