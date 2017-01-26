---
layout: post
title: "Übung #1 - Ein Papagei als einfache Component"
excerpt: "Übe das Erstellen von einfachen Angular 2 Anwendungen."
categories: angular2
lernmoment: Angular2
lm-newsletter-group-id: 8
show-lm-newsletter-subscribe-box: true
share: true
tags: ["Angular 2", "Übung", Plunker, Component]
image:
  feature: intro-code.jpg
modified:
date: 2016-10-08T06:00:00+01:00
---

**Übungsfokus:** Plunker verwenden, Projekt erstellen, einfache Ein- und Ausgabe
**Geschätzte Übungsdauer:** ca. 15 Minuten

In dieser Übung geht es darum, dass du ein bestehendes Projekt auf Plunker verwendest um eine eigene kleine Anwendung zu entwickeln.

Deine Anwendung soll eine Überschrift anzeigen, dem Benutzer die Möglichkeit bieten eine Texteingabe zu machen und den gleichen Text wieder ausgeben, wenn ein Button gedrückt wird. Du benötigst dazu Elemente die ich in der ersten Lektion bereits verwendet habe.

Folgende *HTML* Elemente kannst du in dieser Übung verwenden:

  - Headline `h1` & `h2`
  - Label
  - Button
  - Input

Folgende *Angular 2* Elemente kannst du verwenden:

  - `[(ngModel)]` - Zum Setzen eines TypeScript Attributs innerhalb des Tags `<input>`
  - `(click)` - Zum Aufrufen einer TypeScript-Methode innerhalb des Tags `<button>`
  - `{% raw %} {{ }} {% endraw %}` - Zur Ausgabe des Wertes eines TypeScript Attributs. Der Name des Attributs kommt zwischen die Klammern.

Als Basis für diese Übung kannst du das [Angular 2 Seed - Projekt](http://plnkr.co/edit/im8nP15vMFYXsGYrnLoB) auf Plunker verwenden. Erstelle dort einfach einen Fork davon, passe den `title` und den `tag` an (wie in der vorherigen Lektion gezeigt) und dann kannst du direkt in der `AppComponent` anfangen den HTML und TypeScript Code zu schreiben.

Am besten setzt du die komplette Übung in kleinen Schritten um. Ich habe zum Beispiel folgende Schritte gemacht:

 1. Auf Plunker einen Fork vom [Angular 2 Seed - Projekt](http://plnkr.co/edit/im8nP15vMFYXsGYrnLoB) erstellt und angepasst
 2. In `app.component.html` eine Überschrift eingefügt (z.B. `<h1>Hallo Papagei!</h1>`)
 3. Ein Attribut mit dem Namen `ausgabe` in TypeScript der Klasse `AppComponent` hinzugefügt, initialisiert und im *HTML* ausgegeben
 4. Die Methode `wiederholen` in TypeScript der Klasse `AppComponent` hinzugefügt (Quellcode siehe weiter unten)
 5. In `app.component.html` einen Button erstellt der die Methode `wiederholen` aufruft
 6. Ein weiteres Attribut mit dem Namen `eingabe` definiert
 7. Ein Label und Input Element in `app.component.html` definiert welches den Wert des Attributs `eingabe`verändert 

Dabei achte ich immer darauf, dass nach jedem Schritt eine lauffähige Anwendung erstellt ist die ich dann auch ausprobiere. So kann ich schnell sehen an welchen Stellen ich einen Fehler gemacht habe, oder auch was mit noch nicht klar ist.

**Wichtig:** Du musst natürlich noch nicht die Syntax und die ganzen Hintergründe verstehen bzw. auswendig hier anwenden. In dieser Übung geht es darum, dass du das bisher gelernte abrufst und festigst. Daher haben wir dir hier die nötige Syntax nochmals aufgeschrieben. Was das im Detail bedeutet lernst du in den kommenden Lektionen. 

*Attribut in TypeScript definieren*

```js
private ausgabe: string = "test";
```

Nach dem Zugriffsmodifizierer (`private` in diesem Fall) kommt der Name des Attributs gefolgt vom Datentyp und der optionalen Initialisierung.

*Attribut in HTML anzeigen*

```html
{% raw %}
<h2>{{ ausgabe }}</h2>
{% endraw %}
```

Zeigt das Attribut `ausgabe` an. Dabei muss ein solches Attribut im TypeScript der Komponente definiert sein.

*Die Methode wiederholen*

Bei dieser Übung geht es darum, dass du Plunker, Angular 2 und die Interaktion mit TypeScript übst. Daher hier die Methode `wiederholen`. Auch wenn sie nicht kompliziert ist, brauchst du so nicht lange herum experimentieren. Diese kannst du direkt in die Klasse `AppComponent` übernehmen:

```js
private wiederholen() {
  this.ausgabe = "Papagei sagt: " + this.eingabe;
}
``` 

*Methode vom Button auslösen lassen*

```html
<button (click)="wiederholen()">nach plappern</button>
```

In Angular 2 kannst du über das *Event-Binding* einem Event eines DOM-Elements eine Methode deiner *Component* zuweisen. In diesem Beispiel wird `wiederholen` ausgeführt, sobald der `Button` betätigt wird.

*Eingabeelement an Attribut binden*

In der ersten Lektion habe ich dir bereits gezeigt, dass du ein Eingabefeld an ein Attribut deiner Klasse binden kannst. Hier die passende Syntax für diese Übung:

```html
<input [(ngModel)]="eingabe" placeholder="was der Papgei sagen soll"> 
```

**WICHTIG:** Ein ganz elementarer Bestandteil einer jeden Übung (wenigstens, wenn sie dich weiterbringen soll) ist [das Reflektieren](http://clean-code-developer.de/die-grade/roter-grad/#Taeglich_reflektieren). Wenn du die Übung erledigt hast ziehe bitte eine Bilanz was die Übung dir bezüglich deiner Fähigkeiten gezeigt hat. So kannst du einfach für dich erkunden in welchen Bereichen du noch mehr Aufgaben machen solltest und welche Bereiche du schon gut beherrschst. Darüber hinaus bekommst du so für die nächsten Lektionen im Kurs eine Vorstellung auf was du besonders achten solltest. Du rufst also nicht nur Wissen ab, sondern kannst danach auch fokussierter lernen.

### Lösung

Hast du die Aufgabe umgesetzt, oder willst du nur ein wenig spicken? Mach es dir nicht zu einfach ;-). Du willst schließlich was lernen, oder?

Meine Lösung zu dieser Übung findest du auch wieder auf [Plunker](http://plnkr.co/edit/Y9qLMXmihoqwaUFR4H2p?p=preview). 

Ich habe hier das HTML-Template direkt in der `app.component.ts` beschrieben, damit du die Zusammenhänge etwas besser sehen kannst. Du solltest allerdings ruhig das HTML in die separate `app.component.html` schreiben. Das ist der Weg wie wir es zukünftig immer machen werden.

Viel Spaß beim Üben

Jan
