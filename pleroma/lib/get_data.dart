import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

//Create 'POST' class

class Post {
  final String post_id;
  // final String description;
  // final double longitude;
  // final double latitude;

  const Post({
    required this.post_id,
    // required this.description,
    // required this.longitude,
    // required this.latitude,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      post_id: json['post_id'],
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/posts/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Post');
  }
}
