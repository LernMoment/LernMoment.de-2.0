---
layout: post
title: "Twitch Client Teil #3 - Daten lesen mit TwitchAPI"
excerpt: "Verwende Methoden wie SetClientId und GetUser der TwitchAPI um Daten eines Benutzer vom Twitch-Server zu holen."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Twitch, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-15T06:00:00+01:00
---

> Die weiteren Teile dieser Mini-Serie findest du hier:
> Teil #1 - [Einleitung  und Authentifizierung](/csharp-tutorial-deutsch/twitch-client-einleitung/)
> Teil #2 - [Architektur eines Twitch Client](/csharp-tutorial-deutsch/twitch-client-architektur/)
> Teil #4 - [AccessToken erstellen](/csharp-tutorial-deutsch/twitch-client-access-token-erstellen/)
> Teil #5 - [Schreiben per TwitchAPI - Follow Channel Client](/csharp-tutorial-deutsch/twitch-client-daten-schreiben-per-api/)

Links zu den im Video genannten Seiten und Ressourcen findest du am Ende dieses Artikels.

Nach der ganzen Theorie geht es nun endlich in die Praxis. Als ersten Schritt zeige ich dir wie du lesend die TwitchAPI nutzt um Daten über Benutzer, Kanäle, Videos usw. abrufen kannst. Damit kannst du beispielsweise Statistiken erstellen. 

In diesem Video erfährst du, wie du:

 - die [TwitchLib](https://www.nuget.org/packages/TwitchLib) in ein Konsolenprojekt bekommst,
 - die Client-Id an der TwitchAPI (`TwitchAPI.SetClientId`) setzt um im nächsten Schritt Daten abzufragen und
 - Informationen über einen Twitch-Benutzer mit `TwitchAPI.GetUser` bekommst.

<iframe width="560" height="315" src="https://www.youtube.com/embed/eO8vX7oQ1bs" frameborder="0" allowfullscreen></iframe>

### Die TwitchAPI und async / await

Die wichtigsten Punkte zur TwitchAPI habe ich dir bereits in [Architektur eines Twitch Client](/csharp-tutorial-deutsch/twitch-client-architektur/) erläutert. Hier geht es mir nun mehr um die Syntax.

Wie du [im Quellcode](https://github.com/swiftyspiffy/TwitchLib/blob/master/TwitchLib/TwitchAPI.cs) zur Klasse `TwitchAPI` sehen kannst, handelt es sich um eine statische Klasse. Das bedeutet du brauchst kein Objekt von dieser Klasse sondern nimmst einfach den Klassennamen und kannst damit alle zur Verfügung gestellten Methoden aufrufen. Das macht in diesem Kontext auch Sinn, weil es keinen Zustand gibt, der in einem Objekt zwischen verschiedenen Methodenaufrufen gespeichert werden müsst.

Wenn du eine Methode wie beispielsweise `TwitchAPI.GetUser()` ausführst, dann macht die TwitchAPI nichts anderes als dem Twitch-Server eine Nachricht (per HTTP) zu schicken und auf eine entsprechende Antwort zu warten. Sobald der Server die Antwort gesendet hat, wird diese in ein Objekt einer entsprechenden C#-Klasse (z.B. `User` - hier [der Quellcode dieser Klasse](https://github.com/swiftyspiffy/TwitchLib/blob/master/TwitchLib/TwitchAPIClasses/User.cs)) extrahiert und an dein Programm zurück gegeben. Damit ist die Aufgabe erledigt. Da alle Methoden in der TwitchAPI als asynchron definiert sind, reicht ein Methodenaufruf aus, um den Vorgang komplett abzuarbeiten und alle relevanten Resultate zurück zugeben. Die nächste Anfrage beim Twitch-Server ist dann komplett unabhängig und somit ist es gut und richtig, dass die Klasse `TwitchAPI` komplett `static` ist. 

Was aber nun bedeutet dieses `async`? Mit den Schlüsselwörtern `async` und `await` wird eine Technologie in .NET verwendet die sich *Task Parallel Library (TPL)* nennt. Die Idee ist, dass du Aufgaben die eine gewisse Zeit dauern in den Hintergrund auslagerst. Somit ist es möglich, dass der Benutzer Eingaben macht und Ausgaben sieht während *"nebenbei"* andere Aufgaben ablaufen. In unserem Fall ist das die Interaktion mit dem Twitch-Server. Das ganze nennt sich asynchrone Programmierung und ist insbesondere bei Anwendungen mit grafischer Oberfläche oder "rechenintensiven" Anwendungen wichtig. Für unsere Konsolenanwendung ist das nun nicht unbedingt wichtig, weil wir ein paar Sekunden warten könnten bis die TwitchAPI alle Daten gesammelt und extrahiert hat. Da jedoch alle Methoden in der Klasse `TwitchAPI` als `async` definiert sind, haben wir hier keine andere Möglichkeit als die Methoden asychron aufzurufen.

Was bei der Verwendung von `async` und `await` passiert, habe ich im Artikel [Einführung in Async / Await](/csharp-programmieren/einfuehrung-in-async-und-await/) bereits erklärt. Wenn du die TwitchAPI in deinem Projekt verwenden willst, dann solltest du folgende Punkte berücksichtigen:

 1. Alle Methoden der `TwitchAPI` (mit Ausnahme von `SetClientId()`) müssen mit `await` aufgerufen werden.
 2. Das Schlüsselwort `await` kann nur in einer Methode verwendet werden die selber als asynchron definiert ist und den Rückgabewert `Task` verwendet.
 3. Du definierst eine Methode als asynchron in dem du das Schlüsselwort `async` vor dem Rückgabewert im Methodenkopf verwendest.
 4. Im `Main` eines Konsolenprojekts kannst du nicht `await` verwenden. Du musst eine eigene Methode definieren (egal ob diese `static` ist oder nicht).
 5. In einem Projekt mit Grafischeroberfläche kannst du `async` in *EventHandlern* verwenden. Somit kannst du Methoden von `TwitchAPI` aufrufen, wenn beispielsweise ein Button gedrückt wird.  

<div class="subscribe-notice">
<h5>Du kennst static nicht, oder weißt nicht wie du Methoden definierst?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

### In wenigen Schritten die passenden Daten bekommen

Nachdem wir uns nun mit den Grundlagen vertraut gemacht haben, geht das eigentliche holen der entsprechenden Daten sehr einfach. Ich habe dir im folgenden die wichtigsten Schritte nochmals aufgeschrieben:

 1. `TwitchAPI.SetClientId` aufrufen, oder sicherstellen, dass es bereits aufgerufen wurde.
 2. Herausfinden welche Methode der `TwitchAPI` die von dir gewünschten Daten liefert. [Dieser Überblick](https://github.com/swiftyspiffy/TwitchLib#twitchapi) sollte dir eine erste Idee liefern. Machmal ist es auch notwendig, dass du mehrere Methoden aufrufst um alle gewünschten Informationen zu bekommen.
 3. Erstelle eine statische und asychrone Methode in der du die entsprechende Methode der `TwitchAPI` mit `await` aufrufst und dir erstmal die für dich relevanten Werte der Antwort auf der Konsole ausgibst. Du siehst du genau was zurück kommt und du kannst dir Überlegen wie du die Daten weiterverarbeiten möchtest.

Nun kommt es auf deine Anwendung an. Möchtest du die Daten einfach nur ausgeben, dann bist du ja bereits fertig. Vielleicht möchtest du die Daten aber auch sammeln. Dann kannst du das erhaltene Objekt mit der Antwort einfach in einer Kollektion speichern. Eine weitere Möglichkeit ist, dass du die Daten in eine Datei schreibst. Diese könntest du dann beispielsweise mit Excel einlesen und darin weiterverarbeiten. Das schreiben von Daten in eine Textdatei habe ich im [C# Tutorial Deutsch - Dateien lesen und schreiben mit File](https://youtu.be/KjP9v7xPUQE) beschrieben.

### Weitere Links

 - Wenn du nicht weißt, wie du mit NuGet die TwitchLib in dein Projekt bekommst, dann habe ich das in [dieser Episode des C# Tutorials Deutsch](https://youtu.be/bsuEqUelxvg?list=PLP2TrPpx5VNkr-wmkjguVZAvN4T5EPJbF) für dich erklärt.
 - [Das GitHub Projekt](https://github.com/LernMoment/csharp-twitch-client) beinhaltet den kompletten Quellcode von mir zu diesem Client (inkl. weiterer Beispiele die ich nicht im Video gezeigt habe).
 - Weitere Infos zu `async` und `await` gibt es im Artikel [Einführung in Async / Await](/csharp-programmieren/einfuehrung-in-async-und-await/)  
 - Auf [Twitch Developers](https://dev.twitch.tv/docs) findest du viele Informationen über Daten die der Twitch-Server zurück liefert. Darunter auch beispielsweise eine genau Beschreibung der [Benutzerdaten](https://dev.twitch.tv/docs/api/v3/users/). Diese Beschreibung sind häufig etwas umfangreicher als die Dokumentation der *TwitchLib*. Allerdings geht es dort immer um *HTTP* und nicht *C#*. 
 - [C# Tutorial Deutsch - Dateien lesen und schreiben mit File](https://youtu.be/KjP9v7xPUQE) beschreibt wie du Daten in eine Textdatei schreiben kannst.

Viel Erfolg beim Erstellen deines Clients

Jan
