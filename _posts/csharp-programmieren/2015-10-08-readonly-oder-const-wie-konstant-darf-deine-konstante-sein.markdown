---
layout: post
title: readonly oder const? Wie konstant darf deine Konstante sein?
date: 2015-10-08T06:00:00+02:00
excerpt: Ein readonly Attribut ist nicht unbedingt unveränderlich!
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Initialisierung, Datentypen]
image:
  feature: csharp-programmieren.jpg
---

Gerade erst im LernMoment ["Ist dein Singleton thread-safe?"](/csharp-programmieren/ist-dein-singleton-thread-safe/) hast du das Schlüsselwort `readonly` verwendet. Was aber kann denn dadurch nur gelesen werden? Und welche Unterschiede gibt es zu `const` und Eigenschaften mit nur `get`?

Das `readonly` Schlüsselwort kann nur auf Attribute angewendet werden. Dabei ist es allerdings egal, ob du diese `static` definierst oder nicht. Die Aussage von `readonly` ist, dass dem Attribut kein neuer Wert zugewiesen werden kann außer im Konstruktor der Klasse oder dem *Object Initializer* des Attributs.

#### Ein readonly Attribut ist nicht unbedingt unveränderlich

Wichtig ist hier, dass sich `readonly` auf das Attribut und nicht seinen Inhalt bezieht. So kannst du zum Beispiel folgendes ohne Probleme ausführen:

```cs
class LernMoment
{
	public string Name { get; set; }
}

class LernMomentUebung
{
	private readonly LernMoment derMoment = new LernMoment(){ Name = "Singleton"};

	static void Main()
	{
		derMoment.Name = "Readonly";
	}
}
```

Mit `readonly` wird also nicht das Objekt hinter einem Attribut unveränderlich, sondern lediglich die Referenz darauf. Für Werttypen gilt dies allerdings nicht. Die sind unveränderlich ohne wenn und aber.

#### Wie konstant soll deine Konstante sein?

Mit `readonly` kannst du also eine Konstante definieren die zur Laufzeit initialisiert wird. Dies ist ein großer Unterschied zu Konstanten, die mit `const` definiert werden. Jedes Attribut und jede Variable die `const` definiert ist, muss bereits zur Zeit der Kompilierung einen festen Wert bekommen. Somit kannst du zwar einen Referenztyp als `const` definieren, aber nur, wenn du ihm `null` oder einen `string` zuweist.

Ein weiterer Unterschied ist, dass der Compiler den Name deiner `const`-Konstanten durch ihren Wert ersetzt. Verwendest du also solch eine Konstante in der öffentlichen Schnittstelle deiner Klasse, wird ihr **Wert** direkt in alle Aufrufer eingefügt. Solltest du später diesen Wert ändern wollen, dann musst du alle abhängigen Klassen (Assemblies, ...) erneut übersetzten. Dann ist allerdings auch fraglich, ob es sich tatsächlich um eine Konstante handelt. Übrigens, wenn du `const` verwendest, kannst du dies nicht mit `static` kombinieren. `const` ist nach C# Sprachdefinition implizit `static`.

Neben `readonly` und `const` kannst du auch eine Eigenschaft verwenden, die lediglich ein `get` hat und einen festen Wert zurück gibt. Gerade für die öffentliche Schnittstelle einer Klasse ist diese Variante häufig die beste, weil du damit später die Implementierung dieser Eigenschaft noch ändern kannst. So kannst du beispielsweise später entscheiden, dass der Wert bzw. das Objekt der Eigenschaft aus einer Konfigurationsdatei gelesen werden soll.

Jetzt erstmal viel Spaß mit dem Realisieren deiner Konstanten

Jan

### Merke

-	Hast du eine Konstante, die sich auch in Zukunft nicht ändern wird, dann ist `const` ein guter Kandidat. Beispiel: `privat const float pi = 3.14f` (`Math.PI` wäre wahrscheinlich die bessere Alternative!)
-	Wenn du zur Laufzeit entscheiden willst, wie eine Konstante initialisiert wird, oder wenn du vermeiden willst, dass einem Attribut ein neues Objekt zugewiesen wird, dann schaue dir `readonly` genauer an. Beispiel: `private static readonly object singletonLock = new object();`
-	Verwendest du eine Konstante in der öffentlichen Schnittstelle deiner Klasse, dann solltest du über eine Eigenschaft nachdenken. Davon kannst du später die Realisierung anpassen, ohne das die Aufrufer davon beeinträchtigt sind.
-	Ein `readonly` Attribut kannst du sowohl über einen *Object-Initializer* wie auch den *Konstruktor* initialisieren.
-	Verwendest du einen Referenztypen in der Definition eines `readonly` Attributs, ist das referenzierte Objekt veränderlich! Du kannst lediglich dem Attribut kein neues Objekt zuweisen.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wie definierst du eine Konstante für die Fallbeschleunigung auf der Erde (9,81 m/s2)?
-	Was musst du bei der Verwendung von `readonly` mit Referenztypen beachten?
-	Warum solltest du in einigen Situationen eine Eigenschaft mit nur `get` verwenden anstelle von `readonly`?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Das Beispiel findest du auch im [Quelltext zum LernMoment](https://github.com/LernMoment/csharp/tree/master/Readonly)
-	Die Beschreibung von [readonly bei MSDN](https://msdn.microsoft.com/de-de/library/acdd6hb7(v=vs.140).aspx)
-	Die Beschreibung von [const bei MSDN](https://msdn.microsoft.com/de-de/library/e6w8fe1b.aspx)
