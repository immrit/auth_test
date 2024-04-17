import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/detail.dart';

final pb = PocketBase('http://10.0.2.2:8089');

Future<void> signUp(
  String username,
  String email,
  String pass,
  String passConf,
) async {
  final body = <String, dynamic>{
    "username": username,
    "email": email,
    "password": pass,
    "passwordConfirm": passConf,
  };
  final record = await pb.collection('users').create(body: body);
  print(record);
}

class User {
  String username;
  String email;
  String name;
  User({
    required this.username,
    required this.email,
    required this.name,
  });
  factory User.fromRecordModel(RecordModel recordModel) {
    Map<String, dynamic> json = recordModel.toJson();
    return User(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'name': name,
    };
  }

  // Deserialize User object from Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

Future<void> signIn(String username, String pass, BuildContext context) async {
  try {
    await pb.collection('users').authWithPassword(username, pass);
    RecordModel recordModel = pb.authStore.model;
    User user = User.fromRecordModel(recordModel);
    print(user.username);
    print(user.email);
    print(user.name);
    print(pb.authStore.model);
    var token = pb.authStore.token;
    print('token:  $token');
    print(pb.authStore.isValid);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Detail()));
  } catch (e) {
    print(e);
  }
}
