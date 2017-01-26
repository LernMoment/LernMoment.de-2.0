---
layout: post
title: "Settings - (benutzerspezifische) Konfigurationseinstellungen"
excerpt: "Wie du anwendungs- oder benutzerspezifische Konfigurationen speichern und laden kannst."
categories: csharp-tutorial-deutsch
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [Anwendungseinstellungen, C#, Video, Tutorial]
image:
  feature: csharp-tutorial-feature.jpg
modified:
date: 2016-12-12T07:00:00+01:00
---

> Schau dir auch die weiteren Folgen des [C# Tutorial Deutsch](/csharp-tutorial-deutsch/) an.

Es gibt einige Fälle in denen es hilfreich ist Konfigurationseinstellungen für deine Anwendung zu speichern. Typische Szenarien sind beispielsweise:

 - Der zuletzt verwendete Dateipfad (benutzerspezifisch)
 - Zuletzt verwendete Position und Größe des Fensters deiner Anwendung (benutzerspezifisch)
 - Verbindungsdaten zum Zugriff auf einen Server (anwendungs- und/oder benutzerspezifisch)

In .NET nennt Microsoft diese Funktionalität *Anwendungseinstellungen* oder *Application Settings* auf Englisch.

Da solche Szenarien in vielen Anwendung benötigt werden hat Microsoft vorgesorgt und stellt einen *"Designer"* und die Klasse `Properties.Settings` bereit. In diesem Artikel/Video zeige ich dir, wie du für eine Konsolenanwendung (bei WinForms- und WPF-Anwendungen geht es genauso) zur Entwurfszeit eine entsprechende Datei erstellst, deine Konfigurationsparameter definierst und Werte der Konfiguration zur Laufzeit lesen und ändern kannst.

**ACHTUNG:** Die so angelegte Datei mit den Konfigurationseinstellungen liegt unverschlüsselt auf der Festplatte deines Anwenders. Wenn du also sicherheitsrelevante Daten wie Passwörter in der Datei speichern möchtest, solltest du unbedingt die Datei verschlüsseln! 

Alles weitere erfährst du hier im Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/2HDA11673pU" frameborder="0" allowfullscreen></iframe>

<div class="subscribe-notice">
<h5>Du willst selber einen YouTube Client oder eine andere Anwendung entwickeln?</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" >></a>
</div>

**FRAGEN?** Du hast noch Fragen zum Thema Konfigurationseinstellungen? Dann stelle sie mir direkt unter diesem Video in den Kommentaren oder schicke sie mir [per Mail](mailto:jan@lernmoment,de). Ich würde mich freuen, wenn ich diesen Artikel noch für dich erweitern kann.

### Konfiguration per Databinding in WPF

Wenn du schon etwas weiter bist und deine ersten WPF-Anwendungen schreibst, dann kannst du die Werte aus `Properties.Settings.Default` auch direkt an Oberflächenelemente via *Databinding* binden. Möchtest du beispielsweise den Konfigurationsparameter `ApiKey` an eine `TextBox` binden, dann könntest du die `Text`-Eigenschaft wie folgt binden: `Text="{Binding Source={x:Static properties:Settings.Default}, Path=ApiKey, Mode=TwoWay}"`.

Wenn du dieses `Binding` ausprobierst, solltest du den Namensraum `properties` beachten. In *XAML* kannst du diesen so einbinden: `xmlns:properties="clr-namespace:MyYouTubeTestClient.Properties"`. Dabei ist `MyYouTubeTestClient` der Name deines Visual Studio Projekts.

Ein weiterer wichtiger Punkt ist, dass du `Properties.Settings.Default` spätestens vor dem Verlassen der Anwendung noch speichern musst. Das könntest du beispielsweise in einem *EventHandler* am `Window.Closing` Event machen. 

### Weitere Links

 - Den Quellcode zum *"Simple YouTube Client"* (inkl. Verwendung von `Settings`) findest du [hier auf GitHub](https://github.com/LernMoment/simple-youtube-client/)
 - Die allgemeine Einführung in das Thema findest in diesem [MSDN Artikel](https://msdn.microsoft.com/de-de/library/a65txexh.aspx).
 - Antworten auf die häufigst gestellten Fragen zu diesem Thema (nur in Englisch) gibt es [in diesem Artikel](https://blogs.msdn.microsoft.com/rprabhu/2005/06/29/client-settings-faq/)
 - In dieser Folge des Tutorials habe ich einen einfachen YouTube Client entwickelt. Die Dokumentation der [YouTube Data API Client Library for .NET](https://developers.google.com/api-client-library/dotnet/apis/youtube/v3) hilft dir (ein wenig) bei den ersten Schritten.
 - Die *YouTube Data API* als [NuGet-Paket](https://www.nuget.org/packages/Google.Apis.YouTube.v3/).

Viel Erfolg beim Konfigurieren deiner Anwendung

Jan
