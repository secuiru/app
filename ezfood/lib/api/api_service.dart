import 'package:flutter/material.dart';

import 'post.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class Service
{
  Future<List<Post>?> getPosts() async{
    var client = http.Client();

    var uri = Uri.parse('http://localhost:8080/recipe');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      developer.log(json);
      return postFromJson(json);
    }
  }
}