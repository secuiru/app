import 'dart:async';
import 'publicrecipes.dart';
import 'package:flutter/material.dart';

import 'src/widgets.dart';

class recipes extends StatefulWidget {
  const recipes({super.key, required this.recipeslist});

  final List<PublicRecipe> recipeslist;
  @override
  State<recipes> createState() => _recipesBookState();
}

class _recipesBookState extends State<recipes> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_recipesBookState');

  /*Widget _buildName() {
    return null;
  }
Widget _buildMaterials() {
    return null;
  }*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            for (var recipe in widget.recipeslist)
              Paragraph('nimi: ${recipe.name}\n tarvikkeet: ${recipe.materials}\n ohje: ${recipe.instructions}'),
          ],
        ),
      ),
    );
  }
}
