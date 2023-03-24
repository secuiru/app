// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        required this.recipe,
        required this.recipename,
        required this.instructions,
    });

    String recipe;
    String recipename;
    String instructions;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        recipe: json["recipe"],
        recipename: json["recipename"],
        instructions: json["instructions"],
    );

    Map<String, dynamic> toJson() => {
        "recipe": recipe,
        "recipename": recipename,
        "instructions": instructions,
    };
}
