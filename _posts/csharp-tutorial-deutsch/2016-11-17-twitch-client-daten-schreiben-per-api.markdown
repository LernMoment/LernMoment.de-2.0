---
layout: post
title: "Twitch Client Teil #5 - Daten per TwitchAPI auf dem Server schreiben"
excerpt: "Du lernst wie du einen Client erstellst der für einen Benutzer angibt, dass er einem Kanal folgt."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Twitch, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-17T07:00:00+01:00
---

> Die weiteren Teile dieser Mini-Serie findest du hier:
> Teil #1 - [Einleitung und Authentifizierung](/csharp-tutorial-deutsch/twitch-client-einleitung/)
> Teil #2 - [Architektur eines Twitch Client](/csharp-tutorial-deutsch/twitch-client-architektur/)
> Teil #3 - [Lesen per TwitchAPI](/csharp-tutorial-deutsch/twitch-client-daten-lesen-per-api/)
> Teil #4 - [AccessToken erstellen](/csharp-tutorial-deutsch/twitch-client-access-token-erstellen/)

Links zu den im Video genannten Seiten und Ressourcen findest du am Ende dieses Artikels.

In diesem Video zeige ich dir wie du mithilfe des *AccessToken* aus deinem Twitch-Client Daten im Benutzerkonto deines Anwenders veränderst. Dabei verwende ich in diesem konkreten Beispiel die Methoden `TwitchAPI.FollowChannel`, `TwitchAPI.UnfollowChannel` und `TwitchAPI.GetFollowedUsers`.

Wenn du verstanden hast wie du mit den hier vorgestellten Methoden umgehst, dann kannst du auch genauso alle anderen `TwitchAPI` Methoden zum manipulieren von Daten verwenden. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/QQvqKV9XtSg" frameborder="0" allowfullscreen></iframe>

Den Twitch-Client mit Menü um einzustellen das der angemeldete Benutzer einem Kanal folgt oder nicht mehr folgt wird im Video nicht komplett entwickelt. Du erfährst alles notwendige um selber eine entsprechende Anwendung zu entwickeln. Wenn du den fertigen Twitch-Client sehen möchtest, dann kannst du in diesem [GitHub-Projekt](https://github.com/LernMoment/csharp-twitch-client) den Quellcode anschauen.

<div class="subscribe-notice">
<h5>Du kennst static nicht, oder weißt nicht wie du Methoden definierst?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

### Weitere Links

 - [Das GitHub Projekt](https://github.com/LernMoment/csharp-twitch-client) beinhaltet den kompletten Quellcode von mir zu diesem Client (inkl. weiterer Beispiele die ich nicht im Video gezeigt habe).
 - Weitere Infos zu `async` und `await` gibt es im Artikel [Einführung in Async / Await](/csharp-programmieren/einfuehrung-in-async-und-await/)  
 - Auf [Twitch Developers](https://dev.twitch.tv/docs) findest du viele Informationen über Daten die der Twitch-Server zurück liefert. Darunter auch beispielsweise eine genau Beschreibung der [Benutzerdaten](https://dev.twitch.tv/docs/api/v3/users/). Diese Beschreibung sind häufig etwas umfangreicher als die Dokumentation der *TwitchLib*. Allerdings geht es dort immer um *HTTP* und nicht *C#*. 

Viel Erfolg beim Erstellen deines Clients

Jan
