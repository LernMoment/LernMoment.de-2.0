---
layout: post
title: Wartungsfreundliches INotifyPropertyChanged
excerpt: Verwendest du immer noch strings in OnPropertyChanged?
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, WPF, MVVM]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-13T06:00:00+02:00
---

Egal ob WPF mit oder ohne MVVM, Windows Forms oder einfach nur zwischen zwei Klassen, Datenbindung in C# ist cool! Seit C# 5.0, also .NET 4.5, ist es noch cooler. Bis dahin, war die Implementierung von `INotifyPropertyChanged` entweder problematisch in der Wartung, oder langsam. Dann hat das Entwicklungsteam in Redmond ein Einsehen gehabt und hat das `[CallerMemberName]` Attribut eingeführt.

Um deine Klasse mit Datenbindung verwenden zu können, musst du das Interface `INotifyPropertyChanged` implementieren. Das ist eigentlich ganz einfach, weil dieses Interface lediglich ein Event beinhaltet. Blöd ist nur, dass die zu übergebenden `PropertyChangedEventArgs` den Namen der geänderten Eigenschaft beinhalten müssen.

Daher blieb dir bisher nichts anderes übrig, als Eigenschaften die für die Datenbindung relevant sind, so oder ähnlich zu realisieren:

```cs
public string TolleEigenschaft
{
	get { return _tolleEigenschaft; }
	set
	{
		if ( _tolleEigenschaft != value )
		{
			_tolleEigenschaft = value;
			OnPropertyChanged("TolleEigenschaft");
		}
	}
}
```

Das ist alles kein Hexenwerk, aber es hat seine Herausforderungen. Was ist, wenn du den Namen der Eigenschaft änderst? Solange du den String in `OnPropertyChanged` auch änderst ist alles gut. Wenn nicht funktioniert deine Datenbindung nicht und du weißt nicht warum. Im Quelltext zum LernMoment [Command.CanExecute](/csharp-programmieren/command-canexecute/) habe ich eine Basisklasse verwendet, die diesem Problem ein wenig vorbeugt, aber schön ist das immer noch nicht. Es gibt eine Alternative mit Lambda-Ausdruck, aber damit wird deine Oberfläche insbesondere bei vielen Aufrufen merklich langsamer.

Das `[CallerMemberName]` Attribut aus dem Namensraum `System.Runtime.CompilerServices` kommt dir zur Hilfe. Du kannst es vor einen Parameter in einer Methode platzieren. Die einzige Bedingung ist, dass du für den Parameter einen Standardwert definierst.

Dieses Attribut macht nichts weiter, als dem Compiler zu sagen, dass er den Namen des Aufrufers als Wert für den Parameter einsetzen soll. Somit ist es auch egal ob eine Methode mit diesem Attribut von einem Event, einer Eigenschaft oder einer Methode aufgerufen wird. Dieses kann der Compiler ohne Probleme auflösen und den passenden Namen einsetzen.

Eine entsprechend angepasste `OnPropertyChanged` Methode und würde also so aussehen:

```cs
private void OnPropertyChanged([CallerMemberName] String caller = null)
{
    var handler = PropertyChanged;
    if (handler != null)
    {
        handler(this, new PropertyChangedEventArgs(caller));
    }
}
```

Wenn deine Klasse, oder vielleicht besser eine Basisklasse `INotifyPropertyChanged` und die `OnPropertyChanged` Methode von oben implementiert, dann brauchst du aus den Eigenschaften, die an der Datenbindung teilnehmen, einfach nur `OnPropertyChanged()` aufrufen.

Jetzt erstmal viel Spaß mit dem ändern von Daten ohne String

Jan


### Merke

-	Die Verwendung von Strings in `OnPropertyChanged` macht insbesondere Probleme bei der Umbenennung von Eigenschaften.
-	Bei häufigem Aufruf kann die Realisierung von `INotifyPropertyChanged` mit Lambda-Ausdrücken zu schlechterer Performance führen.
-	Das Attribut `[CallerMemberName]` ist im Namensraum `System.Runtime.CompilerServices` definiert.
-	Wenn du das Attribut verwendest, wird der Compiler den passenden Namen für dich einsetzen.
-	Das Attribut wird vor einen Parameter in einer Methode geschrieben. Dieser Parameter muss einen Standardwert haben.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie sieht die Implementierung einer Eigenschaft aus, wenn sie an der Datenbindung teilnehmen soll und deine `OnPropertyChanged` Methode das `[CallerMemberName]` Attribut verwendet?
-	An welcher Stelle musst du das `[CallerMemberName]` Attribut platzieren?
-	Wird das Attribut zur Laufzeit ausgewertet?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Heute kein Beispiel.
-	Eine Beschreibung der neuen Attribute gibt es bei [MSDN](https://msdn.microsoft.com/de-de/library/hh534540.aspx).
-	Ein "How To" bezüglich der Implementierung von `INotifyPropertyChanged` im Kontext von Windows Forms gibt es auch bei [MSDN](https://msdn.microsoft.com/de-de/library/ms229614(v=vs.110).aspx)
