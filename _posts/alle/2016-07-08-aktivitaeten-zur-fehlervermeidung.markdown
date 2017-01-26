---
layout: post
title: "Spare Zeit mit diesen 3 Taktiken zur Fehlervermeidung."
excerpt: "Lerne Fehler zu vermeiden. Denn Fehlersuche sind unverhältnismäßig teuer."
categories: alle
lernmoment: Hintergrund
lm-newsletter-group-id: 2
show-lm-newsletter-subscribe-box: true
share: true
tags: [Professionalität, Inspiration, clean code]
image:
  feature: intro-code.jpg
modified:
date: 2016-07-08T06:00:00+01:00
---

> According to recent Cambridge University research, the global cost of debugging software has risen to $312 billion annually. The research found that, on average, software developers spend 50% of their programming time finding and fixing bugs. - [prweb](http://www.prweb.com/releases/2013/1/prweb10298185.htm)

Auch wenn die exakten Zahlen für mich unbedeutend (und fraglich) sind, ist die Tendenz überaus erstaunlich. Nach dieser Studie verwendet jeder Entwickler 50% seiner Zeit auf das Suchen und Beheben von Fehlern. Selbst wenn es tatsächlich nur 35-40% sind, könnte ich mir doch einiges vorstellen womit ich lieber meine Zeit verbringen würde.

Nun bin ich der Ansicht, dass Fehler zum Lernen und zum Leben dazugehören. Wichtig ist mir, dass ich aus meinen Fehlern lerne und diese nur möglichst selten wiederhole. Dazu möchte ich dir 3 Taktiken vorstellen, mit denen du Fehler während der Implementierung vermeiden kannst.

Bevor ich in die Details gehe, sollte dir jedoch bewußt sein, dass insbesondere Fehler in den Phasen vor der Implementierung, also Anforderungen und Design, eine wesentlich dramatischere Auswirkung haben. Je länger ein Fehler in einer Software bleibt, desto teurer wird er.

Jetzt aber zu den Taktiken

### Taktik #1 - Schreibe verständlichen Quellcode

Schreibe lesbaren und nachvollziehbaren Quellcode. Du kommst in einigen Monaten wieder an deinem Quellcode vorbei und erinnerst dich nicht mehr daran was du dir initial bei den Entscheidungen gedacht hast. Es ist also wichtig, dass du die wichtigsten Informationen aus dem Quellcode EINFACH ableiten kannst.

Was genau bedeutet das denn nun? Hier einige Beispiele

 - Verwende Bibliotheken die du selber und deine Kollegen verstehen. Die Versuchung ist groß, dass du tolle neue Bibliotheken verwendest die dir potentiell viel Arbeit abnehmen können. Aber hast du sie auch verstanden oder bist du eher so im Stadium "mal sehen wie das gehen könnte"? Du solltest auch überlegen wer als nächstes mit deinem Quellcode arbeiten muss. Mir ist es schon häufiger passiert, dass ich Quellcode ändern musst, welcher eine Bibliothek verwendet die ich nicht kannte. Es ist dann so, dass ich lange brauche um mich in das Thema einzuarbeiten und ich habe "Angst" eine Änderung zu machen, weil ich mir nicht sicher bin. [Hier](https://github.com/supermew10/TicTacToe/issues/3#issue-162238292) habe ich beschrieben wie du die Verwendung einer Komplexen Bibliothek oder Funktionalität entschärfen kannst.
 - Verwende Namen die deine Ideen und die Domäne reflektieren. Nicht solche die besonders kurz sind. Wenn ich einen mir neuen Quellcode anschaue, dann will ich nicht alle Details verstehen. Ich lese den Quellcode immer von oben (also auf einem hohen Abstraktionsniveau wie z.B. der `Main` Methode). Dann ist es hilfreich, wenn ich dem Namen einer Methode, Eigenschaft, ... entnehmen kann was sie macht. So kann ich mich entscheiden ob der Bereich für meine aktuelle Tätigkeit gerade relevant ist. Kann ich aus dem Namen nicht ableiten was passiert, dann muss ich den Bereich im Quellcode auf jeden Fall anschauen.

Bevor ich hier noch viele Seiten mehr schreibe, fasse ich es zusammen und sage: "Schreibe einfach sauberen Quellcode". Zu dem Thema "Clean Code" habe ich bereits [in diesem Artikel](/hintergrund/clean-code-developer-an-welchem-grad-arbeitest-du-gerade/) ein paar Gedanken aufgeschrieben.

### Taktik #2 - Sei defensiv!

Das Ziel defensiver Programmierung ist, dass deine Anwendung auch unter nicht vorhergesehenen Bedingung noch funktioniert. D.h. du solltest feststellen, wenn eine Anfrage (z.B. ein Methodenaufruf) keinen Sinn macht und dann die Anfrage gar nicht erst bearbeiten. 

Die Alternative dazu ist, dass du eine ungültige Anfrage durch deinen Quellcode laufen lässt und dann an einer Stelle ein Fehler auftritt. Damit ist allerdings die Chance groß, dass der eigentliche Fehler (eine ungültige Anfrage) erstmal nicht erkannt wird. Vielmehr suchst du nun an einer Stelle die mit dem ursprünglichen Fehler nichts zutun hat.

Nehmen wir am besten ein Beispiel um das zu verdeutlichen:

```cs
public void Berechne()
{
    if (AktuellerFehler != Fehler.Keiner)
    {
        return;
    }

    // eigentliche Logik folgt hier
```

Die Methode `Berechne()` gehört zur Klasse `RechnerModel` und kann von anderen Klassen aufgerufen werden. Sie wird in einem mehrstufigen Verfahren verwendet. D.h. ersten werden einige Eigenschaften am `RechnerModel` mit Werten befüllt und dann wird die eigentliche Berechnung ausgeführt.

Es kann allerdings sein, dass die Werte bereits nicht in den zulässigen Wertebereich passen. Dann kann eine Berechnung zwar ausgeführt werden, allerdings gibt es eine Wahrscheinlichkeit, dass das Resultat entweder falsch ist, oder sogar zu einem Abbruch führt.

Durch die Abfrage der `AktuellerFehler` Eigenschaft zu Beginn der Methode wird nun sichergestellt, dass die Berechnung gar nicht erst ausgeführt wird. Hier gilt zu beachten, dass der Aufruf über die nicht erfolgte Berechnung informiert werden sollte. In diesem Fall ist die Eigenschaft `AktuellerFehler` öffentlich und kann vom Aufruf abgefragt werden. Eine weitere in den meisten Fällen sinnvollere Variante ist in der Abfrage eine *Exception* zu werfen.

Ein Nachteil defensiver Programmierung sollte dir bewußt sein. Häufig kommt es durch ihre Anwendung zu schlechter lesbarem Quellcode. Wenn du Methoden hast, die 2 oder gar 3 Parameter haben und alle diese Parameter müssen auf verschiedene Werte geprüft werden, dann entsteht erstmal viel Quellcode bevor du überhaupt die eigentliche Logik schreiben kannst. Somit kann die Verwendung von Taktik #2 der Taktik #1 direkt entgegenwirken.

Daher ist es wichtig, dass du nicht immer blind jeden Parameter einer Methode überprüfst. Beispielsweise kannst du an vielen privaten Methoden die Überprüfung weglassen, weil die verwendeten Werte bereits überprüft wurden. Außerdem sollten deine öffentlichen Methoden sowieso keine 3 Parameter haben, wenn du *Clean Code* befolgst.

Das komplette Beispiel findest du auf [GitHub](https://github.com/LernMoment/einstieg-csharp-taschenrechner).

### Taktik #3 - Benutze Datentypen die dir Typsicherheit geben

In eine Variable vom Datentyp `int` oder `stringr kannst du fast beliebige Werte stecken. Verwendest du sie für eine Variable die nur eine begrenzte Anzahl an zulässigen Werten hat, dann wird entweder dein Quellcode schlechter lesbar (weil defensive Programmierung), oder fehleranfälliger. Als Alternative kannst du eigene Klassen erstellen oder wenigstens Datentypen wie enum oder bool verwenden.

Beispielsweise durch die Verwendung eines `Enums` definierst du genau den zulässigen Wertebereich. Weißt du nun einen anderen Wert einer Variablen vom Typ deines `Enums` zu, dann wird dir erstmal der Compiler eine Fehlermeldung ausgeben. Diese kannst du zwar auch umgehen, aber dann bist du selber schuld ;-).

Es gibt noch einige weitere Taktiken und auch vielmehr Details zu den vorgestellten Taktiken. Wichtig ist jedoch erstmal das dir das Probleme grundsätzlich klar ist und das du anfängst geeignete Maßnahmen auszuprobieren. Wenn du Fragen hast zu diesem oder anderen Themen, dann hinterlasse mir einen Kommentar an diesem Artikel, oder [schreibe mir eine Mail](mailto:jan@lernmoment.de).


Viel Spaß beim Vermeiden der nächsten Fehler

Jan

