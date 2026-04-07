import 'dart:convert';

import 'package:flutter_test_state_management/models/post.dart';
import 'package:http/http.dart' as http;
class PostRepository{
  final String _apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(data);
      return data.map((post) => Post(title: post['title'], description: post['body'])).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}