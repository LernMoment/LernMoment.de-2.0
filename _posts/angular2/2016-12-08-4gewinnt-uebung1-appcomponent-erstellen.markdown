---
layout: post
title: "4-Gewinnt Übung #1 - AppComponent erstellen!"
excerpt: "Als erste Aufgabe in diesem Übungsprojekt erstellst du die AppComponent."
categories: angular2
lernmoment: Angular2
lm-newsletter-group-id: 8
show-lm-newsletter-subscribe-box: true
share: true
tags: ["Angular 2", "Übung", "4-Gewinnt", Component]
image:
  feature: intro-code.jpg
modified:
date: 2016-12-08T06:00:00+01:00
---

**Übungsfokus:** Erstellen einer Komponente, Arbeitsweise
**Geschätzte Übungsdauer:** ca. 15 Minuten
**Quellcode im Ausgangszustand:** [zip-Datei](https://github.com/LernMoment/einstieg-angular2-4gewinnt/releases/tag/v0.1.0), [GitHub-Projekt](https://github.com/LernMoment/einstieg-angular2-4gewinnt/tree/d627bec1c1bb9568ddc5a503aa376ecf8612c201)

Wie für *TicTacToe* in Lektion [tbd] gezeigt, beginnen wir auch für *Vier Gewinnt* mit einer "leeren" Anwendung und deine erste Aufgabe ist es die `AppComponent` also die *"Wurzel-Komponente"* zu erstellen. Für diese Aufgabe ist es ausreichend, wenn die Komponente *"Vier Gewinnt"* als Überschrift im Template ausgibt. In dieser Übung geht es lediglich um das Erstellen der Komponente. Du brauchst sie also noch nicht verwenden!

Es geht hier also um die dir bereits bekannten Schritte:

 1. TypeScript-Klasse erstellen (hier AppComponent)
 2. Decorator für Komponenten importieren (von @angular/core)
 3. Decorator anlegen mit den wichtigsten Meta-Daten (Selector und Template)

Dabei solltest du darauf achten, dass du sowohl den Compiler (*tsc*) wie auch die *Developer Tools* von Chrome verwendest um deinen Quellcode zu überprüfen. Mit beiden Werkzeugen bekommst du Hinweise was momentan noch falsch sein könnte.

**WICHTIG:** Ein ganz elementarer Bestandteil einer jeden Übung (wenigstens, wenn sie dich weiterbringen soll) ist [das Reflektieren](http://clean-code-developer.de/die-grade/roter-grad/#Taeglich_reflektieren). Wenn du die Übung erledigt hast ziehe bitte eine Bilanz was die Übung dir bezüglich deiner Fähigkeiten gezeigt hat. So kannst du einfach für dich erkunden in welchen Bereichen du noch mehr Aufgaben machen solltest und welche Bereiche du schon gut beherrschst. Darüber hinaus bekommst du so für die nächsten Lektionen im Kurs eine Vorstellung auf was du besonders achten solltest. Du rufst also nicht nur Wissen ab, sondern kannst danach auch fokussierter lernen.

### Lösung

Hast du die Aufgabe umgesetzt, oder willst du nur ein wenig spicken? Mach es dir nicht zu einfach ;-). Du willst schließlich was lernen, oder?

Hier die konkreten Schritte die ich für die Lösung dieser Übung umgesetzt habe:

 1. Neue **Datei** `app.component.ts` erstellt.
 2. Darin die **Klasse** `AppComponent` erstellt und diese mit dem Schlüsselwort `export` versehe.
 3. Den **Decorator** importiert `import { Component } from '@angular/core';`
 4. Die Klasse mit dem **Decorator** dekoriert `@Component({ ... })`
 5. Den **selector** innerhalb des *Decorator* gesetzt `selector: "vg-app",`
 6. Das **template** innerhalb des *Decorator* gesetzt `template: "Vier Gewinnt"`
 7. `tsc` ausgeführt um zu sehen ob es Fehler vom Compiler gibt
 8. Mit `npm start` den Webserver gestartet
 9. Per *Chrome Developer Tools* festgestellt, dass nur die Fehler bezüglich *Favicon* und *bootstrap* angezeigt werden.

Was ich im Vergleich zum Ausgangszustand (also der Quellcode in seiner Form **vor** dieser Übung) geändert habe, siehst du in [diesem Commit](https://github.com/LernMoment/einstieg-angular2-4gewinnt/commit/30b9b41e8fca29712eba136dcf8d559a815dfc1f).

Viel Spaß beim Üben

Jan
