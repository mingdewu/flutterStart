import 'package:flutter/foundation.dart';

class User {
  String get id => _id;
  String username = "";
  String photoUrl = "";
  String _id = "";
  bool active = true;
  DateTime lastseen = DateTime.now();

  User({
    required String username,
    required String photoUrl,
    required bool active,
    required DateTime lastseen,
  });
  toJson() => {
        'username': username,
        'photo_url': photoUrl,
        'active': active,
        'last_seen': lastseen
      };

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
        username: json['username'],
        photoUrl: json['photo_url'],
        active: json['activate'],
        lastseen: json['last_seen']);
    user._id = json['id'];
    return user;
  }
}
