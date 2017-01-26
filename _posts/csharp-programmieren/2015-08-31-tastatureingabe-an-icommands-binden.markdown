---
layout: post
title: Unterstützt deine WPF-Anwendung Tastenkombinationen?
excerpt: KeyBinding - Die einfachste Möglichkeit Tastenkombinationen zu definieren.
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, WPF, MVVM]
image:
  feature: csharp-programmieren.jpg
modified:
date: 2015-08-31T06:00:00+02:00
---

Das du Benutzereingaben vom View zum ViewModel deiner WPF-Anwendung über `ICommand` schicken kannst, habe ich bereits im LernMoment [Command.CanExecute](/csharp-programmieren/command-canexecute/) beschrieben. Seit WPF 4.0 (veröffentlicht mit .NET 4.0) kannst du mit wenigen XAML-Anweisungen eine Taste an dein `Command` binden.

Die WPF Bedienelemente erben alle von `System.Windows.UIElement`. Diese Klasse bietet die für diesen Zweck relevante Eigenschaft `InputBindings`. Dabei handelt es sich um eine Auflistung von Instanzen der Klasse `InputBinding` bzw. Instanzen der von ihr abgeleiteten Klassen `KeyBinding` oder `MouseBinding`.

Wenn du beispielsweise ganz allgemein eine Tastenkombination (wie Ctrl+S) zum Speichern einer Datei oder ähnliches an deiner Anwendung definieren willst, dann kannst du das wie folgt machen:

```xml
<Window.InputBindings>
		<KeyBinding Gesture="Ctrl+S" Command="{Binding DateiSpeichernCommand}" />
</Window.InputBingings>
```

Nun kannst du einfach "Ctrl + S" drücken und das Speichernkommando wird ausgeführt. Dabei ist es egal welches Bedienelement gerade den Fokus hat. Damit dies funktioniert, muss dein ViewModel als `DataContext` zur Verfügung stehen und ein `ICommand` mit dem Namen `DateiSpeichernCommand` anbieten. Im zugehörigen [Beispiel](https://github.com/LernMoment/csharp/tree/master/CommandCanExecute) findest du alle Details.

Du kannst Tastenkombinationen auch an spezifische Bedienelemente binden. Dann wird das Kommando nur ausgeführt, wenn das Bedienelement den Fokus hat und du dann die Tastenkombination betätigst. Da alle Bedienelemente von `System.Windows.UIElement` erben, geht das genau so wie im vorherigen Beispiel:

```xml
<TextBox BorderBrush="Black" BorderThickness="2" Margin="50" TextWrapping="Wrap">
	Sobald diese TextBox den Fokus hat, kannst du mit der Tastenkombination "Ctrl + Shift + S" speichern.
	<TextBox.InputBindings>
		<KeyBinding Gesture="Ctrl+Shift+S" Command="{Binding DateiSpeichernCommand}"/>
	</TextBox.InputBindings>
</TextBox>
```

Möchtest du ein `KeyBinding` erstellen, welches nur eine Taste und nicht eine Tastenkombination umfasst, dann verwendest du die Eigenschaft `Key` anstelle von `Gesture`. So könntest du beispielsweise *F5* zum erneuten Laden des Inhalts deiner Anwendung verwenden:

```xml
<Window.InputBindings>
		<KeyBinding Key="F5" Command="{Binding NeuLadenCommand}" />
</Window.InputBingings>
```

Jetzt erstmal viel Spaß mit drücken von Tasten

Jan


PS: Beachten solltest du, dass das `KeyBinding` immer auf `KeyDown` reagiert. Dies kann über `KeyBinding` nicht geändert werden.

### Merke

-	Die meisten Bedien- und Anzeigeelemente in WPF haben die Eigenschaft `InputBindings`, welche von `System.Windows.UIElement` vererbt wird.
-	Der Eigenschaft `InputBindings` kannst du sowohl Instanzen von `KeyBinding` wie auch `MouseBinding` zuweisen.
-	Willst du einzelne Tasten verwenden, dann ist die Eigenschaft `KeyBinding.Key` das richtige für dich.
-	Eine Tastenkombination kannst du der Eigenschaft `KeyBinding.Gesture` übergeben. Dabei trennst du die einzelnen Tasten mit einem `+`.
-	Verwendest du `KeyBinding`, wird dein Kommando immer bei `KeyDown` und nicht bei `KeyUp` ausgeführt.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	An welchen Elementen kannst du ein `KeyBinding` verwenden?
-	Wie definierst du für eine Anwendung, dass das Kommando `HilfeCommand` beim drücken von *Shift* und *F1* ausgeführt wird?
-	Welche Klasse ist noch wichtig im Kontext von `KeyBinding`?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/CommandCanExecute).
-	Die Beschreibung der Klasse `KeyBinding` findest auf [MSDN](https://msdn.microsoft.com/de-de/library/system.windows.input.keybinding(v=vs.110).aspx)
