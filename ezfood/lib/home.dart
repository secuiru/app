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
      appBar: AppBar(
        title: const Text('API in use for showing recipes'),
        
      ),
      body: ListView(

              padding: const EdgeInsets.all(6),
  
              children:<Widget>[
                
                
          
             
              const Header("header"),
                const Paragraph(
<<<<<<< HEAD
             '-----',
=======
             'lisää resepti',
>>>>>>> 24121a2d1a0d4b946bc79e55d5ed2514aa1ab8d6
               ),
      
                Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loggedIn) ...[
<<<<<<< HEAD
                  const Header('Recipes'),
                  recipes(
                    addingrecipe: (name,materials,instructions) => 
                        appState.addRecipe(name,materials,instructions),
                        recipeslist: appState.publicRecipes
=======
                  const Header('Discussion'),
                  recipes(
                    addingrecipe: (name,materials,instructions) => 
                        appState.addRecipe(name,materials,instructions)
>>>>>>> 24121a2d1a0d4b946bc79e55d5ed2514aa1ab8d6
                  ),
                ],
              ],
            ),
          ),
              ],
              ),
            );
          }
    
  }

