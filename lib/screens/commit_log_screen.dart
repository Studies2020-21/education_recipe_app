import 'package:flutter/material.dart';

import 'package:education_recipe_app/widgets/app_drawer.dart';

class CommitLogScreen extends StatelessWidget {
  static const routeName = '/commit-log';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commit Log'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child:
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('The commit log history is one of the most wanted features of the author ;-)'),
                  SizedBox(height: 15),
                  Text('We\'ll see how this can be implemented, no real plan atm...'),
                ],
              ),
            ),
      ),
    );
  }
}
