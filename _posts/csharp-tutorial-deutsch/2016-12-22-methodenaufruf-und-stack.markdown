---
layout: post
title: "Der Stack und was beim Methodenaufruf passiert"
excerpt: "Damit du dir bildlich vorstellen kannst was bei einem Methodenaufruf passiert erkläre ich dir den Stack (mit Lego-Steinen)!"
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Methoden, C#, Video, Tutorial]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-12-22T06:00:00+01:00
---

> Schau dir auch die weiteren Folgen des [C# Tutorial Deutsch](/csharp-tutorial-deutsch/) an.

Den Teilnehmern meines Kurses ["Einstieg in C# - Software programmieren wie ein Profi"](/einstieg-sharp/) biete ich die Aktion *#FragLernMoment* an. Das bedeutet, dass sie im Diskussionsforum eine Frage stellen können. Diese beantworte ich natürlich schriftlich, aber jede Woche gebe ich die Antwort zu einer Frage auch per Video.

Diese Folge des *C# Tutorial Deutsch* ist genau solch ein Video. Darin erkläre ich dir (sehr anschaulich ;) was der *Stack* ist und was er mit einem Methodenaufruf zutun hat. Die Frage dazu kam von einem Kursteilnehmer der zwar Methoden allgemein verstanden hatte sich aber nicht *bildlich* vorstellen konnte wie das mit der Wertübergabe und Rückgabe zur Laufzeit funktioniert.

Alles weitere erfährst du hier im Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/ma8wA5LmNXg" frameborder="0" allowfullscreen></iframe>

<div class="subscribe-notice">
<h5>Du willst mehr über Methoden erfahren?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" >></a>
</div>

### Was ist ein Stack?

Im Bereich von *Algorithmen und Datenstrukturen*, einem Teilgebiet der Informatik, wird ein *Stack* häufig mit *Keller* übersetzt. Du kannst Elemente von oben in den Keller legen und musst immer das zuletzt reingelegte zu erst raus nehmen.

Im Speichermanagement von *.NET* wird ein *Stack* verwendet um zur Laufzeit lokale Daten einer Methode zu speichern. Dabei bekommt jeder Methodenaufruf seinen eigenen *Stack-Frame*. In diesem Container legt die Laufzeitumgebung von .NET dann die ganzen Werte von Variablen ab.

Die allgemeine Funktionsweise eines *Stack* ist sehr gut auf [Wikipedia erklärt](https://de.wikipedia.org/wiki/Stapelspeicher).

### Warum braucht ein Methodenaufruf einen Stack-Frame?

Alles was in einer Methode lokal verwendet wird, wird lediglich während der Ausführung dieser Methode benötigt. Es ist allerdings möglich, dass eine Methode unterbrochen wird, weil sie eine andere Methode aufruft. Wenn dies geschieht, müssen alle Werte so wie sie momentan in der aufrufenden Methode sind gesichert werden.

Die aufgerufene Methode ihrerseits braucht allerdings auch einen Bereich wo ihre Werte gespeichert werden. Somit wird für jede Methode einfach ein *Stack-Frame* angelegt und auf den *Stack* gelegt. Ist diese Methode nun abgearbeitet, dann werden auch alle ihre lokalen Variablen gelöscht, denn diese werden später nie wieder gebraucht.

Damit lässt sich auch sehr anschaulich erklären warum zwei Methodenaufrufe (der gleichen Methode) komplett unabhängig sind. Es wird zwar immer der gleiche Quellcode ausgeführt, aber die Daten mit denen die Methode arbeitet sind jedesmal "neu", weil mit jedem Aufruf der Methode ein neuer *Stack-Frame* angelegt wird. Das kann übrigens sehr häufig passieren, wenn eine Methode in einer Schleife (z.B. *foreach*) ausgeführt wird.

### Weitere Links

Eine geniale Beschreibung von *Stack* und vielen weiteren Teilen des *.NET Speichermanagements* sind im (nur auf Englisch verfügbaren) Artikel [*".NET Memory Management Basics"*](https://www.simple-talk.com/dotnet/net-framework/net-memory-management-basics/) beschrieben. Wenn dich das Thema interessiert und du ein wenig Englisch kannst, dann solltest du den Artikel unbedingt lesen.

Auch wenn ich im Quellcode zu diesem Video nichts besonderes gemacht habe, kannst du ihn [hier anschauen](https://gist.github.com/suchja/a08ffacdbdf23a9077a03b7510deeb15) falls du etwas ausprobieren möchtest.

Viel Erfolg mit den nächsten Methodenaufrufen

Jan
