import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_coffee/core/models/Recipe.dart';
import 'package:flutter_coffee/user_interface/configuration/configuration.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: Recipe.recipes.length,
          itemBuilder: (context, index) {
            return buildRecipeCard(Recipe.recipes[index]);
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Image.network(recipe.imageUrl!),
            const SizedBox(height: 14),
            Container(
              margin: EdgeInsets.all(4.0),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Text(
                recipe.label,
                style: AppTheme.lightTextTheme.headline6!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
