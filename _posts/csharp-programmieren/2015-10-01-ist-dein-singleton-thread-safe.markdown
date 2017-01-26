---
layout: post
title: Ist dein Singleton thread-safe?
date: 2015-10-01T06:00:00+02:00
excerpt: Zwei Varianten wie du ein Singleton implementieren kannst. Und eine die du besser nicht verwendest.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Pattern, Async]
image:
  feature: csharp-programmieren.jpg
---

In C# gibt es einige Möglichkeiten ein *Singleton* zu implementieren. Die Hauptunterschiede dieser Varianten liegen darin ob sie *thread-safe* sind und wie einfach sie zu verstehen sind. Unabhängig davon welche Realisierungsvariante du verwendest, solltest du folgende Punkte berücksichtigen:

1.	Es gibt nur einen Konstruktor. Dieser hat keine Parameter und ist `private`. So können nicht mehrere Instanzen angelegt werden und du bekommst auch keine Probleme damit, dass von deiner Klasse abgeleitet wird.
2.	Wenn eine *Singleton*-Klasse abgeleitet wird, ist es nicht mehr eindeutig, dass es nur eine Instanz deiner *Singleton*-Klasse gibt. Daher solltest du sie immer `sealed` deklarieren. Außerdem kann der Compiler dadurch auch nochmals optimieren.
3.	Ein weiterer Aspekt bei einem *Singleton* ist die verzögerte Erstellung. Die Instanz des *Singleton* wird also erst dann angelegt, wenn das erste Mal darauf zugegriffen wird. Das ist insbesondere dann interessant, wenn das Anlegen der Instanz länger dauert.

Ein wichtiger Aspekt, denn du bei der Verwendung von *Singleton* berücksichtigen solltest, ist, dass es häufig Probleme bei *Unittests* macht. Dadurch, dass es nur eine Instanze gibt und dass von einem *Singleton* nicht abgeleitet werden kann, ist es für Tests schwer, einen *Mock* für dieses Objekt zu erstellen.

Im Folgenden nun einige Beispiele wie du ein *Singleton* realisieren kannst und wie du es besser nicht machst. Es gibt noch weitere Möglichkeiten, aber die hier vorgestellten sind die, die am einfachsten zu verstehen sind und die Punkte von vorher erfüllen.

#### Die "schlechte" Realisierungsvariante

Eine der Varianten die häufig verwendet wird um ein *Singleton* zu implementieren, sieht so aus:

```cs
public sealed class Singleton
{
    private static Singleton instance=null;

    private Singleton()
    {
    }

    public static Singleton Instance
    {
        get
        {
            if (instance == null)
            {
                instance = new Singleton();
            }
            return instance;
        }
    }
}
```

Für eine Anwendung in der es keine Probleme mit dem Zugriff aus mehreren *Threads* gibt, ist diese Variante anwendbar. Um dich aber nicht unnötigen Risiken auszusetzen, solltest du diese Variante **nicht** anwenden. Insbesondere die Abfrage `if (instance == null)` könnte gleichzeitig von mehreren *Threads* ausgewertet werden, somit `true` ergeben und infolgedessen könnten mehrere Instanzen erstellt werden.

#### Einfache "thread-safe" Variante

Wie immer, wenn es um die Synchronisation von *Threads* geht, kannst du `lock` verwenden. Dies ist aus Sicht der Performance nicht immer optimal, aber es ist einfach zu verstehen. Willst du das folgende *Singleton* beispielsweise in einer Schleife verwenden, die in jeder Iteration auf die *Instanz* zugreift, solltest du bei diesem Ansatz die *Instanz* in einer lokalen Variable halten. Somit greifst du nicht immer auf das `lock`zu.

```cs
public sealed class Singleton
{
    private static Singleton instance = null;
    private static readonly object singletonLock = new object();

    Singleton()
    {
    }

    public static Singleton Instance
    {
        get
        {
            lock (singletonLock)
            {
                if (instance == null)
                {
                    instance = new Singleton();
                }
                return instance;
            }
        }
    }
}
```

Da diese Variante einfach zu verstehen und *thread-safe* ist, verwende ich sie in den meisten Fällen. Auswirkungen auf die *Performance* gibt es nur dann, wenn du häufig auf `Instance` zugreifst.

#### Die Variante für .NET 4.0

Seit .NET 4.0 gibt es den Datentyp `Lazy<T>`. Du findest ihn im Namensraum `System`. Er wird verwendet, um ein Objekt vom angegebenen Datentyp erst dann zu erstellen, wenn auf die Eigenschaft `Lazy<T>.Value` zugegriffen wird. Hier das Beispiel

```cs
public sealed class Singleton
{
    private static readonly Lazy<Singleton> lazy =
        new Lazy<Singleton>(() => new Singleton());
    
    public static Singleton Instance { get { return lazy.Value; } }

    private Singleton()
    {
    }
}
```

Alle öffentlichen *Member* von `Lazy<T>` sind *thread-safe*. Somit gibt es beim Zugriff aus mehreren *Threads* keine Probleme.

Jetzt erstmal viel Spaß mit dem "Es kann nur einen geben" Prinzip

Jan

PS: Danke an Jon Skeet für die Grundlagenforschung zu diesem Thema. Seinen detaillierten Artikel findest du auf [C# in Depth](http://csharpindepth.com/Articles/General/Singleton.aspx).

### Merke

-	Eine *Singleton*-Klasse sollte `sealed` sein und einen parameterlosen Konstruktor haben, der `private` ist.
-	Üblicherweise wird die einzige Instanz deines *Singleton* erst dann angelegt, wenn das erste Mal drauf zugegriffen wird.
-	Die einfachste Realisierungsvariante ist nicht *thread-safe* und sollte **nicht** verwendet werden.
-	Die Verwendung von *Singleton* führt bei *Unittests* häufig zu Problemen, weil ein *Singleton* nicht *"gemockt"* werden kann.
-	Es gibt verschiedene Realisierungsvarianten. Dabei solltest du immer darauf achten, dass dein *Singleton* einfach zu verstehen ist.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie kannst du ein *Singleton* implementieren, welches *thread-safe* ist?
-	Welchen Typ gibt es in .NET 4.0 der dir bei der Realisierung helfen kann?
-	Warum wird ein *Singleton* mit `sealed` implementiert?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Eine Diskussion (in Englisch) über den Sinn und Unsinn von Vererbung bei *Singletons* findest du bei [bytes.com](http://bytes.com/topic/c-sharp/answers/432029-inheritance-singleton-class).
-	Eine Beschreibung der Probleme mit *Singleton* beim Testen findest du auf [just-about.net](http://www.just-about.net/boese-singletons).
