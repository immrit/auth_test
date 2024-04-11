import 'package:auth_test/remote/pocketbaseRemote.dart';
import 'package:auth_test/screens/detail.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  TextEditingController username = TextEditingController();
  // TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
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
                signIn(username.text, pass.text);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(
                              user: username.text,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
