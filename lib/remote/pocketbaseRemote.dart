import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('http://10.0.2.2:8089/');

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

Future<void> signIn(
  String username,
  String pass,
) async {
  final authData =
      await pb.collection('users').authWithPassword(username, pass);
  print(authData);
}
