import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:education_recipe_app/widgets/recipe_item.dart';

class Recipes extends StatelessWidget {
  final String category;

  Recipes(this.category);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('static_categories')
          .doc(category)
          .collection('recipes')
          .orderBy('title')
          .snapshots(),
      builder: (ctx, recipesSnapshot) {
        if (recipesSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (recipesSnapshot.hasData) {
          final recipeDocs = recipesSnapshot.data.docs;
          if (recipeDocs.length > 0) {
            return ListView.builder(
              itemCount: recipeDocs.length,
              itemBuilder: (ctx, index) => RecipeItem(
                recipeDocs[index].id,
                recipeDocs[index].data()['title'],
                recipeDocs[index].data()['image'],
                recipeDocs[index].data()['body'],
                recipeDocs[index].data()['author'],
                recipeDocs[index].data()['createdAt'],
                recipeDocs[index].data()['updatedAt'],
                key: ValueKey(recipeDocs[index].id),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_dining,
                    color: Colors.grey,
                    size: 100,
                  ),
                  Text(
                    'No recipes have been added to this category yet.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
        }
        if (recipesSnapshot.hasError) {
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
