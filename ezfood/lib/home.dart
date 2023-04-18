import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new
import 'package:provider/provider.dart'; // new
import 'package:easy_search_bar/easy_search_bar.dart';
import 'app_state.dart';
import 'recipes.dart'; // new


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchValue='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
            appBar: EasySearchBar(
        title: const Text('search recipes'),
          onSearch: (value) => setState(() => searchValue = value)),
         body: Padding(
          
        padding: const EdgeInsets.all(6),
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) {
            if (appState.loggedIn) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Expanded(
                    child: Recipes(
                        recipesList: appState.publicRecipes
                            .where((recipesList) => recipesList.name
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()))
                            .toList()),
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




