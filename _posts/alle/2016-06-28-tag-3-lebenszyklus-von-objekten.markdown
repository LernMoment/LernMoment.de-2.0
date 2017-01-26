---
layout: post
title: "Tag #3 - Objekte haben einen Lebenszyklus!"
excerpt: "Neben den Daten und dem Verhalten ist bei Objekten der Lebenszyklus wichtig!"
categories: alle
lernmoment: C#
lm-newsletter-group-id: 8
show-lm-newsletter-subscribe-box: false
share: true
tags: [C#, "TTT Challenge", GitHub]
image:
  feature: csharp-challenge.jpg
modified:
date: 2016-06-28T06:00:00+01:00
---

Bisher hat meine Lösung einen eher funktionalen Ansatz. D.h. ich lege keine Objekte der Klasse `Spielbrett` an und diese Klasse bietet auch nur Member und Methoden an, die `static` sind. Wenn du dir jedoch die Domäne anschaust, dann stellst du schnell fest, dass Objekte immer einen Lebenszyklus haben.

Bei TicTacToe hat zum Beispiel das Spielbrett einen kurzen Lebenszyklus. Wenn du und ich das Spiel auf einem Blatt Papier spielen, dann werden wir das Spielbrett nach dem Spiel vernichten. In dem ich dieses Verhalten aus der Domäne in meinen Quellcode überführe, mache ich das Design tatsächlich objektorientiert. Die Details erkläre ich dir in dem folgenden Video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/KEfM4b_ytr4" frameborder="0" allowfullscreen></iframe>


## Was heute passiert ist:

 - Die Tagesaufgaben für heute findest du [hier](https://github.com/LernMoment/ttt-challenge/issues/5)


Viel Spaß beim Spielen

Jan


PS: Wenn du noch nicht zur Challenge angemeldet bist, aber trotzdem teilnehmen möchtest und [die vielen Boni](/csharp-challenge/deine-vorteile-bei-anmeldung/) bekommen möchtest, dann melde dich schnell an! Unter anderem bekommst du **ein kostenloses Einzelcoaching** mit mir:

<div class="subscribe-notice">
  <h5>Hier unverbindlich und kostenlos anmelden:</h5>
    {% include lernmoment-subscribe.html %}
</div>
