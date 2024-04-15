import 'package:auth_test/remote/pocketbaseRemote.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninPage extends StatefulWidget {
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController username = TextEditingController();

  // TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  storetheToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', pb.authStore.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ورود'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'نام کاربری',
              ),
            ),
            // TextField(
            //   controller: email,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'ایمیل',
            //   ),
            // ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: pass,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'رمز عبور',
              ),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('ورود'),
              onPressed: () async {
                signIn(username.text, pass.text, context);
                storetheToken();
                var box = await Hive.openBox('userBox');
                box.add(user.username);
                final usersss = box.get(user);
                print("/\/\/\/\/\/\/\/");
                print(usersss);
                print("/\/\/\/\/\/\/\/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
