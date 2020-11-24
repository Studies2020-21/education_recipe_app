import 'package:flutter/material.dart';

import 'package:education_recipe_app/screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
  final Key key;
  final String id;
  final String title;
  final String description;
  final String color;
  final int countRecipes;
  final String image;

  CategoryItem(this.id, this.title, this.description, this.color, this.countRecipes, this.image, {this.key});

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _selectCategory(context),
        child: Ink(
          decoration: BoxDecoration(
            color: getColorFromHex(color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.local_dining,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),

                          Text(
                            '${countRecipes.toString()} ' + (countRecipes == 1 ? 'Recipe' : 'Recipes'),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 150,
                height: 200,
                child: AspectRatio(
                  aspectRatio: 0.71,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}
