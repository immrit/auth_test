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

Future<void> signIn(String username, String pass, BuildContext context) async {
  Map<String, dynamic> body = {};
  final authData = await pb
      .collection('users')
      .authWithPassword(username, pass, fields: '?fields=*', body: body);
  print("==============================");
  print(body);
  // Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (context) => Detail())));
}

// Future<RecordModel> users(String? idb) async {
//   final String id = pb.authStore.model.id;
//   idb = id;
//   print("id users= $id");
//   final record = await pb.collection('users').getOne(id);
//   final username = record.getDataValue<String>('username');
//   print("users cons $record");
//   return record;
// }
