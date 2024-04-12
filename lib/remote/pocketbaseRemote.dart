import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/detail.dart';

final pb = PocketBase('http://10.0.2.2:8090');

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

Future<void> signIn(String username, String pass, BuildContext context) async {
  final authData = await pb
      .collection('users')
      .authWithPassword(username, pass)
      .then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Detail(
                    user: users().toString(),
                  ))))
      .then((value) => pb.authStore.model.id);
  print(authData);
}

Future<RecordModel> users() async {
  String id = pb.authStore.model.id;
  print("id users= $id");
  final record = await pb.collection('users').getOne(id, fields: 'username');
  print("users cons $record");
  return record;
}
