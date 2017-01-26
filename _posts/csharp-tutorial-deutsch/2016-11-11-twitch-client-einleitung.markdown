---
layout: post
title: "Twitch Client Teil #1 - Einleitung und Authentication"
excerpt: "Lerne warum dir die Entwicklung des Clients beim Lernen hilft."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Twitch, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-11T00:01:00+01:00
---

> Die weiteren Teile dieser Mini-Serie findest du hier:
> Teil #2 - [Architektur eines Twitch Client](/csharp-tutorial-deutsch/twitch-client-architektur/)
> Teil #3 - [Lesen per TwitchAPI](/csharp-tutorial-deutsch/twitch-client-daten-lesen-per-api/)
> Teil #4 - [AccessToken erstellen](/csharp-tutorial-deutsch/twitch-client-access-token-erstellen/)
> Teil #5 - [Schreiben per TwitchAPI - Follow Channel Client](/csharp-tutorial-deutsch/twitch-client-daten-schreiben-per-api/)

Im Rahmen des [C# Tutorials Deutsch](https://www.youtube.com/playlist?list=PLP2TrPpx5VNkr-wmkjguVZAvN4T5EPJbF) gibt es eine neue Mini-Serie in der ich dir zeige wie du mit C# einen [Twitch](http://www.twitch.tv)-Client erstellen kannst. Dabei liegt der Fokus nicht so sehr darauf eine fertige Anwendung zu erstellen. Vielmehr möchte ich dir die Grundlagen zeigen, so dass du selber die für dich wichtige Anwendung erstellen kannst.

Wenn dir Twitch bisher noch nichts sagt, dann erfährst du in diesem Video natürlich auch was das ist und warum es für viele Gamer so spannend ist. Wenn dich Twitch nicht interessiert, dann kannst du den vorgestellten Ansatz einfach auf ähnliche Plattformen wie beispielsweise [YouTube](https://www.youtube.de) anwenden.

<iframe width="560" height="315" src="https://www.youtube.com/embed/uDDTIuk476k" frameborder="0" allowfullscreen></iframe>

<div class="subscribe-notice">
<h5>Lerne alles über C# und professionelle Softwareentwicklung</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

### Authentifizierung bei Twitch

Um einfache Daten vom Twitch-Server abzurufen benötigst du eine *Client-Id*. Diese kannst du in den Einstellungen deines Kontos erstellen lassen. Anders als weitere Maßnahmen zur Authentifizierung ist die *Client-Id* nicht geheim. Sie wird vom Twitch-Server lediglich benötigt um "unbefugte" Zugriffe zu identifizieren.

Um eine *Client-Id* zu erstellen gehst du in:

> Einstellungen -> Verbindungen -> Andere Verbindungen -> Registriere deine App

Sofern du bei Twitch mit deinem Konto eingeloggt bist, kannst du direkt [diesen Link](https://www.twitch.tv/settings/connections) benutzen.

Im Bereich *"Register your Application"* solltest du für `Redirect URI` den Wert *http://dummy* einsetzen. 

### Weitere Links

Folgende Links werden im Video nicht explizit genannt, jedoch sind sie in diesem Kontext für dich von Interesse:

 - Bei [TwitchTools](https://www.twitchtools.com) findest du Inspiration was du mit einem Twitch-Client machen kannst.
 - Wenn du bereits existierende Clients ansehen möchtest, findest du einige [in diesem Artikel](http://liftgaming.com/2015/05/the-best-bots-tools-and-services-for-twitch-streaming/).
 - Details zur Authentifizierung findest du [hier](https://dev.twitch.tv/docs/authentication/)
 - Wenn du dich mehr mit der Entwicklung für Twitch beschäftigen willst, solltest du dich definitiv auf [Twitch Developers](https://dev.twitch.tv/docs/authentication/) umsehen.  

Viel Erfolg bei der Vorbereitung der ClientId

Jan
