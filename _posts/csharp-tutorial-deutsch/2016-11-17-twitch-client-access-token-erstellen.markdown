---
layout: post
title: "Twitch Client Teil #4 - Access Token erstellen"
excerpt: "Für das Schreiben von Daten auf dem Twitch-Server wird ein AccessToken benötigt."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Twitch, C#, Video]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-11-17T06:00:00+01:00
---

> Die weiteren Teile dieser Mini-Serie findest du hier:
> Teil #1 - [Einleitung  und Authentifizierung](/csharp-tutorial-deutsch/twitch-client-einleitung/)
> Teil #2 - [Architektur eines Twitch Client](/csharp-tutorial-deutsch/twitch-client-architektur/)
> Teil #3 - [Lesen per TwitchAPI](/csharp-tutorial-deutsch/twitch-client-daten-lesen-per-api/)
> Teil #5 - [Schreiben per TwitchAPI - Follow Channel Client](/csharp-tutorial-deutsch/twitch-client-daten-schreiben-per-api/)

**ACHTUNG:** Der von dir erzeugte *AccessToken* **muss** "geheim" bleiben. Wenn jemand anders deinen *AccessToken* (bzw. den deines Anwenders) kennt, könnte er Daten in dem Konto manipulieren!

Links zu den im Video genannten Seiten und Ressourcen findest du am Ende dieses Artikels.

Den *AccessToken* benötigst du immer dann, wenn du Daten auf dem Twitch-Server verändern willst. Das Erstellen dieses *AccessToken* ist etwas kompiliziert (zumindestens empfinde ich das so) und daher habe ich dir eine Schritt-für-Schritt-Anleitung erstellt. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/vUi7Gyo9DzE" frameborder="0" allowfullscreen></iframe>

Die grundlegende Idee ist, dass jeder Benutzer einer Anwendung (welche bei Twitch über die Client-ID identifiziert wird) Zugriffsrecht einräumen muss. D.h. du verwendest in deinem Twitch-Client deine *Client-ID* und identifizierst damit deine Anwendung gegenüber dem Twitch-Server. 

Möchte nun ein Benutzer deine Anwendung verwenden, dann muss er explizit erlauben, dass deine Anwendung die Informationen in seinen Einstellungen verändern darf. Dafür wird über die im Video vorgestellte Methode ein *AccessToken* erstellt. Dieser *AccessToken* muss vom Benutzer selber erstellt werden! Möchtest du deinen Twitch-Client an andere Leute verteilen, dann musst du einen Weg finden, der es dem Benutzer erlaubt einen *AccessToken* zu generieren. Im nächsten Schritt muss der Benutzer dann diesen *AccessToken* in deine Anwendung bekommen.

Die URL die in diesem Video erstellt wurde, kannst du deinem Benutzer zur Verfügung stellen. Damit kann er dann einfach seinen eigenen *AccessToken* bekommen. Um diesen *AccessToken* in deinem Programm zu verwenden, könntest du zum Beispiel beim Programmstart den Benutzer bitten diesen einzugeben. 

Wenn du einen Twitch-Client mit grafischer Benutzeroberfläche erstellst, gibt es natürlich noch wesentlich mehr Möglichkeiten. Darin könntest du die *AccessToken*-Erstellung direkt integrieren und dann den erzeugten *AccessToken* in deiner Anwendung direkt verwenden. Solltest du für den Benutzer den *AccessToken* in einer Konfigurationsdatei speichern, hat es **höchste Priorität**, dass du die Datei oder den *AccessToken* darin gut veschlüsselst. Denke daran, dass es um die Sicherheit der Daten deiner Benutzer geht!

### Die "Scopes"

Wie bereits gesagt kannst du dir einen *Scope* als eine Art Zugriffsrecht vorstellen. Bei der Erstellung des *AccessToken* gibst du also an, welche Zugriffsrechte auf das Benutzerkonto des Anwenders, deine Anwendung benötigt. Wenn der Anwender sich einen *AccessToken* erstellt, wird ihm auf der Twitch-Seite genau gesagt welche Zugriffsrechte er einer Anwendung gewährt. Du solltest also wirklich nur den *Scope* verwenden, der für deine Anwendung auch tatsächlich benötigt wird.

Hier nochmals die (zum Zeitpunkt der Erstellung dieses Artikels) aktuellen Scopes:

 - `user_read:` lesender Zugriff auf nicht-öffentliche Daten des Benutzers wie beispielsweise E-Mail Adresse.
 - `user_blocks_edit:` erlaubt Anwendung im Namen des Benutzers andere (Benutzer, ???) zu ignorieren bzw. nicht mehr zu ignorieren. 
 - `user_blocks_read:` lesender Zugriff auf die Liste der vom Benutzer ignorierten Benutzer.
 - `user_follows_edit:` erlaubt der Anwendung die vom Benutzer gefolgten Kanäle zu ändern.
 - `channel_read:` lesender Zugriff auf nicht-öffentliche Daten des Kanals (inkl. E-Mail Adresse und Stream-Key).
 - `channel_editor:` erlaubt der Anwendung die Metadaten des Kanals (game, status, usw.) zu ändern.
 - `channel_commercial:` erlaubt der Anwendung Werbeanzeigen auf dem Kanal zu veröffentlichen.
 - `channel_stream:` erlaubt der Anwendung den stream key des Kanals zurück zusetzen.
 - `channel_subscriptions:` lesender Zugriff auf alle Abonnenten des Kanals.
 - `user_subscriptions:` lesender Zugriff auf alle Abonnenten des Benutzers.
 - `channel_check_subscription:` lesender Zugriff zur Überprüfung ob ein angegebener Benutzer den Kanal abonniert hat.
 - `chat_login:` erlaubt der Anwendung sich in den Chat einzuloggen und darin Nachrichten zu senden.
 - `channel_feed_read:` lesender Zugriff auf den "Feed" des Kanals.
 - `channel_feed_edit:` erlaubt der Anwendung Artikel und Reaktionen im "Feed" des Kanals zu veröffentlichen.

Die [Twitch Developer Webseite](https://dev.twitch.tv/docs/authentication/) zeigt dir die aktuellsten Definitionen der *Scopes* an und sollte als gültige Referenz angesehen werden. Ich übernehme keine Garantie für die Richtigkeit der Übersetzung. Wenn ich sie auch nach bestem Wissen gemacht habe ;-).

*Hinweis:* Benötigt deine Anwendung mehrere *Scopes*, dann kannst du sie "addieren". Also zum Beispiel: `user_read+channel_stream`. 

### Weitere Links

 - Details zur Authentifizierung findest du [hier](https://dev.twitch.tv/docs/authentication/)
 - [Das GitHub Projekt](https://github.com/LernMoment/csharp-twitch-client) beinhaltet den kompletten Quellcode von mir zu diesem Client (inkl. weiterer Beispiele die ich nicht im Video gezeigt habe).
 - Weitere Infos zu `async` und `await` gibt es im Artikel [Einführung in Async / Await](/csharp-programmieren/einfuehrung-in-async-und-await/)  
 - Auf [Twitch Developers](https://dev.twitch.tv/docs) findest du viele Informationen über Daten die der Twitch-Server zurück liefert. Darunter auch beispielsweise eine genau Beschreibung der [Benutzerdaten](https://dev.twitch.tv/docs/api/v3/users/). Diese Beschreibung sind häufig etwas umfangreicher als die Dokumentation der *TwitchLib*. Allerdings geht es dort immer um *HTTP* und nicht *C#*. 

Viel Erfolg beim Erstellen deines Clients

Jan
