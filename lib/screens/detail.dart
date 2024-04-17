import 'dart:convert';

import 'package:auth_test/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../remote/pocketbaseRemote.dart';

class Detail extends StatefulWidget {
  final User? user;

  const Detail({Key? key, this.user}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<Detail> {
  late User _user;
  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _user = widget.user!;
    } else {
      _user = User(
          username: '', email: '', name: ''); // Initialize with default values
      _getUserData();
    }
  }

  Future<void> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      setState(() {
        _user = User.fromJson(jsonDecode(userData));
      });
    } else {
      // Handle the case where user data is null
      // For example, you can show an error message or navigate back
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: _user != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username: ${_user.username}'),
                  Text('Email: ${_user.email}'),
                  Text('Name: ${_user.name}'),
                  FloatingActionButton(onPressed: () {
                    removeToken();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SigninPage()));
                  })
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}





// import 'package:auth_test/model/dataModel.dart';
// import 'package:auth_test/remote/pocketbaseRemote.dart';
// import 'package:auth_test/screens/signin.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Detail extends StatefulWidget {
//   String? user;
//   Detail({super.key, this.user});
//
//   @override
//   State<Detail> createState() => _DetailState();
// }
//
// class _DetailState extends State<Detail> {
//   removeToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.remove('token');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("A"),
//             FloatingActionButton(onPressed: () {
//               removeToken();
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => SigninPage()));
//             })
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<List<DataModel>> fetchuser() async {
//     try {
//       Dio dio = Dio();
//       final response = await dio.get(
//           'http://127.0.0.1:8089/api/collections/users/records/:8sfd4cirha5l0fu',
//           queryParameters: {'fields': 'username'});
//
//       if (response.statusCode == 200) {
//         List<dynamic> JsonItem = response.data['items'] as List;
//         List<DataModel> dataList =
//             JsonItem.map((e) => DataModel.fromMapJson(e)).toList();
//         return dataList;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return [];
//   }
// }
