---
layout: post
title: "4-Gewinnt Übung #2 - AppComponent verwenden!"
excerpt: "In dieser Übung geht es darum, dass du die AppComponent in index.html und AppModule integrierst."
categories: angular2
lernmoment: Angular2
lm-newsletter-group-id: 8
show-lm-newsletter-subscribe-box: true
share: true
tags: ["Angular 2", "Übung", "4-Gewinnt", Component]
image:
  feature: intro-code.jpg
modified:
date: 2016-12-13T06:00:00+01:00
---

**Übungsfokus:** Verwenden einer Component, Arbeitsweise
**Geschätzte Übungsdauer:** ca. 15 Minuten
**Quellcode im Ausgangszustand:** [zip-Datei](https://github.com/LernMoment/einstieg-angular2-4gewinnt/releases/tag/v0.1.1), [GitHub-Projekt](https://github.com/LernMoment/einstieg-angular2-4gewinnt/tree/f65a897b67cadb83b780c73c0905145ad6e435ea)

Die in der [vorherigen Übung](/angular2/4gewinnt-uebung1-appcomponent-erstellen/) erstellte `AppComponent` soll nun verwendet werden. D.h. du sollst sie in das `AppModule` und die `index.html` integrieren. Dazu solltest du die in der Lektion vorgestellten Schritte ausführen:

 1. Die Komponente ins `AppModule` importieren
 2. Die Komponente im Rahmen des Moduls bekannt machen (Declaration)
 3. Die Komponente in den "Komponenten-Baum" einfügen. Dieser Schritt bedeutet üblicherweise den *Selector* als *Tag* im `Template` verwenden. Da die `AppComponent` die Wurzel-Komponente ist, musst du ihren *Selector* als *Tag* im `index.html` verwenden und nicht im `Template` einer anderen Komponente.
 4. Um eine erste Instanz der `AppComponent` von Angular 2 anlegen zu lassen, musst du sie im `AppModule` noch in der `bootstrap` Eigenschaft eintragen.

Wenn du diese Schritte umgesetzt hast, sollte der Text *"Vier Gewinnt"* auf der Webseite erscheinen.

Dabei solltest du wieder darauf achten, dass du sowohl den Compiler (*tsc*) wie auch die *Developer Tools* von Chrome verwendest um deinen Quellcode zu überprüfen. Mit beiden Werkzeugen bekommst du Hinweise was momentan noch falsch sein könnte.

**WICHTIG:** Ein ganz elementarer Bestandteil einer jeden Übung (wenigstens, wenn sie dich weiterbringen soll) ist [das Reflektieren](http://clean-code-developer.de/die-grade/roter-grad/#Taeglich_reflektieren). Wenn du die Übung erledigt hast ziehe bitte eine Bilanz was die Übung dir bezüglich deiner Fähigkeiten gezeigt hat. So kannst du einfach für dich erkunden in welchen Bereichen du noch mehr Aufgaben machen solltest und welche Bereiche du schon gut beherrschst. Darüber hinaus bekommst du so für die nächsten Lektionen im Kurs eine Vorstellung auf was du besonders achten solltest. Du rufst also nicht nur Wissen ab, sondern kannst danach auch fokussierter lernen.

### Lösung

Hast du die Aufgabe umgesetzt, oder willst du nur ein wenig spicken? Mach es dir nicht zu einfach ;-). Du willst schließlich was lernen, oder?

Hier die konkreten Schritte die ich für die Lösung dieser Übung umgesetzt habe:

 1. Die **AppComponent** im `AppModule` importiert `import { AppComponent } from './app.component';`
 2. Die **AppComponent** im `NgModule` *Decorator* innerhalb der Eigenschaft **declarations** deklariert `declarations: [AppComponent]`
 3. Die **AppComponent** im `NgModule` *Decorator* innerhalb der Eigenschaft **bootstrap** "instanziiert" `bootstrap: [AppComponent]`
 4. Die **AppComponent** mit ihrem Selector `vg-app` in der **index.html** eingetragen `<vg-app>Lade das Spiel ...</vg-app>`
 5. `tsc` ausgeführt um zu sehen ob es Fehler vom Compiler gibt
 6. Mit `npm start` den Webserver gestartet
 7. Per *Chrome Developer Tools* festgestellt, dass nur die Fehler bezüglich *Favicon* und *bootstrap* angezeigt werden.

Was ich im Vergleich zum Ausgangszustand (also der Quellcode in seiner Form **vor** dieser Übung) geändert habe, siehst du in [diesem Commit](https://github.com/LernMoment/einstieg-angular2-4gewinnt/commit/d90eeb90f2bf7f9b42bdc3c2276b7153061a3569).

Viel Spaß beim Üben

Jan
