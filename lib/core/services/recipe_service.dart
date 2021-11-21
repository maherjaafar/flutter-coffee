import 'dart:convert';

import 'package:flutter_coffee/core/models/recipe.dart';
import 'package:http/http.dart' as http;

abstract class RecipeServiceRepository {
  Future<List<Recipe>> loadRecipes();
}

class RecipeServiceRepositoryImplemetaion {
  final _baseUrl = "https://api.edamam.com/api/recipes/v2";
  final _type = 'public';
  final _q = 'chiken';
  final _appKey = '5aee52c56d044dbe2c4fd35c4049bb1a';
  final _appId = '05f5068b';

  Future<List<Recipe>> loadRecipes() async {
    final uri = '$_baseUrl?type=$_type&q=$_q&app_id=$_appId&app_key=$_appKey';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final hintsJson = json.decode(response.body)['hits'];
      final recipesList = <Recipe>[];

      for (final item in hintsJson) {
        final recipe = Recipe.fromJson(item['recipe']);
        recipesList.add(recipe);
      }

      return recipesList;
    } else {
      print(response.statusCode);
      return Recipe.recipes;
    }
  }
}
