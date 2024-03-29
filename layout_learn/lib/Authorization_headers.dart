import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
final response = await http.get(
Uri.parse('https://jsonlaceholder.typicode.com/album/1'),
headers:{
  HttpHeaders.authorizationHeader:'B token',
},
);

Future<Album> fetchAlbum() async{
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    },
  );
  final responseJson = jsonDecode(response.body);

  return Album.fromJson(responseJson);
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
});

  factory Album.formJson(Map<String,dynamic> json){
    return Album(
      userId: json['userId'],
      id: json['id'],
      title:json['title'],
    )
  }
}