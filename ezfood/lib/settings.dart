import 'package:ezfood/recipes.dart';
import 'package:ezfood/src/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipesdelete.dart';
import 'app_state.dart';
import 'src/widgets.dart';

class settings extends StatefulWidget {
  const settings({super.key});
  

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: <Widget>[
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
              loggedIn: appState.loggedIn,
              signOut: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
          const Header('Delete Recipe'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loggedIn) ...[
                    RecipesDelete(
                      deletingRecipe: appState.deleteRecipe,
                      recipeslist: appState.publicRecipes,
                    )
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
