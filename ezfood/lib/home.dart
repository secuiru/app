import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart' // new
    hide EmailAuthProvider, PhoneAuthProvider;    // new
import 'package:provider/provider.dart';          // new

import 'app_state.dart';     
import 'recipes.dart';                         // new
import 'src/authentication.dart';                 // new
import 'src/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) {
            if (appState.loggedIn) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header('Recipes'),
                  Expanded(
                    child: Recipes(recipesList: appState.publicRecipes),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Please log in to see your recipes'),
              );
            }
          },
        ),
      ),
    );
  }
}
