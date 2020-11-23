import 'package:flutter/material.dart';

import 'package:education_recipe_app/widgets/app_drawer.dart';
import 'package:education_recipe_app/widgets/categories.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Recipes'),
      ),
      drawer: AppDrawer(),
      body: Categories(),
    );
  }
}
