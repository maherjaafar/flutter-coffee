import 'package:flutter/material.dart';
import 'package:flutter_coffee/user_interface/configuration/configuration.dart';
import 'package:flutter_coffee/user_interface/pages/recipe_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light(),
      home: RecipeListPage(),
    );
  }
}
