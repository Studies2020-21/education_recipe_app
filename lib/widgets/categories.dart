import 'package:flutter/material.dart';

import 'package:education_recipe_app/globals.dart' as globals;
import 'package:education_recipe_app/widgets/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: globals.firestore
          .collection('static_categories')
          .orderBy('title')
          .snapshots(),
      builder: (ctx, categoriesSnapshot) {
        if (categoriesSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (categoriesSnapshot.hasData) {
          final categoryDocs = categoriesSnapshot.data.docs;
          return ListView.builder(
            itemCount: categoryDocs.length,
            itemBuilder: (ctx, index) => CategoryItem(
              categoryDocs[index].id,
              categoryDocs[index].data()['title'],
              categoryDocs[index].data()['description'],
              categoryDocs[index].data()['color'],
              categoryDocs[index].data()['recipe_count'],
              categoryDocs[index].data()['image'],
              key: ValueKey(categoryDocs[index].id),
            ),
          );
        }
        if (categoriesSnapshot.hasError) {
          return Column(
            children: [
              Text('ERROR!'),
            ],
          );
        }
        return Center(
          child: Text('No data.'),
        );
      },
    );
  }
}
