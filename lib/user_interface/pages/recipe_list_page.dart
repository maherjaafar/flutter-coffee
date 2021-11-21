import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final itemCount = Recipe.recipes.length;
            if (maxWidth < 600)
              return ListView.builder(
                itemCount: itemCount,
                itemBuilder: _itemBuilder,
              );
            else
              return Container(
                width: maxWidth,
                height: constraints.maxHeight,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: _itemBuilder,
                  itemCount: itemCount,
                ),
              );
          },
        ),
      ),
    );
  }

  Widget _itemBuilder(context, index) {
    return buildRecipeCard(Recipe.recipes[index]);
  }

  Widget buildRecipeCard(Recipe recipe) {
    return SizedBox(
      height: 350,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.network(
                  recipe.imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
