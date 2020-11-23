import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:education_recipe_app/screens/loading_screen.dart';
import 'package:education_recipe_app/screens/categories_screen.dart';
import 'package:education_recipe_app/screens/commit_log_screen.dart';
import 'package:education_recipe_app/screens/about_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Disable landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Initialize Firebase
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return Container(
            color: Colors.grey.shade300,
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 500),
                child: MaterialApp(
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    // We apply this to our appBarTheme because most of our appBar have this style
                    appBarTheme: AppBarTheme(
                      color: Colors.white,
                      textTheme: ThemeData.light().textTheme.copyWith(
                        headline6: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      iconTheme: IconThemeData(color: Colors.black),
                      elevation: 0,
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  home: appSnapshot.connectionState != ConnectionState.done
                      ? LoadingScreen()
                      : CategoriesScreen(),
                  routes: {
                    CommitLogScreen.routeName: (ctx) => CommitLogScreen(),
                    AboutScreen.routeName: (ctx) => AboutScreen(),
                  },
                ),
              ),
            ),
          );
        });
  }
}
