import 'package:auth_test/remote/pocketbaseRemote.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passConf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ثبت نام'),
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
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ایمیل',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: pass,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'رمز عبور',
              ),
            ),
            TextField(
              obscureText: true,
              controller: passConf,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'تایید رمز عبور',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('ثبت نام'),
              onPressed: () {
                signUp(username.text, email.text, pass.text, passConf.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
