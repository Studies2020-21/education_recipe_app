# EA4 - Clean Code Development
Detaillierte Informationen zur App "Bildungsrezepte / Educational Recipes" finden sich im [master Branch](https://github.com/Studies2020-21/education_recipe_app).  

Der in Dart geschriebene Sourcecode befindet sich im Ordner `lib/`.

Im Folgenden wird zusammengefasst, welche
[![CCD Practices](https://img.shields.io/badge/CCD-Practices-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#ea4---clean-code-development)
angewendet bzw. welche 
[![CCD Smells](https://img.shields.io/badge/CCD-Smells-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#ea4---clean-code-development)
vermieden wurden.

## General

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-follow-standard-conventions) Follow Standard Conventions
> Coding-, Architecture-, Design-Guidelines



#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-keep-it-simple-stupid-kiss) Keep it simple, stupid (KISS)
> Simpler is always better. Reduce complexity as much as possible.



## Environment

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-project-build-requires-only-one-step) Project Build Requires Only One Step 
> Check out and then build with a single command.

Das Flutter Toolset bietet drei verschiedene Build Modes an, die über einfache Befehle in der Kommandozeile oder über Plugins in den gängigen IDEs angestossen werden können:

##### Release Mode
Der Release Mode wird zum Deployen der App verwendet. Hierbei wird der Code optimiert, indem z.B. Debugging-Informationen entfernt werden und die App für einen schnellen Start, performante Ausführung und geringe Dateigröße kompiliert wird.
Ein Release lässt sich für mit `flutter run --release` alle konfigurierten Plattformen durchführen oder mit `flutter build <target>` für eine spezifische Plattform (hier iOS, Android oder Web).

##### Debug Mode
Zur Entwicklung wird der Debug Mode verwendet, welcher per Default mit `flutter run` kompiliert wird. Auch hier können verschiedene Ziele verwendet werden.

Eine Besonderheit bei der App-Entwicklung mit Flutter stellt der [Hot Reload](https://flutter.dev/docs/development/tools/hot-reload) dar.
Hierbei werden aktualisierte Quellcodedateien in die laufende Dart Virtual Machine (VM) eingefügt, woraufhin der Widget-Baum automatisch neu erstellt wird, sodass die Auswirkungen von Änderungen schnell angezeigt werden können. Bei der Flutter-Entwicklung hat man somit eigentlich durchgehend einen Android- oder iOS-Simulator geöffnet, auf dem der aktuelle Stand in Sekundenbruchteilen angezeigt wird.

##### Profile Mode
Zudem existiert mit `flutter run --profile` noch ein Build Modus zur Performance Analyse, bei dem das sogenannte Tracing eingeschaltet wird, wodurch sich verschiedene angebotene Source-Level Debugging Tools mit den Prozessen verbinden können.

#### [![Not Yet Used Practice](https://img.shields.io/badge/Not%20Yet%20Used-Practice-yellow.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-executing-tests-requires-only-one-step) Executing Tests Requires Only One Step
> Run all unit tests with a single command.

Zugegeben, dieses Thema wurde bisher etwas stiefmütterlich behandelt, sowohl im Job als auch hier im Kurs.
Lag hier aber auch an der knappen Zeit zur Umsetzung der Applikation, der Autor gelobt Besserung :wink:

Dieses Repository enthält nur den einen default-Testcase, der beim Erstellen eines Flutter-Projektes automatisch angelegt wird.
Dieser schlägt natürlich inzwischen fehl, da die gesamte Code-Basis des default-Projektes ersetzt wurde.

Aber das Interesse ist geweckt. Gerade auch, weil das Flutter-SDK einige automatisierte Test-Szenarien von Haus aus bereits mitbringt, darunter:
* Unit-Tests
* Widget-Tests
* Integration-Tests

Weitere Infos unter [Testing Flutter apps](https://flutter.dev/docs/testing).

Und tatsächlich können alle implementierten Tests mit einem einzigen Kommando auf der Shell abgefeuert werden:
`flutter test`

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-source-control-system) Source Control System
> Always use a source control system.

Eher vertraut mit GitLab wurde hier bewusst GitHub eingesetzt, zu Testzwecken und auch um die angedachte Verbindung zum Education Repository leichter herstellen zu können.

Die Vorteile einer Versionskontrolle liegen auf der Hand:
- umfassender Verlauf der langfristigen Änderungen für jede Datei
- Branching und Merging für verteilte Teamarbeit
- Nachverfolgbarkeit

Daneben ist als großer Vorteil ebenfalls noch anzuführen, dass sich jegliche weitere Backup-Lösungen mit dem Einsatz eines Version Control Systems erübrigen, da der Code ohnehin an mehreren Stellen physisch vorgehalten wird, u.a. im lokalen Dateisystem, einem lokalen Repository und dem Remote Repository.

#### [![Not Yet Used Practice](https://img.shields.io/badge/Not%20Yet%20Used-Practice-yellow.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-continuous-integration) Continuous Integration
> Assure integrity with Continuous Integration.

Noch nicht integriert, kommt aber definitiv mit den nächsten Einsendeaufgaben. Diesen Bereich erkunden zu können war einer der Gründe, warum man sich hier für eine mobile Applikation entschieden hat.
 
Gerade das Signieren und Veröffentlichen von mobilen Applikationen in den AppStores von Google und Apple ist ein sehr aufwendiger Prozess, der aber heutzutage mit geeigneten Tools massiv vereinfacht werden kann.

Hinsichtlich Flutter Applikationen wurde auf der "Flutter Live" Konferenz 2018 in London eine dedizierte CI/CD-Lösung namens Codemagic vorgestellt, siehe [codemagic.io](https://codemagic.io/start/). Das wird spannend... :smile:



## Naming

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-choose-descriptive--unambiguous-names) Choose Descriptive / Unambiguous Names
> Names have to reflect what a variable, field, property stands for. Names have to be precise.


#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-name-classes-after-implementation) Name Classes After Implementation
> The name of a class should reflect how it fulfills the functionality provided by its interface(s).


#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-name-methods-after-what-they-do) Name Methods After What They Do
> The name of a method should describe what is done, not how it is done.



## Understandability

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-consistency) Consistency
> If you do something a certain way, do all similar things in the same way.

Grundlegend beinhaltet die Anwendung zwei Datenmodelle, die Kategorien und die Rezepte, welche darin enthalten sind. Sich gleichende Eigenschaften der Daten wurden hinsichtlich der Konsistenz identisch benannt, z.B. title, image u.ä. 

Auch gleichen sich die Listenansicht der Kategorien und die Listen der Rezepte einer Kategorie. Somit wurden auch hier absolut identische Techniken zur Anzeige verwendet: Mit Hilfe des StreamBuilder-Widgets wird jeweils eine Echtzeit-Verbindung zur Firestore-DB aufgebaut, siehe z.B. `lib/widgets/categories.dart`.

#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-poorly-written-comments) Poorly written comments
> Comment does not add any value (redundant to code), is not well formed, not correct grammar/spelling.

Generell wurden Kommentare nur an den Stellen verwendet, wo sie tatsächlich zum leichteren Verständnis des Programmablaufs hilfreich sind. Stattdessen wurde das Augenmerk lieber auf gut lesbaren Code gelegt. Da bei vorliegendem Sourcecode die Konventionen angewendet wurden, die für Dart und das Flutter SDK bereitgestellt werden, sollte sich jeder Entwickler schnell zurechtfinden.

Zudem wurden teilweise bereits gem. den Konventionen [Effective Dart: Documentation](https://dart.dev/guides/language/effective-dart/documentation)
sogenannte `Doc comments` verwendet, um rein theoretisch bei wachsender Code-Basis mit dem Tool [dartdoc](https://github.com/dart-lang/dartdoc) automatisiert strukturierte Dokumentationsseiten erstellen zu können:

`lib/helper/color_helper.dart`
```
/// Converts a hexadecimal color value to dart color type
static Color getColorFromHex(String hexColor) {
```

## Conditionals

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-avoid-negative-conditionals) Avoid Negative Conditionals
> Negative conditionals are harder to read than positive conditionals

## Useless Stuff
#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-dead-comment-code) Dead Comment, Code
> Just delete not used things.

Im Zuge der Entwicklung der Anwendung wurde tatsächlich des Öfteren refactored. 
Gerade die Bereitstellung einer zusätzlichen Web-Applikation hat mehrfach zu nutzlosem Code geführt, da sich diese Technik bei Flutter noch im Beta-Stadium befindet und aufgrund noch fehlender Unterstützung teilweise andere Methoden genutzt werden mussten als ursprünglich vorgesehen.

Sämtliche auskommentierten Codeblöcke wurden hinsichtlich CCD entfernt, da sie sich ohnehin noch im Version Control System befinden, falls nochmal darauf zugegriffen werden müsste. 

## Maintainability Killers
#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-magic-numbers--strings) Magic Numbers / Strings
> Replace Magic Numbers with named constants.

Magic Numbers sind im Sourcecode eines Programms auftauchende Zahlenwerte, deren Bedeutung sich nicht unmittelbar erkennen lässt. Auf Verwendung wurde verzichtet, stattdessen wurden Konstantendefinitionen eingesetzt.

Aus `lib/helpers/color_helper.dart`:

```
class ColorHelper {
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}
```

wurde somit:

```
class ColorHelper {
  static const HEX_COLOR_LENGTH = 6;
  static const COLOR_RADIX = 16;

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == HEX_COLOR_LENGTH) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: COLOR_RADIX));
  }
}
```

Im Quellcode finden sich natürlich noch viele weitere Zahlenwerte, z.B.:
```
Container(
  height: 300,
  ...
),

TextStyle(
  fontSize: 20,
  ...
),

SizedBox(height: 20),

[... und viele mehr ...]
```

Bei allen diesen Beispielen handelt es sich aber um vordefinierte Parameter der eingesetzten Widgets, bei denen eindeutig erkennbar ist ("named params"), dass es sich um notwendige Angaben in Pixel handelt. Eine Ersetzung mit Konstanten ist in diesen Fällen also kontraproduktiv, da es die Lesbarkeit eher erschweren würde.


#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#-duplication) Duplication
> Eliminate duplication. Violation of the „Don’t repeat yourself“ (DRY) principle.

Auf Duplikationen wurde ebenso verzichtet. Die im letzten Punkt genannte Funktion `getColorFromHex(...)` in der Klasse `ColorHelper` wird an verschiedenen Stellen benötigt und deshalb in die Helper-Klasse ausgelagert. Sie wird wie folgt aufgerufen.

Z.B. in: `lib/screens/category_screen.dart`:
```
final Color _categoryColor = ColorHelper.getColorFromHex(_args['color']);
```
