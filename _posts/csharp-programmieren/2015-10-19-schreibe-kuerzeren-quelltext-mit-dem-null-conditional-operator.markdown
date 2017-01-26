---
layout: post
title: Schreibe kürzeren Quelltext mit dem null-conditional Operator.
date: 2015-10-19T06:00:00+02:00
excerpt: "Mit ?. zu weniger Null-Abfragen."
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, C# 6.0, Operator]
image:
  feature: csharp-programmieren.jpg
---

Wie häufig hast du schon am Anfang einer Methode die Parameter auf `null` überprüft um eine `NullReferenceException` zu vermeiden? In C# 6.0 kommt Microsoft dir zur Hilfe. In dieser Version wurde ein Operator eingeführt, der direkt beim Zugriff auf ein Objekt dieses auf `null` überprüft.

Es geht also um Aufrufe wie diesen:

```
static void GebeMetaDatenAus(LernMoment moment)
{
	if(moment != null && moment.Author != null)
	{
		Console.WriteLine($"Hier die Meta-Daten des LernMoments: Author = {moment.Author}");
	}
}
```

Dieses Überprüfen auf `null` gibt es in verschiedensten Geschmacksvarianten. Wobei alle Varianten den Quelltext nicht gerade leserlicher machen. In C# 6.0 wurde dafür der null-conditional Operator eingeführt. Damit kannst du das Beispiel von oben anpassen:

```
static void GebeMetaDatenAus(LernMoment moment)
{
	Console.WriteLine($"Hier die Meta-Daten des LernMoments: Author = {moment?.Author}");
}
```

Findest du den Operator? Jup, es ist `?.`. Du verwendest also ein zusätzliches Fragezeichen um Methoden und Eigenschaften an einem Objekt aufzurufen. Dadurch werden drei wichtig Schritte ausgeführt:

1.	Der Operand wird auf `null` geprüft.
2.	Aufrufe werden unterdrück, wenn der Operand `null` ist.
3.	Es wird `null` zurück gegeben, wenn der Operand `null` ist.

Was würde also in dem Beispiel oben passieren, wenn ich die Methode so aufrufe `GebeMetaDatenAus(null);`? In der [String-Interpolation](/csharp-programmieren/mit-csharp-6-noch-mueheloser-werte-in-strings-einfuegen/), wird `moment` auf `null` geprüft. Dieses passiert, bevor die Eigenschaft `Author` aufgerufen wird. Somit wird keine `NullReferenceException` geworfen. Es wird `null` anstelle eines String mit dem Namen des Authors zurückgegeben. Die Ausgabe würde also so auf der Kommandozeile aussehen:

```sh
$> Hier die Meta-Daten des LernMoments: Author = null
```

Den *null-conditional* Operator kannst du auch in einer Kette von Aufrufen verwenden:

```cs
static string ExtrahiereVeroeffentlichungsDatum(LernMoment moment)
{
	return	moment?.VeroeffentlichtAm?.ToString("dd. MMM yyyy");
}
```

Nun wird sowohl `moment` als auch die Eigenschaft `VeroeffentlichtAm` auf `null` geprüft. 

Wie du siehst, bietet dir dieser Operator einige Vorteile. Wichtig ist allerdings, dass du dir überlegst wann und wie du ihn einsetzen kannst und willst. Ich persönlich finde, dass Quelltext möglichst für jeden verständlich sein sollte. 

Daraus folgt, dass ich versuche den verwendeten Sprachumfang möglichst gering zu halten. Es ist wie mit einer Fremdsprache. Es ist toll, wenn du dich gewählt ausdrücken kannst und viele spezielle Vokabeln kennst, allerdings läufst du damit auch Gefahr, dass dich andere nicht verstehen können, weil sie die Vokabel nicht kennen. Ich werde diesen Operator zukünftig häufiger einsetzen. Allerdings nicht um jeden Preis. 

Viele Beispiele die ich zu diesem Thema gefunden haben, zeigen insbesondere die Vorteile des *null-conditional* Operator in längeren Aufrufketten. Auch wenn das sicherlich korrekt ist, solltest du immer bedenken, dass eine längere Aufrufkette häufig ein Indiz für fragwürdigen Quelltext ist. Ich denke da an das *Law of Demeter*. Dazu mehr in einem weiteren LernMoment.

Jetzt erstmal viel Spaß mit dem `?.`

Jan

### Merke

-	Der *null-conditional* Operator gibt `null` zurück, wenn der Operand null ist.
-	Durch die Verwendung des *null-conditional* Operators werden Aufrufe auf einem Operandem unterdrückt, wenn dieser `null` ist.
-	In einer Aufrufkette mit mehreren `?.` Operatoren, wird an der Stelle "unterbrochen", an der `null` identifiziert wird.
-	Dieser Operator ist nicht gerade selbsterklärend. Daher gibt es einige Entwickler, die mit der Syntax nicht vertraut sind. Überlege dir, ob dir Verständlichkeit für jeden, oder "Aussehen" wichtiger sind.
-	Wenn du diesen Operator in einer Aufrufkette einsetzen willst, überprüfe erst, ob du nicht die Aufrufkette entfernen solltest (*Law of Demeter*).

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was passiert, wenn du `?.` anstelle von `.` beim Zugriff auf Eigenschaften oder Methoden eines Objektes verwendest?
-	Wann solltest du den *null-conditional* Operator nicht einsetzen?
-	Wie sieht ein Beispiel für die Verwendung des *null-conditional* Operators in einer Aufrufkette aus?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Die Beschreibung des *NULL-bedingten Operators* findest du auf [MSDN](https://msdn.microsoft.com/de-de/library/dn986595.aspx).
-	Eine ausführliche Beschreibung (in Englisch) gibt es beim [BlackRabbitCoder](http://geekswithblogs.net/BlackRabbitCoder/archive/2015/06/05/c.net-little-wonders-null-conditional-operator-in-c-6.aspx)
-	Eine weitere Beschreibung findest du in diesem [MSDN Magazine Artikel](https://msdn.microsoft.com/en-us/magazine/dn802602.aspx)
-	Wenn dich das *Law of Demeter* interessiert, dann bekommst du bei [coder corner](http://coders-corner.net/2013/04/01/real-world-softwaredesign-teil-2-law-of-demeter/) eine lange und detaillierte Einführung.
