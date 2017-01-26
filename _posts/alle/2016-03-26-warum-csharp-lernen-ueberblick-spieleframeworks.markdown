---
layout: post
title: Warum C# Lernen? Möglichkeit 1 - Spieleentwicklung mit Spieleframeworks
excerpt: Tobias Vetter stellt dir Unity, XNA und MonoGame vor
categories: alle
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: false
share: true
tags: [C#, Spieleentwicklung, Frameworks]
image:
  feature: intro-code.jpg
modified:
date: 2016-03-26T14:21:07+01:00
---

Gerade wenn du anfängst mit Softwareentwicklung wirst du dir die Frage stellen, was kann ich nun mit meinem neuen Wissen anfangen. Eine Möglichkeit ist die Entwicklung von Spielen. Ich selber habe nicht viel Erfahrung mit der Spieleentwicklung in C#. Für mich standen bisher eher technischen Anwendungen im Vordergrund.

Allerdings hat <a href="https://blog-vetter.rhcloud.com/" target="_blank">Tobias Vetter</a>, einer meiner Absolventen des Online-Kurses ["Einstieg in C#"](https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110), ein klares Ziel vor Augen. Er will nicht nur C# lernen, sondern sich auch mit dem Thema Spieleentwicklung beschäftigen.

Dazu stellt er dir im folgenden Gastartikel 3 der großen Spieleframeworks für C# vor. Solch eine Analyse von bestehenden Frameworks oder auch Bibliotheken ist ein wichtiger Schritt in der professionellen Softwareentwicklung und wird in jedem Entwicklungsprojekt während des Grobdesigns ausgeführt. Dabei geht es häufig um die sogenannte "Make or Buy"-Entscheidung. Es wird also analysiert ob die ganze zu entwickelnde Lösung oder Teile davon gekauft werden können, oder ob alles neu entwickelt werden muss. Nun aber zu Tobias und seinen Ergebnissen.

## C#-Frameworks in der Spieleprogrammierung
Gastartikel von <a href="https://blog-vetter.rhcloud.com/" target="_blank">Tobias Vetter; M.A.</a>

In der Regel ist C++ die Programmiersprache an die gedacht wird, wenn es um Spieleprogrammierung geht. Tatsächlich hat jedoch mit C# ein anderes Mitglied der C-Sprachfamilie in den letzten Jahren deutlich an Bedeutung gewonnen. Dies lässt sich nicht nur dadurch erklären, dass C# in vielerlei Hinsicht zugänglicher und moderner ist als C++. Denn dies würde ebenso auf das in der Wirtschaft sehr erfolgreiche Java zutreffen wie auf das im Bildungssektor weit verbreitete Python. Beide spielen aber bei der Entwicklung von Spielen nur eine marginale Rolle. Eine mögliche Erklärung ist natürlich die Nähe zu C++. Deutlich Erklärungsstärker ist aber das Vorhandensein von vielen starken Frameworks für die Entwicklung von Spielen, welche C# verwenden.

![Official Unity Logo]({{ site.url }}/images/unity-logo.jpg)
{: .pull-right}

Zuerst zu nennen ist hier <a href="http://unity3d.com/" target="_blank">Unity</a> von der gleichnamigen Firma. Dieses stellt sowohl eine eigene Entwicklungsumgebung als auch Laufzeit (engine) für Spiele dar. Es ist sowohl teilweise in C# geschrieben wie es C# (neben einer eigenen Skriptsprache, welche Java Script sehr ähnlich ist) auch in der Entwicklung verwendet. Unity hat inzwischen einiges an Beachtung bei Entwicklern wie auch Spielern erlangt. Die Grundversion von Unity ist kostenlos, was viele Hobbyisten und Einsteiger anzieht. Doch werden auch Großproduktionen (wenn auch kein AAA) in Unity realisiert. So sind unter Anderem Titel wie Might & Magic X, Wasteland 2, Cities: Skylines, Kerbal Space Program, Pillars of Eternity, Sunless Sea, Fallout Shelter und Firewatch mit Unity entstanden. Wer sich etwas in der Branche auskennt, hat sicher von *mindestens* einem dieser Titel bereits etwas gehört. Es handelt sich hier also ganz gewiss nicht um ein „Spielzeug“ für Hobbyisten.

![Official Microsoft XNA Logo from en.wikipedia.org]({{ site.url }}/images/Microsoft_XNA_logo.jpg)
{: .pull-right}

Ebenso zu nennen ist das einst von Microsoft selbst bereitgestellte XNA. Dieses vereint diverse für die Entwicklung von Spielen bedeutsame Schnittstellen und war mit jeder Version von Visual Studio zusammen verwendbar. Mit XNA sind bekannte Titel wie Bastion, Magicka, Terraria, Dust: An Elysian Tail, Fez sowie Stardew Valley entstanden. Auch hier liegt also eine professionelle Schnittstelle vor, die Microsoft mit dem XNA Game Studio auch um ein mächtiges Tool erweiterte. Leider aktualisierte man das Projekt seit 2010 nicht mehr und gab dann 2013 bekannt, dass das Projekt nicht mehr weiterentwickelt wird. Damit kann auf die technischen Neuerungen der letzten sechs Jahre nur noch bedingt zugegriffen werden, was diese Plattform nur noch für kleinere Produktionen interessant macht. Das hindert Stardew Valley aber trotzdem nicht daran gerade die Charts auf der bekannten digitalen Spielevertriebsplattform Steam zu stürmen.

![Official MonoGame Logo from github.com/MonoGame]({{ site.url }}/images/MonoGame.jpg)
{: .pull-right}

Allerdings machte es sich das freie Projekt <a href="http://www.monogame.net/" target="_blank">MonoGame</a> nicht nur zur Aufgabe eine kostenfreie und auf mehreren Plattformen verfügbare Version von XNA zu erstellen, sondern das Projekt nach dem Ende der Entwicklung durch Microsoft weiterzupflegen. Tatsächlich wurden die oben bereits genannten Titel Fez und Bastion wohl an sich in MonoGame realisiert. Nach dem Ende von XNA wurden Titel wie TowerFall, Transistor und Axiom Verge weiterhin mit MonoGame realisiert. Man kann also wohl mit Recht sagen, dass XNA in MonoGame weiterlebt.

Andererseits hat Microsoft die Entwickler für ihre aktuellen Spieleplattformen (XBOX One und Windows 10 für Desktop, RT und Mobile) nicht im Stich gelassen. Man setzt jedoch nun auf die UWP (Universal Windows Platform) in Verbindung mit Direct X 11 & 12 als neues Paradigma (<a href="https://dev.windows.com/de-de/games/develop" target="_blank">siehe Microsoft Game Developer</a>). Auch hier kommt – neben C++, XAML und HTML – C# zum Einsatz. Interessanterweise bewirbt Microsoft aber auch Unity (und eingeschränkter auch <a href="http://www.cocos2dxna.com/" target="_blank">Cocos</a>) als Umgebung.

Anschließend sei noch erwähnt, dass alle hier vorgestellten Schnittstellen und Tools eine, wenn auch unterschiedlich geartete, Form der Integration in die neuste Version von Visual Studio sowie der Unterstützung verschiedener Plattformen anbieten. Dies ist ein ziemlich gutes Zeichen für Entwickler, da es bedeutet, dass verschiedene Werkzeuge besser ineinander integriert werden können und der gleiche Code – oder zumindest große Teile davon – für verschiedene Plattformen verwendet werden kann.

In dieser Hinsicht sei zum Schluss noch auf die <a href="https://xamarin.com/platform" target="_blank">Xamarin-Plattform</a> (also jene Firma, welche mit [Mono](http://www.mono-project.com/) auch die quellenoffene und plattformübergreifende Implementation von C# bereitstellt) hingewiesen, welche es erlaubt C#-Anwendungen auf OS X, iOS und Android zu portieren und somit gerade für die Entwicklung von Mobile-Games in C# unabdingbar ist.

Vielen Dank an Tobias für diesen Gastartikel und dir viel Spaß beim Überlegen wozu du C# nutzen möchtest

Jan

PS: Wenn du eine noch detailliertere Einführung in diese und weitere Spieleframeworks (auch in den Sprachen C++ und JavaScript) möchtest, kann ich dir <a href="https://channel9.msdn.com/Shows/gamedev/1" target="_blank">dieses Video auf Channel9</a> empfehlen. Es ist allerdings nur in Englisch verfügbar.

<div class="subscribe-notice">
<h5>Heute deine erste C#-Anwendung und morgen dein erstes Spiel?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>
