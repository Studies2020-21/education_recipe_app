import 'package:flutter/material.dart';

import 'package:education_recipe_app/widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child:
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A detailed description to this app will follow...'),
              SizedBox(height: 15),
              Text('With info for contributing...'),
            ],
          ),
        ),
      ),
    );
  }
}
