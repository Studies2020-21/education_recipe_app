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
#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Duplication
> Eliminate duplication. Violation of the „Don’t repeat yourself“ (DRY) principle.



#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Magic Numbers / Strings
> Replace Magic Numbers with named constants.
