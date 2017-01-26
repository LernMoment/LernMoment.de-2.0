---
layout: post
title: "Vorsicht Optimierung: Die Klasse StringBuilder"
excerpt: "Regeln der Optimierung: 1.) Tue es nicht, 2.) Tue es noch nicht!"
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Methoden, string]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-05T06:00:00+02:00
---

Optimierung ist eines der Themen bei denen es mir wirklich schwer fällt nicht missionarisch zu werden. Meine Einstellung zum Thema kannst du ganz gut anhand folgender Optimierungsregeln erkennen:

> Regeln für das Optimieren:
> Regel 1: Tue es **nicht**
> Regel 2 (nur für Experten): Tue es **noch nicht**
> 	<cite>[M. A. Jackson](http://c2.com/cgi/wiki?RulesOfOptimization)</cite>

Was aber hat das alles mit der Klasse `StringBuilder` im Namensraum `System.Text` zutun? Diese Klasse bietet dir die Möglichkeit die Arbeit mit Strings bezüglich Performance zu optimieren. Jedesmal, wenn du `string` verwendest, dann verwendest du unveränderliche Objekte. Das einfache Verknüpfen von Strings geht immer einher mit dem anlegen von neuen Objekten.

```cs
string ausgabe = "Hallo";
ausgabe += " Welt!";
```

In dem vorherigen Beispiel wird beim ausführen von `+=` nicht etwa der existierende string `ausgabe` erweitert, sondern es wird ein neues Objekt erstellt und dann `ausgabe` zugewiesen. Wenn du also diesen Operator in einer Schleife mit vielen tausend Durchläufen verwendest, kann dich das schon einige hundert Millisekunden an Rechenzeit und einigen Speicher kosten.

Eine Möglichkeit der Optimierung bietet die Klasse `StringBuilder`. Sie repräsentiert eine dynamisch wachsende Zeichenkette. Über die Eigenschaft `Capacity` wird festgelegt, wie viele Zeichen alloziert werden. Der Standardwert ist 16 und somit wird beim anlegen einer Instanz von `StringBuilder` automatisch für 16 Zeichen Speicher alloziert.

Das vorherige Beispiel könntest du also mit `StringBuilder` so realisieren:

```cs
var ausgabe = new StringBuilder("Hallo");
ausgabe.Append(" Welt!");
```

Anhand dieses Beispiels zeigen sich gleich einige Probleme, die du bezüglich Optimierung bedenken solltest:

1.	Optimieren ist aufwändig: Wird in der Variante mit `StringBuilder` etwas eingespart? In dem Beispiel hier eher nicht. In einer Schleife mit vielen Durchläufen vielleicht schon. Du solltest aber immer eine genaue Analyse machen, was es tatsächlich bringt.
2.	Optimieren hat einen schlechten Einfluss auf die Verständlichkeit. Kanntest du die Klasse `StringBuilder` vorher? Weißt du welche Eigenschaften und Methoden sie hat? Wahrscheinlich nicht auswendig. Anders ist es bei den wichtigen Methoden eines strings. Diese kennen wohl die meisten, oder du kannst es wenigstens besser erahnen.
3.	Du entwickelst für den Kunden, nicht für dich. Häufig werden Optimierungen, die letztlich das Geld des Kunden kosten, ausgeführt, obwohl diesem es gar nicht wichtig ist. Wenn du ihn fragst, dann sagt er Performance ist wichtig. Wird er es aber merken?

Jetzt erstmal viel Spaß beim **nicht** optimieren

Jan

PS: Es gibt sicherlich Situationen in denen du optimieren kannst, aber sei dir sicher, dass du es **wirklich** brauchst.


### Merke

-	In .NET sind strings unveränderliche Objekte.
-	Die Klasse `StringBuilder` repräsentiert eine dynamisch wachsende Zeichenkette.
-	Optimierung kann in (wenigen) ausgewählten Situationen sinnvoll sein.
-	Optimierung geht immer zu lasten der (allgemeinen) Verständlichkeit.
-	Wenn du optimierst, dann sei dir sicher, dass du es richtig machst (Profiler verwenden) und das es einen wirklichen Nutzen für deinen Kunden hat.

### Lernquiz 

Verwende folgende Fragen um das gelernte von heute zu festigen:

-	Wie legst du eine dynamische Zeichenkette mit der Klasse `StringBuilder` an?
-	Was sagt die Eigenschaft `Capacity` aus?
-	Welche Nachteile musst du (wahrscheinlich) in kaufen nehmen, wenn du optimierst?

Am besten du schaust dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Heute kein Quellcode. Beschreibung und Beispiele zur Klasse `StringBuilder` findest du in [MSDN](https://msdn.microsoft.com/de-de/library/system.text.stringbuilder(v=vs.110).aspx).
-	["Vorsicht vor Optimierungen!"](http://ccd.ralfw.domainfactory-kunde.de/die-grade/roter-grad/#Vorsicht_vor_Optimierungen) ist eines der Prinzipien im roten Grad des [Clean Code Developers](http://ccd.ralfw.domainfactory-kunde.de).
-	Einen guten Artikel (allerdings nur in Englisch) zum Thema Optimierung mit StringBuilder findest du [hier](http://blog.codinghorror.com/the-sad-tragedy-of-micro-optimization-theater/).
