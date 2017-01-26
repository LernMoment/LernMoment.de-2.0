---
layout: post
title: Von Prozessen zu Tasks
date: 2015-08-20T06:00:00+02:00
excerpt: Die 5 wichtigsten Klassen für Parallelisierung ab .NET 4.0
share: true
modified:
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Async, TPL]
image:
  feature: csharp-programmieren.jpg
---

Im LernMoment [Asynchron abgekürzt](/csharp-programmieren/tap-eap-apm-asynchron-abgekuerzt/) hast du dir die drei Konzepte für asynchrone Methoden angeschaut. Für das nebenläufige Ausführen von Aufgaben hat Microsoft nicht nur verschiedene Konzepte eingeführt, sondern auch viele verschiedene Klassen.

Die Klasse [Process](https://msdn.microsoft.com/de-de/library/system.diagnostics.process(v=vs.110).aspx) aus dem Namensraum `System.Diagnostics` gibt dir Zugriff auf Informationen und teilweise auch Kontrolle über Prozesse. Es ist also eine Klasse die eng an Betriebssystemprozessen angelehnt ist. So kannst du beispielsweise mit `Process.GetProcesses()` eine Liste aller aktuell laufender Prozesse auf deinem Rechner bekommen.

Grundsätzlich kannst du sagen, dass ein Prozess ein Programm abbildet. Handelt es sich dabei um ein .NET-Programm, so läuft innerhalb des Prozesses mindestens eine Instanz der Klasse [AppDomain](https://msdn.microsoft.com/de-de/library/system.appdomain(v=vs.110).aspx). Bei Bedarf kannst du in einem Prozess zusätzliche Objekte der Klasse `AppDomain` erstellen. In ihnen kannst du Assemblies laden die beispielsweise deine eigentliche Anwendung nicht beeinflussen soll. Du wirst diese Klasse selten benötigen.

Jede `AppDomain` wird mit mindestens einem `Thread` gestartet. Bei der Klasse [Thread](https://msdn.microsoft.com/de-de/library/system.threading.thread(v=vs.110).aspx) aus dem Namensraum `System.Threading` handelt es sich um einen "Managed Thread". Dies ist ein Konzept von .NET und ist **nicht** gleichbedeutend mit einem Betriebssystem-Thread. Neben den asynchronen Methoden war dies bis .NET 4.0 eine der Kernklassen für Parallelisierung.

Ein Objekt der Klasse [ThreadPool](https://msdn.microsoft.com/de-de/library/system.threading.threadpool(v=vs.110).aspx) existiert pro `Process`. Diese Klasse hat zum Ziel, dass du sehr einfach kurze Aufgaben im Hintergrund ausführen lassen kannst. Dabei nimmt der `ThreadPool` dir die nötige Verwaltung von Threads ab. Seit der Einführung der ["Task Parallel Library (TPL)"]() brauchst du `ThreadPool` nicht mehr selber verwenden. Die TPL greift intern auf eine überarbeitete Version des `ThreadPool` zu.

Die letzte und seit .NET 4.0 wohl auch wichtigste Klasse im Kontext von Parallelisierung ist [Task](https://msdn.microsoft.com/de-de/library/system.threading.tasks.task(v=vs.110).aspx). Du findest sie wie die anderen Klassen der TPL im Namensraum `System.Threading.Tasks`. Ein `Task` ist eine höhere Abstrahierung als `Thread`. Mit einem `Task` sagst du, dass du ein Ergebnis in der Zukunft haben willst. Dann kann .NET bzw. die TPL entscheiden wie konkret dies Ergebnis erzeugt werden soll. Dazu kann dann ein `Thread`, ein `Timer`, der `ThreadPool` oder was auch immer zum Einsatz kommen. Darum brauchst du dich im Detail nicht zu kümmern.

Jetzt erstmal viel Spaß mit der nebenläufigen Abarbeitung von Aufgaben

Jan


### Merke

-	Die Basiseinheit zur Parallelisierung ist ein Prozess. Mit der Klasse `System.Diagnostics.Process` kannst du aus .NET Prozesse auf Betriebssystemebene steuern und überwachen.
-	Jeder .NET-Prozess hat mindestens eine `AppDomain`. Eine `AppDomain` ist wie ein leichtgewichtiger Prozess.
-	Ein `Thread` führt deinen Quelltext aus. Die Klasse `System.Threading.Thread` ist nicht direkt vergleichbar mit einem Betriebssystem-Thread. Sofern du TPL verwendest, brauchst du nur sehr selten diese Klasse.
-	Pro Prozess gibt es einen `ThreadPool`. Er war vor der Einführung der TPL eine einfache Möglichkeit kurze Aufgaben im Hintergrund ausführen zu lassen.
-	`Task` sollte der Startpunkt für dich sein, wenn du etwas nebenläufiges in deiner Anwendung realisieren willst und mindestens .NET 4.0 verwendest.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was ist der Unterschied zwischen einem Task und einem Thread?
-	Ist eine Instanz von `System.Threading.Thread` das gleiche wie ein Betriebssystem-Thread?
-	Solltest du den `ThreadPool` verwenden, wenn du die TPL einsetzt?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Alle Links findest du im LernMoment.

