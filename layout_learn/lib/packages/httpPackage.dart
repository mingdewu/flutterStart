import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class PostHttpClient{
  static const _url ='https://jsonplaceholder.typicode.com';

  Future<Post> fetch() async {
    try {
      final response = await http.get(Uri.parse('$_url/posts/1'));
      final responseJson = json.decode(response.body);

      return Post.fromJson(responseJson);
    } on Exception catch (e){
      print(e);
      rethrow;
    }
  }
}

class Post {
  final String title;
  Post({required this.title});

  factory Post.fromJson(Map<String,dynamic> json) => Post(
    title:  json["title"],
  );

  Map<String,dynamic> toJson() => {
    "title" : title,
  };

}