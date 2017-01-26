---
layout: post
title: DataContract - Die Flatrate zum Serialisieren deiner Objekte
date: 2015-09-02T06:00:00+02:00
excerpt: Wie du (fast) kostenlos einen Datenvertrag für deine Klasse realisierst
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, File, Serialisierung]
image:
  feature: csharp-programmieren.jpg
modified:
---

In .NET gibt es viele Möglichkeiten ein Objekt in eine Datei zu schreiben und es später daraus zu laden. Einen simplen Ansatz bietet der Datenvertrag. Das hat nichts Mobilfunk zutun, sondern ist ein Konzept welches die [Windows Communication Foundation (WCF)](https://msdn.microsoft.com/de-de/library/Dd456779(v=VS.110).aspx) eingeführt hat.

Damit du Objekte deiner Klasse in eine Datei im *XML-* oder *JSON-Format* schreiben kannst, brauchst du lediglich die beiden Attribute `[DataContract]` und `[DataMember]`. Im Gegensatz zu anderen Serialisierungstechnologien, musst du bei Datenverträgen explizit definieren welche Attribute und Eigenschaften beim Serialisieren berücksichtigt werden.

Du sagst, dass dein Klasse einen Datenvertrag realisiert, indem du das `[DataContract]` Attribut an der Klasse definierst. Dies Attribut wie auch weitere relevante Attribute und Klassen sind im Namensraum `System.Runtime.Serialization` definiert. Ein einfaches Beispiel könnte so aussehen:

```cs
[DataContract]
public class LernMoment
{
	[DataMember(Name = "Email-Adressse des Autors")]
	private string emailAuthor;

	[DataMember(IsRequired = true)]
	public string Name {get; set;}

	[DataMember]
	protected List<string> tags;
}
```

Wie du siehst verwendest du das `[DataMember]` Attribut an allen Eigenschaften und Attibuten die bei der Serialisierung berücksichtigt werden sollen. Hast du zum Beispiel an einer Klasse eine Eigenschaft die nur aktuelle Werte von einem Gerät oder einem Webservice enthält, möchtest du diese nicht unbedingt speichern.

Über die Eigenschaften des `[DataMember]` Attributs, kannst du die Serialisierung weiter beeinflussen. Wenn du nichts weiter angibst, wie bei dem Attribut `tags` im vorherigen Beispiel, verwendet die Serialisierung den Namen des Attributs innerhalb der erzeugten Datei. Möchtest du nun in der erzeugten Datei einen Namen haben den .NET nicht als Variablennamen gestattet, kannst du dies über `[DataMember(Name = "<Ein anderer Name>")]` angeben. 

Dies erlaubt auch die Entkopplung deiner Klassenschnittstelle mit den Namen in der Datei. Wenn du im Beispiel oben das Attribut `emailAuthor` an der Klasse umbenennen möchtest, kannst du dies im Quelltext machen, ohne Probleme beim lesen einer bereits existierenden Datei zu bekommen.

Auch die Eigenschaft `IsRequired` wird für die Versionierung verwendet. Hiermit gibst du an, dass es bei der Deserialisierung einen Fehler gibt, wenn der entsprechende Eintrag in der Datei nicht vorhanden ist.

Nun kennst du schon die wichtigsten Attribute um für deine Klasse ein Datenvertrag zu definieren. Objekte einer solchen Klassen können mit dem `DataContractSerializer` geschrieben und gelesen werden. Wie dies funktioniert erfährst du in einem weiteren LernMoment. Um dich nicht auf die Folter zu spannen, habe ich es im [Beispiel](https://github.com/LernMoment/csharp/tree/master/DataContract) schon eingebaut.

Jetzt erstmal viel Spaß mit deiner Flatrate zum speichern und laden von Objekten

Jan


PS: Auch, wenn es noch kleine Lücken gibt, unterstützt Mono diese Funktionalität fast vollständig.

### Merke

-	Mit Datenverträgen (`DataContract`) kannst du mühelos Objekte deiner Klasse in verschiedenen Formaten speichern und wieder einlesen.
-	Die nötigen Attribute und Klassen sind im Namensraum `System.Runtime.Serialization` definiert.
-	`[DataContract]` wird an der Klassendefinition verwendet.
-	Mit `[DataMember]` definierst du welche Eigenschaften und Attribute deiner Klasse gespeichert und gelesen werden sollen.
-	Über die Eigenschaften `Name` und `IsRequired` des `[DataMember]` Attributs kannst du insbesondere auf die Versionierung deines Dateiformates Einfluss nehmen.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wofür verwendest du das Attribut `[DataContract]`?
-	Was wird in eine Datei geschrieben, wenn an einer Klasse `[DataContract]` definiert ist aber keine `[DataMember]`?
-	Wann solltest du die `Name` Eigenschaft des Attributs `[DataMember]`verwenden?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/DataContract).
-	Eine Einführung in Datenverträge gibt es bei [MSDN](https://msdn.microsoft.com/de-de/library/ms733127(v=VS.110).aspx). Dies ist allerdings sehr auf WCF ausgelegt. Da geht es weniger um das reine speichern und laden von Objekten.
