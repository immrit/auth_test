import 'package:auth_test/main.dart';
import 'package:auth_test/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail.dart';

class SolashScreen extends StatefulWidget {
  const SolashScreen({super.key});

  @override
  State<SolashScreen> createState() => _SolashScreenState();
}

class _SolashScreenState extends State<SolashScreen> {
  var token;
  var id;
  getToken() async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString('token');
    id = pref.getString('id');
    print(token);
  }

  @override
  void initState() {
    getToken();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => token == null ? SigninPage() : Detail()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Splashhhh"),
      ),
    );
  }
}
