import 'package:auth_test/remote/pocketbaseRemote.dart';
import 'package:auth_test/screens/detail.dart';
import 'package:flutter/material.dart';
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
    await prefs.setString('id', pb.authStore.model.id);
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
              child: const Text('ثبت نام'),
              onPressed: () {
                signIn(username.text, pass.text, context);
                storetheToken();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _validateCredentials() {
    if (username.text.isEmpty) {
      return false;
    }
    if (pass.text.isEmpty) {
      return false;
    }

    // بررسی اطلاعات با پایگاه داده

    return true;
  }
}
