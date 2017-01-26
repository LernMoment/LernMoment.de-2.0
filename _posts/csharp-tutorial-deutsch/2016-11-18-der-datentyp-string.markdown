---
layout: post
title: "string - Einführung in Zeichenketten"
excerpt: "Der Datentyp string wird in fast jeder C#-Anwendung verwendet. Hier erfährst du die Grundlagen!"
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Datentypen, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-18T07:00:00+01:00
---

> Schau dir auch die weiteren Folgen des [C# Tutorial Deutsch](/csharp-tutorial-deutsch/) an.

Der Datentyp `string` kommt wohl in so ziemlich jedem Programm vor. In diesem Video erkläre ich dir, dass:

 - `string` ein Alias (also ein Verweis) auf `System.String` ist.
 - ein `string` eine Zeichenkette ist. Also ein Feld von Zeichen (`char`).
 - du auf einzelne Zeichen mit eckigen Klammern zugreifen kannst (`char zeichen = text[0]`).
 - ein `string` *immutable* also unveränderbar ist. D.h. du kannst einen `string` einmal anlegen und seinen Wert dann nicht mehr verändern.
 - du eine *Escapesequenz* (auch *Escape-Character* genannt) verwenden kannst um beispielsweise in einem `string` die Anführungsstriche zu verwenden (Beispiel: "Hier werden \"Anführungszeichen\" eingesetzt").  

Alles weitere erfährst du hier im Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/HbZTrkIE9Io" frameborder="0" allowfullscreen></iframe>

<div class="subscribe-notice">
<h5>Du möchtest lernen wie du in C# Anwendungen entwickelst und darin strings verwendest?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

### Weitere Links

 - Im Artikel [Kombinierte Formatierung für Konsole, ...](/csharp-programmieren/kombinierte-formatierung-fuer-konsole-datei/) zeige ich dir wie du Informationen in deine Zeichenkette bekommst ohne sie zu addieren. Das ist insbesondere für die Ausgabe auf der Konsole sehr interessant.
 - Der Artikel [string (C# Referenz) auf MSDN](https://msdn.microsoft.com/de-de/library/362314fe.aspx) beschreibt nochmals die Aspekte aus diesem Video. Allerdings finde ich den Artikel nicht sehr verständlich für Einsteiger.
 - Die Beschreibung der [Klasse String auf MSDN](https://msdn.microsoft.com/de-de/library/system.string(v=vs.110).aspx) gibt dir neben der Beschreibung aller Methoden und Eigenschaften auch viele Beispiele und viele ausführliche Erklärungen.
 - Eine weitere gute Einführung gibt es [in diesem Artikel von Biggle's Blog](http://www.biggle.de/blog/c-4-0-grundlagen-string-texthandling).
 - Eine Liste mit den unterstützten *Escapesequenzen* wie auch einer Erklärung findest auf [MSDN](https://msdn.microsoft.com/de-de/library/h21280bw.aspx). 

Jan
