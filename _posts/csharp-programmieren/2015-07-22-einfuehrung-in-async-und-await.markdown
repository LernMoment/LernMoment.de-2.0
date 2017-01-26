---
layout: post
title: "Einführung in Async / Await"
modified: 2016-03-10T20:00:00+02:00
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
excerpt: "wie du einfach asynchron Daten liest"
tags: [Async, File]
image:
  feature: csharp-programmieren.jpg
date: 2015-07-22T09:25:00+00:00
---

Seit mittlerweile 3 Jahren gibt es .NET 4.5. In dieser Version wurden die Schlüsselwörter `async / await` eingeführt. Sie sollen eine sehr einfache Methode zur asynchronen Programmierung bereitstellen.

Auch die Klasse `StreamReader` wurde erweitert um dieses neue Konzept zu unterstützen. Insgesamt wurden 4 zusätzliche Async-Methoden hinzugefügt. Die Methode `ReadLineAsync` will ich dir heute in einem Beispiel vorstellen:

```cs
class Program {
  static void Main() {
    Task webTask = GetWebContentAsync();

    while(!webTask.IsCompleted)
    {
      Console.Write(";o ");
      Thread.Sleep(100);
    }

    Console.WriteLine("FERTIG!");
  }

  static async Task GetWebContentAsync()
  {
    WebClient myClient = new WebClient();
    Stream response = await myClient.OpenReadTaskAsync("http://www.contoso.com/index.htm");
  
    using (var reader = new StreamReader(response))
    {
      string line;
      while((line = await reader.ReadLineAsync()) != null)
      {
        Console.WriteLine();
        Console.WriteLine(line);
      }

      reader.Close();
    }

    response.Close();
  }
}
```

Wie du siehst, habe ich hier eine einfache Abfrage einer Webseite gemacht. Das wirklich Spannende passiert dabei im Kopf der `while` Schleife in der Methode `GetWebContentAsync`. Dort siehst du den Aufruf der `ReadLineAsync` Methode mit einem vorangestelltem `await`.

Genau an dieser Stelle passiert einiges an Magie bzw. der Compiler macht einiges was du bisher machen musstest. Durch das `await` wird die Methode `GetWebContentAsync` unterbrochen, bis `ReadLineAsync` den String von der Webseite geholt hat. Das heißt im Detail:

1.	Der Aufrufer von `GetWebContentAsync`, also `Main`, wird weiter ausgeführt.
2.	Der Aufrufer wird wieder unterbrochen, wenn `ReadLineAsync` mit einem Resultat zurück ist.

Wenn du nach dem Aufruf von `ReadLineAsync` noch etwas machen willst, bevor `await` aufgerufen wird und somit die asynchrone Methode unterbrochen wird, geht das auch:

```cs
using (var reader = new StreamReader(response))
{
  Task<string> readingTask = reader.ReadLineAsync();

  Console.WriteLine("Warte nun auf den StreamReader!");
  string line = await readingTask;
  Console.WriteLine();
  Console.WriteLine(line);

  reader.Close();
}
```

Wichtig ist allerdings, dass du ein `await` aufrufst oder auf eine andere Art auf die asynchrone Methode wartest. Ansonsten können alle möglichen komischen Dinge passieren. Würdest du zum Beispiel das Hauptprogramm verkürzen, dann wird die asynchrone Methode kein Resultat mehr liefern können, weil das Programm bereits beendet ist:

```cs
static void Main() {
  GetWebContentAsync();

  Console.WriteLine("FERTIG!");
}
```

Zusätzlich wird automatisch ein `Task` Objekt zur Verfügung gestellt. So ist es einfach möglich, die Ausführung der asynchronen Methode zu beobachten. Dies benutze ich in der `Main` Methode um einen Fortschritt anzuzeigen.

Es gibt sicherlich noch das ein oder andere zu beachten, aber `async / await` machen das asynchrone programmieren wirklich einfach. Trotzdem solltest du wissen was du tust!

Jetzt erstmal viel Spaß beim Warten

Jan

### Merke

-	`StreamReader` bietet verschiedene Async-Methoden an, um asynchron Daten aus dem Stream zu lesen.
-	Ein `await` vor dem Aufruf von `ReadLineAsync` macht das Task-Handling und sorgt dafür, dass ein String oder NULL zurückgegeben wird.
-	Du kannst auch das `Task<string>` Objekt von `ReadLineAsync` verwenden, um beispielsweise andere Befehle auszuführen, bevor du `await` aufrufst.
-	Definierst du eine Methode mit dem `async` Schlüsselwort im Methodenkopf, muss im Methodenrumpf wenigstens einmal `await` verwendet werden.

### Lernquiz 

Verwende folgende Fragen um das Gelernte von heute zu festigen:

-	Welches Schlüsselwort verwendest du in Kombination mit `ReadLineAsync` um die Wartezeit nicht zu vertrödeln?
-	Was passiert durch die Verwendung von `await`?
-	Was muss innerhalb einer Methode aufgerufen werden, die `async` im Funktionskopf hat?

Am besten du schaust dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quellcode zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/AsyncAwaitEinfuehrung).
