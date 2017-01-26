---
layout: post
title: "Twitch Client Teil #2 - Architektur"
excerpt: "Verstehe was TwitchAPI, TwitchChat und TwitchPubSub sind und wie du sie von C# nutzen kannst."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Twitch, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-13T00:30:00+01:00
---

> Die weiteren Teile dieser Mini-Serie findest du hier:
> Teil #1 - [Einleitung  und Authentifizierung](/csharp-tutorial-deutsch/twitch-client-einleitung/)
> Teil #3 - [Lesen per TwitchAPI](/csharp-tutorial-deutsch/twitch-client-daten-lesen-per-api/)
> Teil #4 - [AccessToken erstellen](/csharp-tutorial-deutsch/twitch-client-access-token-erstellen/)
> Teil #5 - [Schreiben per TwitchAPI - Follow Channel Client](/csharp-tutorial-deutsch/twitch-client-daten-schreiben-per-api/)

Grundsätzlich ist eine Kommunikation mit den Twitch-Servern nur über das Internet möglich. Damit du trotzdem einen Client in C# entwickeln kannst, gibt es Bibliotheken wie die [TwitchLib]() die die Interaktion via *REST API, IRC* und *Websockets* in C# Klassen verpacken. Wie das alles zusammenhängt und funktioniert, erkläre ich dir in diesem Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/N0OPTdTGgTI" frameborder="0" allowfullscreen></iframe>

Hier nochmals der Überblick wofür du die verschiedenen Protokolle die dir über die *TwitchLib* angeboten werden benutzen kannst:

![TwitchAPI, TwitchChat und TwitchPubSub]({{ site.url }}/images/TwitchClientArchitektur.003.jpeg)

Hier noch ein paar konkretere Beispiele welche Art von Clients du mit den jeweiligen Technologien entwickeln kannst:

 - **TwitchAPI** - Alleine mit dem Auslesen von Daten über die TwitchAPI kannst du beispielsweise statistische Auswertungen wie bei den [Twitchtools](https://www.twitchtools.com/stats?type=channel&method=followers) machen. Darüberhinaus hast du mit dem schreibenden Zugriff aber auch die Möglichkeit Werkzeuge zu entwickeln die einen Broadcaster beim Verwalten seiner *Streams* und *Videos* unterstützen. Ein Beispiel dafür ist die [Overwolf Twitch Streaming Application](https://help.twitch.tv/customer/en/portal/articles/1540995-overwolf-twitch-streaming-application).
 - **TwitchChat** - Ein großteil der Anwendungen die im Netz zu finden sind bieten Funktionalitäten um den Chat zu verwalten. Dabei bieten Bots wie beispielsweise [moobot](http://twitch.moobot.tv) die Möglichkeit Spam-Posts auszufiltern, Umfragen zu starten, Giveaways einfach einzubinden oder auch die Teilnehmer einen Song auswählen zulassen. In eine ganz andere Richtung gehen Kanäle wie [BattleOfTheCrowds](https://www.twitch.tv/battleofthecrowds) bei denen es möglich ist mittels des Chats an einem Spiel teilzunehmen. Dazu wird ebenfalls TwitchChat verwendet. Einen ersten Eindruck wie das geht kannst du [hier bekommen](https://en.wikipedia.org/wiki/Twitch_Plays_Pokémon).
 - **Twitch PubSub** - Konkrete Beispiele in der das Twitch PubSub System verwendet wird habe ich nicht gefunden. Theoretisch kann ich die Anwendungsfälle von der [offiziellen Dokumentation](https://dev.twitch.tv/docs/PubSub/overview/) nachvollziehen. Jedoch bin ich gespannt ob du mir konkrete Projekte zeigen kannst in der das PubSub verwendet wird. 

<div class="subscribe-notice">
<h5>Lerne alles über C# und professionelle Softwareentwicklung</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

### Weitere Links

 - Eine detaillierte Erklärung was das *Twitch PubSub System (TPS)* ist, findest du [hier](https://dev.twitch.tv/docs/PubSub/overview/)
 - Der Quellcode der TwitchLib ist [hier bei GitHub verfügbar](https://github.com/swiftyspiffy/TwitchLib). Eine erste Beschreibung ist dort ebenfalls vorhanden. 
 - Teile der Doku für TwitchLib sind bereits fertig und [hier](http://swiftyspiffy.com/TwitchLib/) verfügbar.
 - Wenn du die TwitchLib einfach in deinem Visual Studio Projekt nutzen möchtest, kannst du dir die Binaries von [NuGet holen](https://www.nuget.org/packages/TwitchLib)
 - Eine wirklich gute Einführung in die Arbeit des Entwicklungsteam bei Twitch gibt dieser [Blog-Post](https://blog.twitch.tv/twitch-engineering-an-introduction-and-overview-a23917b71a25#.9gjc5jfay)

Viel Erfolg bei der Analyse der Architektur

Jan
