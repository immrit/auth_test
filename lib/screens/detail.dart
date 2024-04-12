import 'package:auth_test/remote/pocketbaseRemote.dart';
import 'package:auth_test/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
  String? user;
  Detail({super.key, this.user});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.user.toString()),
            FloatingActionButton(onPressed: () {
              removeToken();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SigninPage()));
            })
          ],
        ),
      ),
    );
  }
}
