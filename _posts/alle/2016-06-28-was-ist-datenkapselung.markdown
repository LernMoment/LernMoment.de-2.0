---
layout: post
title: "Was ist Datenkapselung - Ein einfaches Beispiel"
excerpt: Lerne eines der wichtigsten Prinzipien von (objektorientierter) Softwareentwicklung kennen
categories: alle
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
share: true
tags: [C#, Konzept, Professionalität]
image:
  feature: intro-code.jpg
modified: 2016-10-24T20:00:00+01:00
date: 2016-06-28T10:00:00+01:00
---

Im [C# Tutorial Deutsch](https://www.youtube.com/playlist?list=PLP2TrPpx5VNkr-wmkjguVZAvN4T5EPJbF) geht es viel um das Thema Objekt-Orientierung. Gerade, wenn du mit der Objekt-Orientierten-Programmierung (OOP) anfängst, dann kann es beinahe unverständlich sein, wie der Entwickler es geschafft hat bestimmte Klassen zu finden. Darüber hinaus habe ich gerade zu Anfang nicht verstehen können warum eine Klasse gewisse Attribute, Eigenschaften und Methode hat und nicht andere. Datenkapselung ist eines der Prinzipien, die dir den Weg weisen zu einem "guten" Objekt-Orientierten Design und Quellcode.

Datenkapselung, im Englischen "Information Hiding" genannt, ist ein sehr grundlegendes Konzept der Objektorientierung. Wie ich im [C# Kurs](/einstieg-csharp/) erkläre besteht eine Klasse aus Daten (Attribute & Eigenschaften) und Verhalten (Methoden). Die Idee ist nun, dass du über das Verhalten einer Klasse die Daten dieser Klasse änderst. Das wird als Datenkapselung bezeichnet.

Warum wird das gemacht? Die Überlegung ist, dass wir, wenn wir von außen auf eine Klasse schauen, so wenig wie möglich über deren Details erfahren wollen bzw. erfahren sollen. Schauen wir uns dazu folgenden Quellcode an: 

```cs
public class Auto
    {
        public string marke;
        public int alterInJahren;
        private int aktuelleGeschwindigkeit;

        public void BeschleunigeAuf100KmH()
        {
            aktuelleGeschwindigkeit = 100;

            if (IstSchnell())
            {
                Console.WriteLine("Habe schnell beschleunigt! Yeah!");
            }
            else
            {
                Console.WriteLine("Habe normal beschleunigt!");
            }
        }

        public int SagAktuelleGeschwindigkeit()
        {
            return aktuelleGeschwindigkeit;
        }

        private bool IstSchnell()
        {
            if (marke == "Porsche")
            {
                return true;
            }

            return false;
        }
    }
```

Hier siehst du eine Version der Klasse Auto. Wenn du dir diese Version anschaust, wirst du sehen, dass es folgendes Attribut gibt: `public string marke;`

Das Attribut `marke`ist nicht gekapselt. D.h. jeder kann es in jeder erdenklichen Art und Weise von außerhalb verändern. Solange sich an der Klasse nichts ändert, ist das auch erstmal nicht so ein riesiges Problem (ausser, dass es in diesem Fall zu einigen Fehler führen wird). Wenn du als Benutzer dieser Klasse jedoch davon ausgehst, dass du in diesem Attribut jede beliebige Zeichenkette speichern kannst und ich später die Klasse ändere, so dass nur noch eine Automarke in einer ganz bestimmten Schreibweise erlaubt ist, dann wird das Programm ab einem bestimmten Zeitpunkt nicht mehr funktionieren bzw. noch mehr Fehler haben.

<div class="subscribe-notice">
<h5>Lerne weitere Grundlagen von Datenkapselung und Objekt-Orientierung</h5>
<a markdown="0" href="https://www.udemy.com/einstieg-in-csharp-software-programmieren-wie-ein-profi/?couponCode=UCSK_LM2016-110" class="notice-button">Hier geht's zum Online-Kurs "Einstieg in C#" (inkl. Rabatt ;) >></a>
</div>

Eine geänderte Version der Klasse `Auto` könnte zum Beispiel so aussehen:

```cs
 public class Auto
    {
        private int aktuelleGeschwindigkeit;

        public Auto(string autoMarke)
        {
            Marke = autoMarke;
            AlterInJahren = 0;
            aktuelleGeschwindigkeit = 0;
        }

        private string marke;

        public string Marke
        {
            get { return marke; }
            set
            {
                if (value == "Porsche")
                {
                    marke = value;
                }
                else
                {
                    marke = "Nicht unterstützt!";
                }
            }
        }

        public int AlterInJahren { get; set; }

        public void BeschleunigeAuf100KmH()
        {
            aktuelleGeschwindigkeit = 100;

            if (IstSchnell())
            {
                Console.WriteLine("Der {0} hat schnell beschleunigt! Yeah!", Marke);
            }
            else
            {
                Console.WriteLine("Der {0} hat normal beschleunigt!", Marke);
            }
        }

        public int SagAktuelleGeschwindigkeit()
        {
            return aktuelleGeschwindigkeit;
        }

        private bool IstSchnell()
        {
            if (Marke == "Porsche")
            {
                return true;
            }

            return false;
        }
    }
```

Neben dem veränderten Verhalten ist hier besonders zu beachten, dass in einer Eigenschaft die Datenkonsistenz überprüft wird. Der Entwickler der Klasse `Auto` sagt, dass für seine Anwendung nur Autos der Marke Porsche relevant sind. Weiterhin macht er noch eine Einschränkung und definiert, dass nur "Porsche" und nicht beispielsweise "porsche" verwendet wird. Somit kann er in der Methode `IstSchnell()` auch den einfachen Vergleich machen.

Mithilfe der Datenkapselung stellt der Entwickler also sicher, dass seine Annahmen auch tatsächlich eingehalten werden. Wenn du die geänderte Klasse benutzen willst, hast du jetzt keine Möglichkeit mehr "falsche" Werte der Eigenschaft `Marke` zuzuweisen.

Die Datenkapselung ist also unter anderem dafür wichtig, dass du zukünftig deine Klasse verändern kannst, ohne das Benutzer deiner Klasse ihren Quellcode ändern müssen.

Bedenke immer, dass diese Beispiele überaus einfach sind. Üblicherweise hast du auch in kleinen Anwendungen 10, 20, 100 oder mehr Klassen. Dann wird es schnell unübersichtlich. Wenn du keine Datenkapselung verwendest, weist du dann einfach nicht mehr welche Werte in den Attributen stehen können bzw. welche Werte von anderen Klassen darein geschrieben werden. Damit hast du dann einen Inkubator für Fehler geschaffen.

Wenn du nochmals eine andere Erklärung haben willst, dann kann ich [diesen Artikel](http://www.inf-schule.de/modellierung/ooppython/roboter/datenkapselung/konzept_datenkapselung) empfehlen.

Viele Spaß beim Verstecken deiner Daten

Jan

PS: Den kompletten Quellcode aus diesem Artikel findest du [in diesem GitHub Projekt](https://github.com/LernMoment/einstieg-csharp-klassen-definieren).