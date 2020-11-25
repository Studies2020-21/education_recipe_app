import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:education_recipe_app/screens/recipe_screen.dart';

class RecipeItem extends StatelessWidget {
  final Key key;
  final String id;
  final String title;
  final String image;
  final String body;
  final String author;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final Color categoryColor;

  RecipeItem(this.id, this.title, this.image, this.body, this.author,
      this.createdAt, this.updatedAt, this.categoryColor,
      {this.key});

  void _selectRecipe(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      RecipeScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'image': image,
        'body': body,
        'author': author,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'color': categoryColor,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () => _selectRecipe(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: image == null
                        ? Container(
                            color: Colors.grey.shade300,
                            height: 200,
                            width: double.infinity,
                            child: Icon(
                              Icons.local_dining,
                              size: 150,
                              color: Colors.white,
                            ),
                          )
                        : Image.network(
                            image,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        title == null ? 'unknown' : title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.cloud_upload),
                        SizedBox(width: 6),
                        Text(createdAt == null ? 'unknown' : 'added ' + DateFormat('dd.MM.yyyy').format(createdAt.toDate())),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 6),
                        Text(author == null ? 'by unknown' : 'by ' + author),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
