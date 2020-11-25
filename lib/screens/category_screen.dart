import 'package:flutter/material.dart';

import 'package:education_recipe_app/widgets/recipes.dart';
import 'package:education_recipe_app/helpers/color_helper.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.getColorFromHex(args['color']),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(args['title']),
        centerTitle: true,
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Recipes(args['id']),
    );
  }
}
