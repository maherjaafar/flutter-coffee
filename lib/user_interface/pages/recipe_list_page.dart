import 'package:flutter/material.dart';
import 'package:flutter_coffee/core/models/recipe.dart';
import 'package:flutter_coffee/core/services/recipe_service.dart';
import 'package:flutter_coffee/user_interface/configuration/configuration.dart';
import 'package:flutter_coffee/user_interface/shared/widgets/widgets.dart';

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
        child: FutureBuilder<List<Recipe>>(
            future: RecipeServiceRepositoryImplemetaion().loadRecipes(),
            initialData: <Recipe>[],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final data = snapshot.data!;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth;
                    final itemCount = data.length;
                    if (maxWidth < 600)
                      return ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (context, index) =>
                            _itemBuilder(context, data[index]),
                      );
                    else
                      return Container(
                        width: maxWidth,
                        height: constraints.maxHeight,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (context, index) =>
                              _itemBuilder(context, data[index]),
                          itemCount: itemCount,
                        ),
                      );
                  },
                );
              } else
                return CenteredProgressIndicator();
            }),
      ),
    );
  }

  Widget _itemBuilder(context, Recipe recipeItem) {
    return buildRecipeCard(recipeItem);
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
                bottom: 5,
                left: 5,
                child: Container(
                  width: 270,
                  margin: EdgeInsets.all(4.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    recipe.label,
                    softWrap: true,
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
