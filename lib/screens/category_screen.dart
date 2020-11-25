import 'package:flutter/material.dart';

import 'package:education_recipe_app/widgets/recipes.dart';
import 'package:education_recipe_app/helpers/color_helper.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final Map _args = ModalRoute.of(context).settings.arguments as Map;
    final Color _categoryColor = ColorHelper.getColorFromHex(_args['color']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _categoryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(_args['title']),
        centerTitle: true,
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Recipes(_args['id'], _categoryColor),
    );
  }
}
