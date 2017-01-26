---
layout: post
title: "Asynchron abgekürzt: APM, EAP und TAP"
excerpt: Wann du welchen Ansatz zur asynchronen Ausführung verwendest.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Async, TPL]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-14T06:00:00+02:00
---

Mit .NET 1.0 wurde das ["Asynchronous Programming Model (APM)"](https://msdn.microsoft.com/de-de/library/ms228963(v=vs.110).aspx) eingeführt. Das "APM" basiert auf ["Managed Threading"](https://msdn.microsoft.com/de-de/library/3e8s7xdd(v=vs.110).aspx) und eignet sich um eigene Methoden asynchron aufzurufen. Zusätzlich wurden in .NET viele synchrone Methoden mit asynchronen Methoden nach "APM" ergänzt.

Du erkennst asynchrone Methoden nach "APM" daran, dass `IAsyncResult` verwendet wird und das es eine `Begin...` Methode und eine `End...` Methode gibt. Die Klasse `FileStream` stellt zum Beispiel die Methoden `BeginRead` und `EndRead` zur Verfügung. Die Idee bei "APM" ist, dass du mit der `Begin...` Methode einen Thread startest in dem die jeweilige Aufgabe ausgeführt wird. Bei `FileStream.BeginRead` also das lesen aus der Datei. Mit der `End...` Methode kannst du dann später das Resultat abholen. Dabei kann sowohl per Polling als auch mit Callback auf die asynchrone Methode gewartet werden.

Nach "APM" wurde das ["Event-based Asynchronous Pattern (EAP)"](https://msdn.microsoft.com/de-de/library/ms228969(v=vs.110).aspx) eingeführt. Auch das "EAP" basiert auf "Managed Threading". Ab .NET 2.0 (bis .NET 4.5) empfiehlt Microsoft das "EAP" dem "APM" vorzuziehen (mit wenigen [Ausnahmen](https://msdn.microsoft.com/de-de/library/ms228966(v=vs.110).aspx)).

Auch beim EAP wurden einige synchrone Methode mit asynchronen ergänzt. So bietet beispielsweise die Klasse `WebClient` die für "EAP" typischen `...Async` Methoden und das dazugehörige Event `...Completed` an. Die `WebClient.DownloadDataAsync` Methode startet einen Thread. Wenn die entsprechende Aufgabe abgearbeitet ist, in diesem Fall also die Daten geladen sind, wird das Event `WebClient.DownloadDataCompleted` ausgelöst.

Sowohl "APM" wie auch "EAP" wurden in .NET 4.5 durch das ["Task-based Asynchronous Pattern (TAP)"](https://msdn.microsoft.com/de-de/library/hh873175(v=vs.110).aspx) abgelöst. Dieses verwendet nicht mehr direkt "Managed Threading", sondern basiert auf Tasks, welche mit der ["Task Parallel Library (TPL)"](https://msdn.microsoft.com/de-de/library/dd460717(v=vs.110).aspx) in .NET 4.0 eingeführt wurden.

Methoden nach dem "TAP" erkennst du daran, dass sie `Task` oder `Task<T>` zurückgeben. Außerdem sollten sie nach Vorgabe von Microsoft `...Async` oder `...TaskAsync` genannt werden. Wenn du dir mal die Methoden von `WebClient` anschaust, wirst du erkennen, dass es dort Methoden nach "EAP" und "TAP" gibt. Zu "TAP" gehört zum Beispiel `DownloadDataTaskAsync`.

Wichtig ist, dass du die verschiedenen Ansätze erkennen und zuordnen kannst. Wenn du unter .NET 4.5 oder neuer arbeitest, dann solltest du möglichst immer "TAP" verwenden. Dies ist auch am einfachsten. Solltest du über Klassen stolpern, die noch "APM" oder "EAP" verwenden, dann kannst du sie recht einfach [nach "TAP" migrieren](https://msdn.microsoft.com/de-de/library/hh873178(v=vs.110).aspx).

Jetzt erstmal viel Spaß beim sicheren Erkennen von asynchronen Mustern

Jan


### Merke

-	Die Basis von allen asynchronen Mustern / Ansätzen in C# ist das "Managed Threading".
-	"APM" erkennst du an `IAsyncResult` und `Begin...` und `End...` Methoden. Es wurde bis .NET 2.0 empfohlen.
-	"EAP" solltest du verwenden, wenn du mit einer .NET Version zwischen 2.0 und 4.5 arbeitest. Du erkennst dieses Muster an `...Async` Methoden und entsprechenden `...Completed` Events.
-	"TAP" ist das neueste was Microsoft in diesem Bereich bietet. Du erkennst es daran, dass die entpsrechenden Methoden `...Async` oder `...TaskAsync` heißen und ein `Task` oder `Task<T>` Objekt zurück geben.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was bedeutet die Abkürzung "APM" und wie erkennst du, dass eine asynchrone Methode danach realisiert ist?
-	Was bedeutet die Abkürzung "EAP" und wie erkennst du, dass eine asynchrone Methode danach realisiert ist?
-	Was bedeutet die Abkürzung "TAP" und wie erkennst du, dass eine asynchrone Methode danach realisiert ist?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Sämtliche Links findest du im LernMoment.
