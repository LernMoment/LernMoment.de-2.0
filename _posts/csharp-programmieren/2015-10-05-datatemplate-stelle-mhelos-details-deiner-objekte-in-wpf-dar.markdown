---
layout: post
title: Data-Templates - Stelle mühelos Details deiner Objekte in WPF dar
date: 2015-10-05T06:00:00+02:00
excerpt: Die wichtigsten Klassen und Eigenschaften zur Verwendung von DataTemplate.
modified:
share: true
categories: csharp-programmieren
lernmoment: C#
lm-newsletter-group-id: 1
show-lm-newsletter-subscribe-box: true
tags: [Syntax, WPF, Datentypen]
image:
  feature: csharp-programmieren.jpg
---

Hast du schon versucht eine Liste von Objekten in einer [ListBox][MSDN_ListBox] darzustellen? Dann weisst du bestimmt auch, dass WPF dies über die `ToString` Methode versucht. Obwohl das logisch ist, denn woher soll WPF nun wissen welche Daten aus deinem Objekt es wie darstellen soll, führt es häufig dazu, dass in deiner [ListBox][MSDN_ListBox] lediglich der Klassenname steht.

Damit du selber entscheiden kannst, wie die einzelnen Elemente aus einer Auflistung angezeigt werden, haben *Controls* wie `ComboBox`, `ListView` oder auch `GridView` die Eigenschaft [ItemTemplate][MSDN_ItemTemplate]. Mit dieser kannst du definieren welches [DataTemplate][MSDN_DataTemplate] für jedes Element von [Items][MSDN_Items] verwendet werden soll. 

> Ein [DataTemplate][MSDN_DataTemplate] beschreibt also wie genau *ein Element* der Auflistung dargestellt wird.

Der schnellste Weg erste Resultate zu sehen ist, wenn du einfach ein [DataTemplate][MSDN_DataTemplate] *inline* an deinem *Control* verwendest:

```xml
<ListBox Width="400" Margin="10"
         ItemsSource="{Binding Source={StaticResource myTodoList}}">
   <ListBox.ItemTemplate>
     <DataTemplate>
       <StackPanel>
         <TextBlock Text="{Binding Path=TaskName}" />
         <TextBlock Text="{Binding Path=Description}"/>
         <TextBlock Text="{Binding Path=Priority}"/>
       </StackPanel>
     </DataTemplate>
   </ListBox.ItemTemplate>
 </ListBox>
```

In diesem Beispiel gibt es an deinem `DataContext` eine Eigenschaft mit dem Namen `myTodoList`. Die Objekte in der Auflistung `myTodoList` haben drei Eigenschaften, die an je einen [TextBlock][MSDN_TextBlock] gebunden werden. Dieses Beispiel ist nun äußerst einfach. Normalerweise wird deine Aufbereitung wesentlich komplexer sein. Daher sind bei der Definition des [DataTemplate][MSDN_DataTemplate] deine Möglichkeiten fast unbegrenzt.

#### Wiederverwendbares DataTemplate

Das vorherige Beispiel begrenzt dich in den Möglichkeiten bzw. insbesondere in der Verwendung des [DataTemplate][MSDN_DataTemplate]. Besser ist es, wenn du das [DataTemplate][MSDN_DataTemplate] in einer *Resource* definierst. Dies kannst du sowohl in der gleichen *XAML-Datei* machen oder auch in einer separaten. Dann kannst du das gleiche [DataTemplate][MSDN_DataTemplate] sowohl für unterschiedliche *Controls* wie auch in unterschiedlichen Anwendungen einsetzen. Eine Möglichkeit es in einer *Resource* zu definieren ist so:

```xml
<Window.Resources>

...

<DataTemplate x:Key="myTaskTemplate">
  <StackPanel>
    <TextBlock Text="{Binding Path=TaskName}" />
    <TextBlock Text="{Binding Path=Description}"/>
    <TextBlock Text="{Binding Path=Priority}"/>
  </StackPanel>
</DataTemplate>

...

</Window.Resources>

```

Ein so erstelltes [DataTemplate][MSDN_DataTemplate] kannst du dann im *XAML* über [StaticResource][MSDN_StaticResource] wie folgt verwenden:

```xml
<ListBox Width="400" Margin="10"
         ItemsSource="{Binding Source={StaticResource myTodoList}}"
         ItemTemplate="{StaticResource myTaskTemplate}"/>
```

#### Dürfen es ein paar mehr sein?

Neben der [ItemTemplate][MSDN_ItemTemplate] Eigenschaft haben Controls für Auflistungen die Eigenschaft [ItemTemplateSelector][MSDN_ITSelector]. Dieser kannst du einen eigenen [DataTemplateSelector][MSDN_DTSelector] zuweisen. Nun kannst du nicht nur ein [DataTemplate][MSDN_DataTemplate] verwenden, sondern gleich mehrere. Dabei entscheidet der [DataTemplateSelector][MSDN_DTSelector] basierend auf Werten in den anzuzeigenden Objekten, welches [DataTemplate][MSDN_DataTemplate] benutzt werden soll.

Für das bisherige Beispiel könntest du sagen, dass alle Objekte mit einer Priorität gleich 1, besonders hervorgehoben werden sollen. Dazu ist es notwendig, dass du einen [DataTemplateSelector][MSDN_DTSelector] mit seiner [SelectTemplate][MSDN_DTSSelectTemplate] Methode implementierst. Im Kontext der bisherigen Beispiele würde das dann so aussehen:

```cs
public class TaskListDataTemplateSelector : DataTemplateSelector
{
    public override DataTemplate
        SelectTemplate(object item, DependencyObject container)
    {
        FrameworkElement element = container as FrameworkElement;

        if (element != null && item != null && item is Task)
        {
            Task taskitem = item as Task;

            if (taskitem.Priority == 1)
                return
                    element.FindResource("importantTaskTemplate") as DataTemplate;
            else
                return
                    element.FindResource("myTaskTemplate") as DataTemplate;
        }
    return null;
    }
}
```

Für dieses Beispiel brauchst du nun zwei verschiedene [DataTemplate][MSDN_DataTemplate]. Eines mit dem Namen `myTaskTemplate`, zum Beispiel so wie in dem vorherigen Beispiel, und ein weiteres mit dem Namen `importantTaskTemplate`. Nun gibst du an deinem *Control* nicht mehr direkt ein [DataTemplate][MSDN_DataTemplate] über die Eigenschaft [ItemTemplate][MSDN_ItemTemplate] an, sondern du gibst nur noch den *Selector* an:

```xml
<ListBox Width="400" Margin="10"
         ItemsSource="{Binding Source={StaticResource myTodoList}}"
         ItemTemplateSelector="{StaticResource myDataTemplateSelector}"
         HorizontalContentAlignment="Stretch"/>
```

Jetzt erstmal viel Spaß mit dem Visualisieren deiner Daten

Jan

### Merke

-	Ein [DataTemplate][MSDN_DataTemplate] verwendest du um eine individuelle Visualisierung deiner Datenobjekte zu erstellen.
-	Insbesondere um die einzelnen Objekte einer Auflistung in *Controls* wie `ComboBox` oder `GridView` darzustellen, kann dir ein [DataTemplate][MSDN_DataTemplate] serh helfen.
-	Du definierst es am besten als *Resource* wie zum Beispiel innerhalb von `<Window.Resources>`.
-	Ein als *Resource* definiertes [DataTemplate][MSDN_DataTemplate] kannst du mit [StaticResource][MSDN_StaticResource] einbinden.
-	Wenn du für eine Auflistung verschiedene [DataTemplate][MSDN_DataTemplate] verwenden möchtest, brauchst du einen [DataTemplateSelector][MSDN_DTSelector] den du der Eigenschaft [ItemTemplateSelector][MSDN_ITSelector] deines *Controls* übergibst.

### Lernquiz 

Verwende folgende Fragen, um das Gelernte von heute zu festigen:

-	Wann kommt ein `DataTemplate` hauptsächlich zum Einsatz?
-	Wie lautet die Syntax um ein als *Resource* definiertes `DataTemplate` mit dem Namen `meinTemplate` an einer `ListBox` zu verwenden?
-	Wozu kannst du einen `DataTemplateSelector` verwenden?

Am besten schaust du dir morgen und dann nochmal in ein paar Tagen die vorherigen Fragen an und beantwortest sie, ohne den Text vorher gelesen zu haben.

### Weitere Informationen

-	Alle in diesem LernMoment verwendeten Beispiele stammen aus diesem [MSDN-Artikel](https://msdn.microsoft.com/de-de/library/ms742521(v=vs.100).aspx). Dort findest du auch eine umfangreichere Beschreibung.
-	Eine weitere Einführung in das Thema findest du in diesem [OpenBook](http://openbook.rheinwerk-verlag.de/visual_csharp_2010/visual_csharp_2010_21_004.htm#mj3d941c87fadf52ce2fc6bc3a80d63ed8)

[MSDN_ListBox]: https://msdn.microsoft.com/de-de/library/system.windows.controls.listbox(v=vs.110).aspx "Beschreibung der Klasse ListBox auf MSDN"
[MSDN_DataTemplate]: https://msdn.microsoft.com/de-de/library/system.windows.datatemplate(v=vs.110).aspx "Beschreibung der Klasse DataTemplate auf MSDN"
[MSDN_DTSelector]: https://msdn.microsoft.com/de-de/library/system.windows.controls.datatemplateselector(v=vs.110).aspx "Beschreibung der Klasse DataTemplateSelector auf MSDN"
[MSDN_DTSSelectTemplate]: https://msdn.microsoft.com/de-de/library/system.windows.controls.datatemplateselector.selecttemplate(v=vs.110).aspx "Beschreibung der Methode DataTemplateSelector.SelectTemplate auf MSDN"
[MSDN_Items]: https://msdn.microsoft.com/de-de/library/system.windows.controls.itemscontrol.items(v=vs.110).aspx "Beschreibung von ListBox.Items auf MSDN"
[MSDN_ItemTemplate]: https://msdn.microsoft.com/de-de/library/system.windows.controls.itemscontrol.itemtemplate(v=vs.110).aspx "Beschreibung von ListBox.ItemTemplate auf MSDN"
[MSDN_ITSelector]: https://msdn.microsoft.com/de-de/library/system.windows.controls.itemscontrol.itemtemplateselector(v=vs.110).aspx "Beschreibung von ListBox.ItemTemplateSelector auf MSDN"
[MSDN_TextBlock]: https://msdn.microsoft.com/de-de/library/system.windows.controls.textblock(v=vs.110).aspx "Beschreibung der Klasse TextBlock auf MSDN"
[MSDN_StaticResource]: https://msdn.microsoft.com/de-de/library/ms750950(v=vs.110).aspx "Beschreibung des Markup-Elements StaticResource auf MSDN"