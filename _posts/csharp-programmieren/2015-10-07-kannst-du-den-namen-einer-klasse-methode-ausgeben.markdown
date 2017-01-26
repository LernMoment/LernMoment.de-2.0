---
layout: post
title: Kannst du den Namen einer Klasse, Methode, ... ausgeben?
date: 2015-10-07T06:00:00+02:00
excerpt: InspirationsMoment - nameof Operator
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Inspiration, C# 6.0, WPF]
image:
  feature: csharp-programmieren.jpg
---


Es gibt immer wieder die Notwendigkeit, dass du den Namen einer Klasse, einer Methode, einer Variablen, ... ausgibst. Insbesondere für das Schreiben von *Log-Einträgen* oder um einer *Exception* mehr Details zugeben. In C# 6.0 wurde dafür ein neuer Operator eingeführt. Dabei handelt es sich um den `nameof` Operator.

Ein weiteres Anwendungsszenario ergibt sich für *ViewModels* in WPF. Wie du im [Quelltext](https://github.com/LernMoment/csharp/blob/master/CommandCanExecute/CommandCanExecute/ViewModelBase.cs) zum LernMoment ["Command.CanExecute"](/csharp-programmieren/command-canexecute/) sehen kannst, ist eine Realisierungsmöglichkeit für `RaisePropertyChanged`, dass der Name der Eigenschaft die sich geändert hat als `string` übergeben wird. Obwohl diese Variante recht sicher ist, weil im `ViewModelBase` überprüft wird, ob die Klasse tatsächlich eine Eigenschaften mit dem Namen im `string` hat, bekommst du spätestens beim *Refactoring* Probleme.

Wenn du ein `ViewModelBase` wie [hier](https://github.com/LernMoment/csharp/blob/master/CommandCanExecute/CommandCanExecute/ViewModelBase.cs) verwendest, dann sehen die Eigenschaften in deinen *ViewModels* häufig so aus:

```cs
public int IntEigenschaft {
	set {
		if (intEigenschaft != value) {
			intEigenschaft = value;
			RaisePropertyChanged("IntEigenschaft");
		}
	}
}
```

Mit dem `nameof` Operator kannst du nun den Aufruf von `RaisePropertyChanged` verbessern: `RaisePropertyChanged(nameof(IntEigenschaft))`.

### Interessante Links 

-	Der [Referenzartikel auf MSDN](https://msdn.microsoft.com/de-de/library/dn986596.aspx) bietet sowohl eine Beschreibung wie auch einige Beispiele.
-	Für [Heise-Developer](http://www.heise.de/developer/artikel/nameof-Operator-in-C-6-0-2391981.html) hat der [Dotnet-Doktor](http://www.heise.de/developer/developer_redakteur_403109.html) einen Artikel zu diesem Thema geschrieben.

Viel Spaß beim Ausgeben der Namen deiner Klassen, Eigenschaften, Methoden, ...

Jan


PS: Hast du Fragen zu diesem InspirationsMoment, oder anderen Themen auf LernMoment.de? Dann schicke mir eine [E-Mail](mailto:jan@lernmoment.de)
