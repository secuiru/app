import 'dart:ui';
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart' // new
    hide EmailAuthProvider, PhoneAuthProvider;    // new
import 'package:provider/provider.dart';          // new

import 'app_state.dart';     
import 'recipes.dart';                         // new
import 'src/authentication.dart';                 // new
import 'src/widgets.dart';
import 'package:ezfood/publicrecipes.dart';
import 'package:flutter/material.dart';

import 'recipedetails.dart';

class Recipes extends StatefulWidget {
  final List<PublicRecipe> recipesList;
  
  const Recipes({Key? key, required this.recipesList}) : super(key: key);
  

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.recipesList.length,
        itemBuilder: (BuildContext context, int index) {
          final recipe = widget.recipesList[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetails(recipe: recipe, key: null,),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipe.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_sharp),
                          onPressed: () {
                            // Handle favorite button press here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}