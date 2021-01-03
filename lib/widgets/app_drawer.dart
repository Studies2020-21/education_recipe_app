import 'package:flutter/material.dart';

import 'package:education_recipe_app/screens/commit_log_screen.dart';
import 'package:education_recipe_app/screens/about_screen.dart';
import 'package:education_recipe_app/screens/swagger_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.food_bank_outlined),
            title: Text('Recipes'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.compare_arrows_outlined),
            title: Text('swagger.io Demo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SwaggerScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.replay_outlined),
            title: Text('Commit Log'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CommitLogScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
