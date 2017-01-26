---
layout: post
title: DataContract - Von der Einfachheit Objekte in eine XML-Datei zu schreiben.
date: 2015-10-16T06:00:00+02:00
excerpt: Verwende die Klassen DataContractSerializer, XmlWriter und XmlDictionaryWriter.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, Serialisierung, XML]
image:
  feature: csharp-programmieren.jpg
---

Im LernMoment ["DataContract - Die Flatrate zum Serialisieren deiner Objekte"](/csharp-programmieren/datacontract-flatrate-zum-serialisieren-deiner-objekte/) hast du gesehen, wie du deine Klasse erstellen kannst, die über `DataContract` serialisiert werden kann. Obwohl die Klasse nun vorbereitet ist, hast du immer noch nicht deine Objekte in einer XML-Datei. Dafür verwendest du die Klassen `DataContractSerializer`, `XmlWriter` und `XmlDictionaryWriter`.

Das Vorgehen zum erstellen einer XML-Datei aus deinem Objekt ist absolut einfach. Die relevante Methode der Klasse `DataContractSerializer` ist `WriteObject`. Hier ein komplettes Beispiel:

```cs
var moment = new LernMoment();
DataContractSerializer serializer = new DataContractSerializer(typeof(LernMoment));

using (Stream stream = new FileStream(filename, FileMode.Create, FileAccess.Write))
{
    using (XmlDictionaryWriter writer = XmlDictionaryWriter.CreateTextWriter(stream, Encoding.UTF8))
    {
        writer.WriteStartDocument();
        serializer.WriteObject(writer, moment);
    }
}
```

Das Beispiel ist Teil des [Quelltextes](https://github.com/LernMoment/csharp/tree/master/DataContract) zu diesem und dem anderen LernMoment bezüglich *DataContract*. Wenn du das Beispiel ausführst, wirst du eine Datei mit folgendem Inhalt erhalten:

```xml
<LernMoment xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.datacontract.org/2004/07/"><Email-Adressse_x0020_des_x0020_Autors>jan@lernmoment.de</Email-Adressse_x0020_des_x0020_Autors><Name>Objekte mühelos serialisieren mit Datenverträgen. Das hat nichts mit Mobilfunk zutun!</Name><tags xmlns:d2p1="http://schemas.microsoft.com/2003/10/Serialization/Arrays"><d2p1:string>Syntax</d2p1:string><d2p1:string>Files</d2p1:string><d2p1:string>Serialization</d2p1:string><d2p1:string>kein Delegate</d2p1:string></tags></LernMoment>
```

Dieses Beispiel zeigt wie cool `DataContract` ist um XML-Dateien zu erstellen und auch wie blöd es ist. Die miserable Formatierung liegt nicht am Blog, sondern an der Ausgabe von `DatContractSerializer` in Kombination mit `XmlDictionaryWriter`. Der `XmlDictionaryWriter` wird zum Schreiben empfohlen, weil er eine verbesserte Performance hat. Der Nachteil ist, dass du fast keinen Einfluss auf die Ausgabe hast. Er schreibt deine Objekte einfach in einem langen *String* in die Datei. 

Ist dir aufgefallen, wie die Eigenschaft `tags` von der Klasse [LernMoment](https://github.com/LernMoment/csharp/blob/master/DataContract/Programm.cs) ausgegeben wird? Diese Eigenschaft ist vom Typ `List<string>`. Wenn du dir nun die Ausgabe anschaust, dann siehst du, dass alle Elemente der Auflistung ausgegeben wurden. D.h. du kannst eine komplette Objekthierarchie einfach auf diesem Weg in eine XML-Datei schreiben. Dafür müssen natürlich alle deine eigenen Klassen in der Hierarchie einen `DataContract` umsetzen.

Wenn du mehr Einfluss haben willst auf das Aussehen deiner erzeugten XML-Datei, kannst du auch die Klasse `XmlWriter` verwenden. Sie ist wie auch `XmlDictionaryWriter` eine abstrakte Klasse und bietet verschiedene *Factory-Methoden* zum Erstellen konkreter Instanzen. Für `XmlWriter` brauchst du allerdings keine Instanz von `Stream`. Dort übergibst du einfach nur den Dateinamen und los geht's.  

```cs
var serializer = new DataContractSerializer(typeof(LernMoment));
var settings = new XmlWriterSettings { Indent = true };

using (XmlWriter writer = XmlWriter.Create(filename, settings))
{
    serializer.WriteObject(writer, moment);
}
```

Mit der Klasse `XmlWriterSettings` kannst du verschiedene Formatierungseigenschaften beeinflussen. Wenn du wie im Beispiel `Indent` setzt, dass ist die Ausgabe wesentlich verständlicher:

```xml
<?xml version="1.0" encoding="utf-8"?>
<LernMoment xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.datacontract.org/2004/07/">
  <Email-Adressse_x0020_des_x0020_Autors>jan@lernmoment.de</Email-Adressse_x0020_des_x0020_Autors>
  <Name>Objekte mühelos serialisieren mit Datenverträgen. Das hat nichts mit Mobilfunk zutun!</Name>
  <tags xmlns:d2p1="http://schemas.microsoft.com/2003/10/Serialization/Arrays">
    <d2p1:string>Syntax</d2p1:string>
    <d2p1:string>Files</d2p1:string>
    <d2p1:string>Serialization</d2p1:string>
    <d2p1:string>kein Delegate</d2p1:string>
  </tags>
</LernMoment>
```

Welchen positiven Einfluss die Verwendung von `XmlDictionaryWriter` auf die Performance hat ist nicht klar. Die Empfehlung `XmlDictionaryWriter`zu verwenden kommt von Microsoft. Entsprechend kannst du davon ausgehen, dass es Fälle gibt, in denen sie zutrifft. Da beide Varianten einfach zu erstellen sind, empfehle ich dir beide auszuprobieren und für deinen konkreten Fall zu überprüfen ob eine wesentlich besser ist.

Im Vergleich zu anderen XML-Technologien im .NET Umfeld, ist die Serialisierung / Deserialisierung von Objekten und Objekthierarchien mit `DataContract` und den gezeigten XML-Klassen erstaunlich unkompliziert. Die weiteren Optionen die .NET dir bietet und entsprechende Vergleiche bekommst du in kommenden LernMomenten.

Jetzt erstmal viel Spaß mit dem Erstellen von XML-Dateien

Jan

### Merke

-	Mit `DataContract` und `XmlWriter` bzw. `XmlDictionaryWriter` kannst du in wenigen Zeilen Quelltext deine Objekte und auch ganze Objekthierarchien in eine XML-Datei schreiben.
-	Auf diese Weise lassen sich auch *Collections* ganz einfach Serialisieren und Deserialisieren.
-	Die Klassen `XmlWriter` und `XmlDictionaryWriter` kannst ud nicht direkt instanzieren, weil es abstrakte Klassen sind. Du musst eine der angebotenen *statischen Factory-Methoden* verwenden.
-	Willst du möglichst viel Einfluss auf die Formatierung der erstellten XML-Datei nehmen, verwendest du besser `XmlWriter`. Dabei brauchst du nicht mal eine `Stream` Instanz.
-	Für `XmlDictionaryWriter` benötigst du zwar eine Instanz von `Stream` (z.B. `FileStream` oder `MemoryStream`), aber in Kombination mit `DataContractSerializer` soll er nach Aussage von Microsoft eine bessere Performance haben.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wann solltest du besser `XmlWriter` und wann besser `XmlDictionaryWriter` verwenden?
-	Was musst du beachten, wenn du Objekthierarchien in eine XML-Datei schreiben willst?
-	Wie sieht der Quelltext aus um ein mit `DataContract`-Attributen versehenes Objekt mit `XmlWriter` in eine Datei zu schreiben?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/DataContract).
-	Eine Auflistung welche *Collections* du mit *DataContracts* verwenden kannst und was es zu beachten gibt, findest du in diesem [MSDN-Artikel](https://msdn.microsoft.com/de-de/library/aa347850(v=vs.110).aspx)
-	`XmlDictionaryWriter` ist natürlich auf [MSDN](https://msdn.microsoft.com/de-de/library/system.xml.xmldictionarywriter(v=vs.110).aspx) dokumentiert.
-	Die Dokumentation von `XmlWriter` findest du ebenfalls auf [MSDN](https://msdn.microsoft.com/de-de/library/system.xml.xmlwriter(v=vs.110).aspx).
-	Auch der `DataContractSerializer` ist auf [MSDN](https://msdn.microsoft.com/de-de/library/system.runtime.serialization.datacontractserializer(v=vs.110).aspx) dokumentiert.
-	Dieser [MSDN-Blog-Artikel](http://blogs.msdn.com/b/carlosfigueira/archive/2011/08/30/wcf-extensibility-serialization.aspx) vergleicht die verschiedenen konkreten Ausprägungen des `XmlDictionaryWriter`.
-	Die Dokumentation zu [XmlWriterSettings](https://msdn.microsoft.com/de-de/library/system.xml.xmlwritersettings(v=vs.110).aspx) zeigt dir, wie du auf die Formatierung deiner XML-Datei Einfluss nehmen kannst, wenn du `XmlWriter` verwendest.
-	Eine detaillierte Beschreibung von Serialiserung und Deserialisierung mit `DataContract` gib es bei [MSDN](https://msdn.microsoft.com/de-de/library/ms731073(v=vs.110).aspx)
