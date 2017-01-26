---
layout: post
title: Mit zyklomatischer Komplexität Quelltext vereinfachen
excerpt: Die McCabe Metrik zeigt dir wo du Fehler und Testaufwand minimieren kannst.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Metrik, Qualität]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-27T06:00:00+02:00
---

Seit gut 40 Jahren gibt es die Metrik der zyklomatischen Komplexität von Thomas J. McCabe. Unabhängig von ihren Vor- und Nachteilen, kann sie für dich ein Wegweiser sein, um Aufwand für Wartung und Test auf relevante Stellen im Quellcode zu fokussieren.

Sowohl MonoDevelop wie auch Visual Studio und weitere Werkzeuge zur Quelltextanalyse erlauben die Berechnung der *cyclomatic complexity*, wie sie im Englischen heißt. In Visual Studio ist sie Teil der Code-Metriken und nur in den Versionen Ultimate und Premium verfügbar.

Was aber bedeutet sie denn nun?

> Hinter der Software-Metrik von McCabe steckt der Gedanke, dass ab einer bestimmten Komplexität das Modul für den Menschen nicht mehr begreifbar ist. Die cyclomatic complexity ist definiert als Anzahl linear unabhängiger Pfade auf dem Kontrollflussgraphen eines Moduls. Damit ist die Zahl eine obere Schranke für die Anzahl der Testfälle, die nötig sind, um eine vollständige Zweigüberdeckung des Kontrollflussgraphen zu erreichen.
> --<cite>[Wikipedia](https://de.wikipedia.org/wiki/McCabe-Metrik)</cite>

Diese Metrik gibt dir also einen Anhaltspunkt, welche Bereiche im Quelltext potentiell unzuverlässig bzw. schwer änderbar sind. Sobald du über die Metrik einen verdächtigen Bereich identifiziert hast, kannst du folgende Schritte anwenden:

1.	prüfe, ob der verdächtige Quelltext tatsächlich kompliziert ist,
2.	entscheide, ob du ihn überarbeiten willst (Refactoring),
3.	entscheide, ob zusätzliche oder besondere Tests benötigt werden.

Die Metrik wird üblicherweise auf dem ganzen Projekt berechnet. Entsprechend bekommst du Werte für jede Klasse und jede Methode. In Visual Studio wie auch anderen Werkzeugen, werde die berechneten Werte für Klassen und Methoden übersichtlich dargestellt. So erkennst du sofort in welchen Bereichen es Abweichungen gibt. Sind diese besonders groß, ist es ein Indiz, dass du die 3 Schritte von oben anwenden solltest.

Nachdem die Metrik schon älter ist, gibt es auch Kritik an ihr. Insbesondere die Fixierung auf konkrete Werte ist umstritten. McCabe sagt, dass ein Wert größer 10 problematisch ist. Eine Fixierung auf feste Zahlen in diesem Kontext finde ich nicht gut. Wie eben schon angedeutet, solltest du nach Abweichungen suchen. Wenn alle Methoden einen Wert von 1 aufweisen nur eine 5 hat, dann könnte es sein, dass genau da etwas zutun ist. Da ist es unerheblich, ob 5 innerhalb irgend einer Grenze liegt oder nicht.

Jetzt erstmal viel Spaß mit der einfachen Metrik zur Komplexität

Jan

PS: In Visual Studio kannst du unter Code Analysis auch einstellen, dass du eine Warnung bekommst, wenn der Wert für eine Methode über 25 liegt. Dann ist mit Sicherheit etwas im Busch.

### Merke

-	Komplexität von Klassen und Methoden wirkt sich negativ auf die Zuverlässigkeit und Wartbarkeit aus.
-	Die zyklomatische Komplexität gibt an wie viele Verzweigungen (if-else, switch-case, ...) dein Quelltext enthält.
-	Für diese Metrik ist der tatsächliche Wert weniger relevant als die Abweichung zwischen den Werten von Klassen und Methoden.
-	Die Metrik kann dir helfen verdächtige Bereiche im Quelltext zu identifizieren. Sie ist kein eindeutiger Anhaltspunkt für ein Problem.
-	Wenn die Metrik dich auf ein potentielles Problem hinweist, solltest du selber überprüfen und entscheiden, ob du deinen Quelltext oder deine Tests ändern musst.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Auf welche Probleme kann dich die zyklomatische Komplexität hinweisen?
-	Was solltest du tun, wenn du mit der Metrik einen verdächtigen Bereich erkannt hast?
-	Was bedeutet es, wenn die Metrik für eine Methode den Wert 10 hat?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Zu diesem LernMoment gibt es keinen Quelltext.
-	[Dieser Artikel](http://blogs.msdn.com/b/zainnab/archive/2011/05/17/code-metrics-cyclomatic-complexity.aspx) zeigt dir anhand von Visual Studio 2010 wie du die Metrik berechnen läßt und gibt einige Hintergrundinformationen.
-	[Hier](http://www.mccabe.com/pdf/mccabe-nist235r.pdf) **die** Erklärung der Metrik und alles was mit ihr in Zusammhang steht. Achtung, es sind über 100 Seiten.
-	Wie du die Metriken in Visual Studio 2015 berechnen lassen kannst ist [hier](https://msdn.microsoft.com/de-de/library/bb385908.aspx) beschrieben.
