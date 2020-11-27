# EA4 - Clean Code Development
Detaillierte Informationen zur App "Bildungsrezepte / Educational Recipes" finden sich im [master Branch](https://github.com/Studies2020-21/education_recipe_app).  

Der in Dart geschriebene Sourcecode befindet sich im Ordner `lib/`.

Im Folgenden wird zusammengefasst, welche
[![CCD Practices](https://img.shields.io/badge/CCD-Practices-1abc9c.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#ea4---clean-code-development)
angewendet bzw. welche 
[![CCD Smells](https://img.shields.io/badge/CCD-Smells-red.svg)](https://github.com/Studies2020-21/education_recipe_app/tree/EA4-CCD#ea4---clean-code-development)
vermieden wurden.








## Headline 2


### Headline 3


#### [![Used Practice](https://img.shields.io/badge/Used-Practice-1abc9c.svg)]() Headline 4


#### [![Avoided Smell](https://img.shields.io/badge/Avoided-Smell-red.svg)]() Poorly written comments
> Comment does not add any value (redundant to code), is not well formed, not correct grammar/spelling.

Zudem wurden teilweise bereits gem. den Konventionen [Effective Dart: Documentation](https://dart.dev/guides/language/effective-dart/documentation)
sogenannte `Doc comments` verwendet, um rein theoretisch bei wachsender Code-Basis mit dem Tool [dartdoc](https://github.com/dart-lang/dartdoc) automatisiert strukturierte Dokumentationsseiten erstellen zu können:

`lib/helper/color_helper.dart`
```
/// Converts a hexadecimal color value to dart color type
static Color getColorFromHex(String hexColor) {
```
https://github.com/Studies2020-21/education_recipe_app/blob/8627962518c85d0158f1c8e41d4150b907f4167b/lib/helpers/color_helper.dart#L11-L12


##### Headline 5
