import 'package:auth_test/model/dataModel.dart';
import 'package:auth_test/remote/pocketbaseRemote.dart';
import 'package:auth_test/screens/signin.dart';
import 'package:dio/dio.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("A"),
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

  Future<List<DataModel>> fetchuser() async {
    try {
      Dio dio = Dio();
      final response = await dio.get(
          'http://127.0.0.1:8089/api/collections/users/records/:8sfd4cirha5l0fu',
          queryParameters: {'fields': 'username'});

      if (response.statusCode == 200) {
        List<dynamic> JsonItem = response.data['items'] as List;
        List<DataModel> dataList =
            JsonItem.map((e) => DataModel.fromMapJson(e)).toList();
        return dataList;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
