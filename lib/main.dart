import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'globals.dart' as globals;
import 'package:education_recipe_app/helpers/page_transitions_slide_in.dart';
import 'package:education_recipe_app/screens/about_screen.dart';
import 'package:education_recipe_app/screens/commit_log_screen.dart';
import 'package:education_recipe_app/screens/categories_screen.dart';
import 'package:education_recipe_app/screens/category_screen.dart';
import 'package:education_recipe_app/screens/recipe_screen.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp();
  final FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: app);
  runApp(EducationRecipeApp(firestore: firestore));
}

class EducationRecipeApp extends StatelessWidget {
  EducationRecipeApp({this.firestore});

  final FirebaseFirestore firestore;

  @override
  Widget build(BuildContext context) {
    globals.firestore = firestore;

    // Disable landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

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
            home: CategoriesScreen(),
            routes: {
              CommitLogScreen.routeName: (ctx) => CommitLogScreen(),
              AboutScreen.routeName: (ctx) => AboutScreen(),
            },
            onGenerateRoute: _onGenerateRoute,
          ),
        ),
      ),
    );
  }

  // Routes that use a special page transition need to be registered in _onGenerateRoute
  static Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/category':
        return PageTransitionsSlideIn(builder: (context) => CategoryScreen(), settings: settings);
      case '/recipe-detail':
        return PageTransitionsSlideIn(builder: (context) => RecipeScreen(), settings: settings);
    }
    throw UnsupportedError('Unknown route: ${settings.name}');
  }
}
