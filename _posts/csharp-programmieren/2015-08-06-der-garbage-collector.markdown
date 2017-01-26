---
layout: post
title: Der Garbage Collector
excerpt: Antworten auf die wichtigsten Fragen um Quelltext ohne Speicherlöcher zuerstellen.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Garbage Collection]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-06T06:00:00+02:00
---

Inbesondere, wenn du von C oder C++ kommst, dann ist der Garbage Collector eine tolle Sache. Im besten Fall brauchst du nichts machen, und er passt auf, dass der Speicher aller Objekte freigegeben wird. Der Garbage Collector ist allerdings ein komplexes Gebilde, welches du beeinflussen kannst und solltest. Es kann sich nämlich direkt auf das Verhalten und die Performance deiner Anwendung auswirken.

#### Wann läuft der GC?

Der Garbage Collector ist Bestandteil der Common Language Runtime (CLR) und läuft in einem eigenen Thread. Er läuft, wenn deine Anwendung gerade keine Prozessorzeit in Anspruch nimmt und/oder ein gewisser Grenzwert an Speicherverbrauch überschritten ist. Niemand kann also mit Gewissheit sagen, wann der GC tatsächlich läuft. Es ist jedoch sichergestellt, dass er läuft, bevor der Speicher, der deiner Anwendung zugewiesen wurde, verbraucht ist.

#### Was macht der GC?

Jedesmal, wenn der GC läuft, überprüft er, ob es Objekte im Managed Heap gibt, welche nicht referenziert sind. Findet er solche Objekte, dann versucht er sie "runter zufahren" (finalize) und schließlich wird ihr Speicher wieder freigegeben. 

Wichtig ist, dass der GC alle laufenden Threads unterbricht, außer dem Thread, der ihn angestossen hat. Außerdem kann er je nach aktuellem Status einiges an Rechenzeit verbrauchen. Somit kann er in deiner nebenläufigen Anwendung einiges verändern und stören. 

#### Was musst du machen?

Grundsätzlich gibt es folgende Aktionen bei denen du den GC im Hinterkopf haben solltest:

1.	Verwendung von Klassen, die `IDisposable` implementieren. Wenn eine Klasse dieses Interface implementiert, verwendet sie entweder Ressourcen, die nicht vom GC entfernt werden können, oder es sollte schon etwas aufgeräumt werden, bevor der GC läuft. Ein klassisches Beispiel ist `StreamReader`. Ein Objekt dieser Klasse, hält die Datei so lange offen, bis entweder `Dispose` aufgerufen wurde oder der GC das Objekt gelöscht hat. Somit kann die Datei für andere Benutzer lange gesperrt sein.
2.	Erstellen von Klassen die unmanaged Ressourcen verwenden. Erstellst du eine solche Klasse, musst du dir überlegen, wie und wann die Ressourcen freigegeben werden sollen. Dazu kannst du einen Destruktor und/oder `IDisposable` einsetzen.

Jetzt erstmal viel Spaß beim Experimentieren mit der Speicherverwaltung

Jan


### Merke

-	Die Ausführung des Garbage Collectors ist nicht deterministisch
-	Je nach Anwendung kann das Ausführen des Garbage Collectors einiges an Rechenzeit verschlingen
-	Der Garbage Collector kann lange Zeit nicht laufen, wenn deine Anwendung viel Rechenzeit benötigt, oder wenig Speicheroperationen verwendet.
-	Wenn du eine Klasse verwendest, die `IDisposable` implementiert, solltest du überlegen, wann du `Dispose` aufrufst.
-	Beim erstellen einer Klasse die Ressourcen verwendet, die der GC nicht berücksichtigt, musst du entscheiden wie du Destruktor und `IDisposable` einsetzt.

### Lernquiz 

Verwende folgende Fragen um das gelernte von heute zu festigen:

-	Wann wird der Garbage Collector ausgeführt?
-	Welche Objekte kann er nicht automatisch löschen?
-	Wann musst du etwas tun um den Garbage Collector zu unterstützen?

Am besten du schaust dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Heute kein Quellcode.
-	Eine sehr einfache Einführung in das Thema Garbage Collector findest du [hier](http://openbook.rheinwerk-verlag.de/visual_csharp_2010/visual_csharp_2010_04_008.htm)
-	Eine umfangreichere Diskussion findest du auf [MSDN](https://msdn.microsoft.com/de-de/library/vstudio/ee787088(v=vs.110).aspx)
