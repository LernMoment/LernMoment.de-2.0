---
layout: post
title: "Zeitersparnis - einer von vielen Gründen für NuGet"
excerpt: Auf NuGet.org gibt es fast 55.000 Pakete mit grandioser Funktionalität. Nutze Sie!
categories: alle
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [C#, Werkzeug, NuGet]
image:
  feature: intro-code.jpg
modified:
date: 2016-04-21T13:00:00+01:00
---

Immer wieder sehe ich, dass (angehende) Entwickler sich das Leben unnötig schwer machen. Das du einiges an Funktionalität nicht selber entwickeln musst ist dir klar, oder? Weisst du auch warum du externe Software-Pakete von *NuGet* verwenden solltest? Genau das erkläre ich dir in diesem Artikel bzw. diesem Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/WsvhwW2M7AY" frameborder="0"></iframe>

Das .NET Framework bietet dir bereits enorm viel Funktionalität, die du einfach in deinen Projekten verwenden kannst. Allerdings ist das nicht die einzige Quelle für tolle Bibliotheken, Erweiterungen und mehr. Wenn du ein paar Blogs und Entwicklernachrichten liest, wirst du auf das ein oder andere Projekt aufmerksam werden. So sind beispielsweise <a href="http://www.nunit.org" target="_blank">NUnit</a> oder auch <a href="http://nlog-project.org" target="_blank">NLog</a> durchaus bekannt.

Was aber passiert, wenn du diese Pakete von der Webseite lädst und in dein Projekt integrierst? Damit verwendest du eine ganz spezifische Version und diese Version ist nicht mal dokumentiert (ausser in deiner Commit-Message, oder? ;). Und wenn du nun deinen Entwicklungsrechner wechselst, oder mit jemandem zusammen arbeitest? Du musst die exakt gleiche Version auf jedem Rechner wieder installieren.

Genau an diesem Punkt setzt <a href="http://www.nuget.org" target="_blank">NuGet</a> an. Dieser Paketmanager und das dazugehörige Verzeichnis von Paketen (Bibliotheken, Werkzeuge, Erweiterungen, ...) kannst du verwenden um das Installieren, Aktualisieren, Konfigurieren und Entfernen von Software-Paketen zu automatisieren.

NuGet bietet dir somit folgende Vorteile:

- Zeitersparnis
- Sicherheit
- einfache Zusammenarbeit

Was bedeutet das aber im Detail?

### Zeitersparnis - Hinzufügen anstatt selber entwickeln

Gerade als Anfänger wirst du immer wieder dazu verleitet sein Funktionalität selber zu entwickeln. Das liegt daran, dass du einige Aspekt der professionellen Softwareentwicklung nicht kennst, oder ignorierst. Der entscheidende Aspekt in diesem Kontext ist **make versus buy**.

Also die Entscheidung eine Funktionalität selber zu entwickeln (make) oder sie von extern hinzuzufügen (buy). Dabei bedeutet *buy* nicht immer, dass du für die Funktionalität Geld bezahlen musst. Allerdings wird es dich immer Zeit kosten!

Wo ist nun aber die Zeitersparnis? Dazu schauen wir uns mal ein einfaches Beispiel an - das Logging. Diese Standardfunktionalität brauchst du eigentlich in jeder Anwendung die du entwickelst. Häufig fängst du (genau wie ich) sicherlich erstmal damit an und machst ein paar Ausgaben auf die Konsole (`Console.WriteLine(...)`). Dann brauchst du allerdings mehr. Du möchtest häufig verschiedene Schweregrade angeben, oder die Ausgaben in einer Datei haben und nicht auf der Konsole. Nun fängt es an kompliziert zu werden.

Die Entwicklung eines Loggers mit der wichtigsten Funktionalität kann schnell mal einige Wochen dauern. Willst du umfangreiche Funktionalität wie beispielsweise in <a href="http://www.gurock.com/smartinspect/" target="_blank">SmartInspect</a>, dann brauchst du sicherlich eher Jahre dafür. Das alles ist Zeit, in der du **keinen Nutzen für deinen Kunden erschaffst**.

Verwendest du hingegen einen fertigen Logger (z.B. einen der vielen aus der <a href="https://www.nuget.org/packages?q=logging" target="_blank">NuGet-Gallery</a>), brauchst du zwar einige Stunden bis Tage um dich damit vertraut zu machen, aber du bist immer noch wesentlich schneller. Außerdem verwendest du dann (hoffentlich ;) eine Lösung, die schon viele andere auch einsetzen und von jedmandem entwickelt wurde, der sich in dem Gebiet sicherlich besser auskennt als du.

### Sicherheit - Immer die richtige oder aktuellste Version

Nun gibt es natürlich Alternativen zu NuGet. Eine Möglichkeit, die dir bekannt sein sollte ist das Einfügen von Referenzen. Du findest also auf einer Webseite eine tolle Bibliothek (z.B. das Testframework <a href="http://www.nunit.org" target="_blank">NUnit</a>), lädst dir diese auf deinen Rechner und referenzierst sie aus deinem Projekt.

Das geht alles recht schnell, aber dann beginnen die Herausforderungen erst:

- Wie erfährst du, dass es ein Problem / Fehler in der Bibliothek gibt?
- Wie erfährst du, welche Version der Bibliothek du verwendest?
- Wie kommst du an eine ältere Version der Bibliothek, wenn deine einmal weg ist?
- Wo legst du Binaries der Bibliothek ab?
- Wie bekommst du eine neue Version der Bibliothek?

Das alles sind keine riesigen Probleme, aber es kostet dich Zeit. Viel schlimmer noch, du handelst dir schnell Fehler ein die einfach durch eine falsche Version entstehen. Gerade erst kürzlich hatte ich das Problem beim Coaching, das mein Trainee eine ältere Version einer Bibliothek auf seinem Rechner hatte und deshalb das Projekt nicht übersetzt werden konnte. Als erfahrener Softwareentwickler fällt dir das schneller auf, aber auch so zweifelst du häufig erstmal ob der Fehler nicht in deinem Quellcode liegt. Du wirst also unsicher.

Durch die Integration von NuGet in Visual Studio hast du immer die Information: 

- welche Version eines Software-Pakets du verwendest, 
- was die aktuellste Version ist,
- welche anderen Abhängigkeiten ein Software-Paket zu anderen Paketen hat,
- ...

Das Aktualisieren eines Pakets ist mit NuGet innerhalb weniger Klicks erledigt. Es ist sogar möglich, dass du immer die aktuellste Version eines Pakets verwendest, aber das birgt dann wieder ganz andere Herausforderungen.

### Zusammenarbeit - Sicherheit im Team

Ein weiterer Kernpunkt ist die Verwendung von Bibliotheken in der Softwareentwicklung im Team. Wenn du beispielsweise ein Projekt von <a href="https://www.github.com" target="_blank">GitHub</a> verwendest (egal ob du es klonst oder forkst), wird es passieren, dass darin externe Software-Pakete verwendet werden.

Wenn du *NuGet* verwendest bzw. wenn das Projekt es verwendet, brauchst du lediglich das Projekt mit Visual Studio auf deinem Rechner übersetzen und es werden automatisch alle passenden Versionen der verwendeten Pakete auf deinen Rechner geholt und verwendet. Du brauchst also weder passende Pakete von Hand zu installieren, noch bekommst du Probleme mit bereits installierten anderen Versionen dieser Pakete.

Noch viel spannender wird es, wenn du deine eigenen *NuGet-Pakete* erstellst. Wenn du also ein Projekt welches du entwickelst als *NuGet-Paket* bereitstellst. Dieses können dann deine Teammitglieder verwenden während du beispielsweise an einer neuen Version arbeitest.

### Zusammenfassung: Du solltest NuGet kennen und verwenden

Ich denke mittlerweile ist dir klar, dass ich überzeugt bin von *NuGet* und vorallem auch warum ich überzeugt bin. Für professionelle Softwareentwicklung ist es einfach unabdingbar, dass 

- Standardfunktionalitäten nicht selber entwickelt werden,
- es keine Probleme mit verschiedenen Versionen gibt, und
- das ganze Team jederzeit ohne manuelle Intervention die Projekte (auch auf neuen Rechnern) übersetzen kann.

## Übung - Jetzt bist du dran

Damit dieser Artikel bzw. das Video nicht nur ein passives Vergnügen für dich ist, habe ich noch eine kleine praktische Übung.

Suche in der <a href="http://www.nuget.org" target="_blank">NuGet-Gallery</a> ein Paket, welches du in deinem aktuellen oder zukünftigen Projekt benutzen wirst. Am besten du machst es sofort, nicht das du es noch vergisst ;-). 
Es wäre genial, wenn du [mir](mailto:jan@lernmoment.de) und den anderen Lesern dein Ergebnis als Kommentar zu diesem Artikel oder gerne auch als Tweet [@LernMoment](https://twitter.com/LernMoment) mitteilst.

Viel Spaß bei der Verwendung von *NuGet*

Jan
