# EA4 - Clean Code Development
Detaillierte Informationen zur App "Bildungsrezepte / Educational Recipes" finden sich im [master Branch](https://github.com/Studies2020-21/education_recipe_app).  

Der in Dart geschriebene Sourcecode befindet sich im Ordner `lib/`.

Im Folgenden wird zusammengefasst, welche
[![CCD Practices](https://img.shields.io/badge/CCD-Practices-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#ea4---clean-code-development)
angewendet bzw. welche 
[![CCD Smells](https://img.shields.io/badge/CCD-Smells-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#ea4---clean-code-development)
vermieden wurden.






## Understandability

#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)]() Consistency
> If you do something a certain way, do all similar things in the same way.

Grundlegend beinhaltet die Anwendung zwei Datenmodelle, die Kategorien und die Rezepte, welche darin enthalten sind. Sich gleichende Eigenschaften der Daten wurden hinsichtlich der Konsistenz identisch benannt, z.B. title, image u.ä. 

Auch gleichen sich die Listenansicht der Kategorien und die Listen der Rezepte einer Kategorie. Somit wurden auch hier absolut identische Techniken zur Anzeige verwendet: Mit Hilfe des StreamBuilder-Widgets wird jeweils eine Echtzeit-Verbindung zur Firestore-DB aufgebaut, siehe z.B. `lib/widgets/categories.dart`.

#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Poorly written comments
> Comment does not add any value (redundant to code), is not well formed, not correct grammar/spelling.

Generell wurden Kommentare nur an den Stellen verwendet, wo sie tatsächlich zum leichteren Verständnis des Programmablaufs hilfreich sind. Stattdessen wurde das Augenmerk lieber auf gut lesbaren Code gelegt. Da bei vorliegendem Sourcecode die Konventionen angewendet wurden, die für Dart und das Flutter SDK bereitgestellt werden, sollte sich jeder Entwickler schnell zurechtfinden.

Zudem wurden teilweise bereits gem. den Konventionen [Effective Dart: Documentation](https://dart.dev/guides/language/effective-dart/documentation)
sogenannte `Doc comments` verwendet, um rein theoretisch bei wachsender Code-Basis mit dem Tool [dartdoc](https://github.com/dart-lang/dartdoc) automatisiert strukturierte Dokumentationsseiten erstellen zu können:

`lib/helper/color_helper.dart`
```
/// Converts a hexadecimal color value to dart color type
static Color getColorFromHex(String hexColor) {
```
## Useless Stuff
#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Dead Comment, Code
> Just delete not used things.

Im Zuge der Entwicklung der Anwendung wurde tatsächlich des Öfteren refactored. 
Gerade die Bereitstellung einer zusätzlichen Web-Applikation hat mehrfach zu nutzlosem Code geführt, da sich diese Technik bei Flutter noch im Beta-Stadium befindet und aufgrund noch fehlender Unterstützung teilweise andere Methoden genutzt werden mussten als ursprünglich vorgesehen.

Sämtliche auskommentierten Codeblöcke wurden hinsichtlich CCD entfernt, da sie sich ohnehin noch im Version Control System befinden, falls nochmal darauf zugegriffen werden müsste. 

## Maintainability Killers
#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Magic Numbers / Strings
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


#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Duplication
> Eliminate duplication. Violation of the „Don’t repeat yourself“ (DRY) principle.

Auf Duplikationen wurde ebenso verzichtet. Die im letzten Punkt genannte Funktion `getColorFromHex(...)` in der Klasse `ColorHelper` wird an verschiedenen Stellen benötigt und deshalb in die Helper-Klasse ausgelagert. Sie wird wie folgt aufgerufen.

Z.B. in: `lib/screens/category_screen.dart`:
```
final Color _categoryColor = ColorHelper.getColorFromHex(_args['color']);
```
