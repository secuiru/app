import 'dart:async';

import 'package:flutter/material.dart';

import 'src/widgets.dart';

class recipes extends StatefulWidget {
  const recipes({required this.addingrecipe, super.key});

  final FutureOr<void> Function(String name, String materials,String instructions) addingrecipe;

  @override
  State<recipes> createState() => _recipesBookState();
}

class _recipesBookState extends State<recipes> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_recipesBookState');

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
    final _controller3 = TextEditingController();

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
            Container(
              
              
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter name';
                  }
                  return null;
                },
              ),
            ),
            TextFormField(
                controller: _controller2,
                decoration: const InputDecoration(
                  hintText: 'Materials',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter needed Materials';
                  }
                  return null;
                },
              ),
               TextFormField(
                controller: _controller3,
                decoration: const InputDecoration(
                  hintText: 'instructions',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter instructions';
                  }
                  return null;
                },
              ),
            const SizedBox(width: 8),
            StyledButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await widget.addingrecipe(_controller.text, _controller2.text,_controller3.text);
            
                  _controller.clear();
                  _controller2.clear();
                  _controller3.clear();
                }
              },
              child: Row(
                children: const [
                  Icon(Icons.send),
                  SizedBox(width: 4),
                  Text('Create'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
