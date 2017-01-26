---
layout: post
title: Was magst du in deinen Wrap? Ausnahmen?
date: 2015-09-17T06:00:00+02:00
excerpt: Wie du wichtige Informationen über InnerException bekommst.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Ausnahme]
image:
  feature: csharp-programmieren.jpg
---

Die Verwendung von *Ausnahmen* ist für dich nicht neu. Bestimmt hast du auch schon mal gesehen, dass es die Eigenschaft `Exception.InnerException` gibt. Im Englischen spricht man übrigens von *"wrapped Exception"*. Kannst du diese denn auch verwenden ohne in der Dokumentation nachzuschauen?

Um den Typ und die Beschreibung einer *Ausnahme* zu verändern, kannst du einen Konstruktor verwenden, der neben einer Beschreibung auch eine `InnerException` entgegennimmt. Das ist für dich auch Pflicht, weil ansonsten der komplette `StackTrace` verloren geht.

```cs
try
{
    using (StreamReader sr = new StreamReader("ConfigurationFile.xml"))
    {
        String line = sr.ReadToEnd();
    }
}
catch (IOException ex)
{
	// so verlierst du den ganzen StackTrace!
    // throw new MissingConfigurationException("ConfigurationFile.xml wurd nicht gefunden.");

    // Besser, weil du Zugriff auf alle bisherigen Informationen via InnerException hast.
    throw new MissingConfigurationException("ConfigurationFile.xml wurd nicht gefunden.", ex);
}
```

Über `InnerException` können viele *Ausnahmen* ineinander geschachtelt sein. Das kannst du dir vorstellen wie eine Kette. Um dir zu ersparen, dass du dich immer durch diese Kette hangeln musst, gibt es einige Methoden die dir helfen:

-	`ToString()` - Wenn du diese Methode auf einer *Ausnahme* aufrufst, werden nicht nur Details zu ihr ausgegeben, sondern auch von ihrer `InnerException`. Die Methode hangelt sich solange durch die Kette, bis die `InnerException` Eigenschaft einer *Ausnahme* `null` ist. Dabei gibt es für jedes Glied der Kette die relevanten Informationen aus.
-	`GetBaseException()` - Diese Methode gibt dir die *Ausnahme* mit der die ganze Kette gestartet hat. Damit kommst du also direkt zur Quelle.

Im Kontext einer Kette von *Ausnahmen* gibt es ein weiteres Verhalten, dass du wissen solltest. Dabei geht es um die Eigenschaft `StackTrace`. Die Eigenschaft `StackTrace` an einer *Ausnahme* zeigt immer nur die Methodenaufrufe an, bis zu ihrer eigenen `InnerException`. Wenn du den `StackTrace` von davor haben willst, musst du diese Eigenschaft an der `InnerException` auswerten. Die `ToString()` Methode übernimmt auch das bereits für dich.

Brauchst du noch mehr Funktionalität um Ketten von *Ausnahmen* zubearbeiten, musst du dies selber realisieren. Eine Möglichkeit dafür bieten dir *Erweiterungsmethoden* (siehe Links im Abschnitt "Weitere Informationen").

Jetzt erstmal viel Spaß mit dem Verschachteln von Ausnahmen

Jan


### Merke

-	Die Verwendung von spezifischen *Ausnahmen* kann deiner Anwendung oder Bibliothek Ausdrucksstärke verleihen.
-	Wenn du in einem `catch`-Block aus einer bestehenden *Ausnahme* eine neue erzeugst, "musst" du die bestehende *Ausnahme* der neuen als `InnerException` mitgeben.
-	Über die Eigenschaft `InnerException` können *Ausnahmen* mit einander verkettet werden.
-	`Exception.ToString()` gibt Informationen über die aktuelle *Ausnahme* und alle über `InnerException` verketteten aus.
-	Mit `Exception.GetBaseException()` kommst du an den Anfang einer Kette von *Ausnahmen*.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wann und wie setzt du `InnerException` ein?
-	Welche Ausnahmen berücksichtigt `ToString()`, wenn du es auf einer *Ausnahme* in der Mitte einer Kette von *Ausnahmen* aufrufst?
-	Wie kommst du an die erste *Ausnahme* in einer Kette von *Ausnahmen*?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Für diesen LernMoment gibt es keinen Quelltext.
-	[Hier](https://gist.github.com/KennyBu/8023552) ein Gist, welches eine Kette von *Ausnahmen* mit einer Erweiterungsmethode in ein `IEnumerable<string>` konvertiert.
-	Die MSDN-Beschreibung zu:
	-	[Exception.InnerException](https://msdn.microsoft.com/de-de/library/system.exception.innerexception(v=vs.110).aspx)
	-	[Exception.GetBaseException()](https://msdn.microsoft.com/de-de/library/system.exception.getbaseexception(v=vs.110).aspx) und den Quellcode wie die Methode implementiert ist bei [Microsoft Reference Source](http://referencesource.microsoft.com/mscorlib/R/afeecbe8989570cf.html)
	-	[Exception.ToString()](https://msdn.microsoft.com/de-de/library/system.exception.tostring(v=vs.110).aspx) und den Quellcode wie die Methode implementiert ist bei [Microsoft Reference Source](http://referencesource.microsoft.com/mscorlib/R/9ce1ff20e283169f.html)
