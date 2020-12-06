import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import 'package:education_recipe_app/main.dart';
import 'package:education_recipe_app/screens/about_screen.dart';
import 'package:education_recipe_app/screens/commit_log_screen.dart';
import 'package:education_recipe_app/widgets/app_drawer.dart';
import 'package:education_recipe_app/widgets/recipe_item.dart';

void main() async {
  // Populate the mock database
  final firestore = MockFirestoreInstance();
  await firestore.collection('static_categories').doc('Pizza').set({
    'title': 'Pizza',
    'description': 'Hmmm, Pizza!!!',
    'color': '#D82D40',
    'recipe_count': 3,
  });
  await firestore
      .collection('static_categories')
      .doc('Pizza')
      .collection('recipes')
      .add({
    'title': 'Salami',
    'body': 'Tolles Rezept für Salami Pizza...',
    'createdAt': DateTime(2020, 1, 1),
    'author': 'Simon Sample',
  });
  await firestore
      .collection('static_categories')
      .doc('Pizza')
      .collection('recipes')
      .add({
    'title': 'Funghi',
    'body': 'Tolles Rezept für Champignon Pizza...',
    'createdAt': DateTime(2020, 2, 2),
    'author': 'Simon Sample',
  });
  await firestore
      .collection('static_categories')
      .doc('Pizza')
      .collection('recipes')
      .add({
    'title': 'Thuna',
    'body': 'Tolles Rezept für Thunfisch Pizza...',
    'createdAt': DateTime(2020, 3, 3),
    'author': 'Simon Sample',
  });

  group('Main Layout', () {
    testWidgets('App has an initial headline', (WidgetTester tester) async {
      await tester.pumpWidget(EducationRecipeApp(firestore: firestore));

      // Create the finder
      final headlineFinder = find.text('Educational Recipes');

      // Verify that the text widget appears exactly once in the widget tree
      expect(headlineFinder, findsOneWidget);
    });

    testWidgets('Drawer/Menu is working', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: AppDrawer(),
          ),
        ),
      );

      scaffoldKey.currentState.openDrawer();
      await tester.pump();

      expect(find.text('Menu'), findsOneWidget);
      expect(find.text('Recipes'), findsOneWidget);
      expect(find.text('Commit Log'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('About Screen is working', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AboutScreen(),
        ),
      );
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('Commit Log Screen is working', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CommitLogScreen(),
        ),
      );
      expect(find.text('Commit Log'), findsOneWidget);
    });
  });

  group('Firestore', () {
    test('Mock Firestore DB is populated with test data', () async {
      final categoriesSnapshot =
      await firestore.collection('static_categories').get();
      expect(categoriesSnapshot.docs.length, 1);
      expect(categoriesSnapshot.docs.first.id, 'Pizza');
      expect(categoriesSnapshot.docs.first.data()['title'], 'Pizza');

      final recipesSnapshot = await firestore
          .collection('static_categories')
          .doc('Pizza')
          .collection('recipes')
          .get();
      expect(recipesSnapshot.docs.length, 3);
      expect(recipesSnapshot.docs.first.data()['title'], 'Salami');
    });

    testWidgets('Categories Screen shows list of categories',
            (WidgetTester tester) async {
          await tester.pumpWidget(EducationRecipeApp(firestore: firestore));
          await tester.idle();
          await tester.pump();

          expect(find.text('Pizza'), findsOneWidget);
        });

    testWidgets('Recipe Item gets rendered', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecipeItem(
              'id',
              'Title of the recipe',
              null,
              'Body Text',
              'markdown',
              'Author',
              Timestamp.now(),
              Timestamp.now(),
              Color(0xff00ff00),
            ),
          ),
        ),
      );
      expect(find.text('Title of the recipe'), findsOneWidget);
    });

    // more tests might follow...
  });
}
