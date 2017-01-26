---
layout: post
title: Variablen einfangen mit Lambda-Ausdrücken
date: 2015-09-11T10:00:00+02:00
excerpt: Die 2 wichtigsten Grundsätze für externe Variablen in Lambda-Ausdrücken.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Konzept, Lambda, Delegate]
image:
  feature: csharp-programmieren.jpg
---

Weißt du noch wie der kürzeste Lambda-Ausdruck zum multiplizieren zweier Zahlen ist? Wenn nicht, lies nochmals den LernMoment [Lambda-Ausdrücke erstellen](/csharp-programmieren/lambda-ausdruecke-erstellen/) bevor du hier weiter machst.

Innerhalb eines Lambda-Ausdrucks kannst du Daten aus dem Kontext, also von außerhalb des Lambda-Ausdrucks, verwenden. Das könnte zum Beispiel so aussehen:

```cs
void IrgendeineMethode()
{
  int dieMagischeZahl = 42;

  Func<int, int> multipliziereMitMagischerZahl = zahl => zahl * dieMagischeZahl;

  Console.WriteLine( multipliziereMitMagischerZahl(2) ); // Gibt 84 aus
}
```

Die Verwendung von Daten die außerhalb des Lambda-Ausdrucks existieren wird im Englischen als *"capturing variable"* bezeichnet. Es geht also um das *"Einfangen"* von Variablen. 

#### Grundsatz 1

Der wichtigste Grundsatz, mit dem du dir einige Eigenheiten erklären kannst, lautet:

> Eine "captured variable" wird ausgewertet, wenn ein Delegate ausgeführt wird, nicht wenn der ihm zugewiesene Lambda-Ausdruck definiert wird.

Mit diesem Grundsatz im Kopf, was glaubst du passiert, wenn das Beispiel von oben wie folgt erweitert wird?

```cs
void IrgendeineAndereMethode()
{
  int dieMagischeZahl = 42;

  Func<int, int> multipliziereMitMagischerZahl = zahl => zahl * dieMagischeZahl;

  dieMagischeZahl = 10;

  Console.WriteLine( multipliziereMitMagischerZahl(2) );
}
```

Richtig, diese Methode wird `20` ausgeben. In diesem trivialen Beispiel ist das erstmal nicht sonderlich erstaunlich. Da es ein Grundsatz ist, gilt er aber auch für alle nicht so trivialen Beispiele. Häufig verwende ich Lambdas in Kombination mit der *TPL*. Gerade dann, aber auch in vielen anderen Situationen, ist es immens wichtig, dass du dir diesen Grundsatz verinnerlichst.

#### Grundsatz 2

In diesem Zusammenhang gibt es einen weiteren Aspekt, den du kennen solltest. Die Kurzform des ersten Grundsatzes könnte lauten: *Für Delegates werden Variablen und nicht Werte eingefangen.* Dieses *Einfangen* kannst du wörtlich nehmen. Verwendest du eine Variable in einem Lambda-Ausdruck, welche außerhalb de Ausdrucks definiert ist, bleibt diese solange verfügbar, wie das Delegate lebt. 

> Eine "captured variable" in einem Lambda-Ausdruck lebt solange, wie das Delegate, dem der Ausdruck zugewiesen wurde.

Auch dieser zweite Grundsatz für sich ist erstmal nicht sonderlich umwerfend. Er gibt dir allerdings einen ersten Einblick wie der Compiler und die CLR mit Daten in Lambda-Ausdrücken umgeht. In einem weiteren LernMoment werde ich dir einige Fälle zeigen, die auf den ersten Blick nicht zu erklären sind. Mit diesen beiden Grundsätze ist das jedoch ganz einfach.

#### "One more thing ..."

Die beiden Grundsätze gelten nur für Variablen die über Inklusion im Lambda-Ausdruck verwendet werden. Definierst du also einen Lambda-Ausdruck dem Parameter übergeben werden, ist das ein ganz anderes Thema. Hier noch ein abschließendes Beispiel um dies zu verdeutlichen:

```cs
void EineVoelligAndereMethode()
{
  int dieMagischeZahl = 42;

  Func<int, int, int> multipliziereZahlen = (zahl1, zahl2) => zahl1 * zahl2;

  dieMagischeZahl = 10;

  Console.WriteLine( multipliziereZahlen(dieMagischeZahl, 25) ); // Gibt 250 aus
}
```

Jetzt erstmal viel Spaß mit dem Einfangen von Variablen

Jan


### Merke

-	*Capturing Variable* bedeutet, dass in einem Lambda-Ausdruck eine Variable verwendet wird, die nicht lokal im Ausdruck definiert ist oder dem Ausdruck als Parameter übergeben wird.
-	Die deutsche Übersetzung - *eingefangene Variable* - ist durch aus wörtlich zu nehmen.
-	Eine *captured variable* wird ausgewertet, wenn ein Delegate ausgeführt wird, nicht wenn der ihm zugewiesene Lambda-Ausdruck definiert wird.
-	Eine *captured variable* in einem Lambda-Ausdruck lebt solange, wie das Delegate, dem der Ausdruck zugewiesen wurde.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Was verstehst du unter einer *eingefangenen Variable*?
-	Wie lange lebt eine *eingefangene Variable*?
-	Wann wird der Wert einer *eingefangenen Variablen* verwendet?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Den kompletten Quelltext zum heutigen Lernmoment findest du [hier](https://github.com/LernMoment/csharp/tree/master/LambdaEingefangeneVariablen).
-	Eine Erklärung mit verständlichem Beispiel wie das *Einfangen* geht, findest du in [diesem Artikel](http://blogs.msdn.com/b/matt/archive/2008/03/01/understanding-variable-capturing-in-c.aspx) von Matthew Manela (Mitarbeiter von Microsoft).
-	Die grundlegende Idee für den 2. Grundsatz habe ich von [diesem Artikel](http://csharp.2000things.com/2014/09/10/1179-captured-variables-lifetime-matches-delegate/).
