import 'package:auth_test/main.dart';
import 'package:auth_test/model/UserModel.dart';
import 'package:auth_test/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../remote/pocketbaseRemote.dart';

class Detail extends StatefulWidget {
  final UserModel? userModel;

  const Detail({Key? key, this.userModel}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<Detail> {
  // late User _user;
  late UserModel _model;
  removeToken() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.remove('token');
    final box = HiveGetData.getUserModel();
    box.delete('user');
  }

  @override
  void initState() {
    super.initState();
    if (widget.userModel != null) {
      _model = widget.userModel!;
    } else {
      _model =
          UserModel(username: '', email: ''); // Initialize with default values
      _getUserData();
    }
  }

  _getUserData() async {
    final box = HiveGetData.getUserModel();
    var userData = box.get('user');

    if (userData != null) {
      setState(() {
        _model = userData;
      });
    } else {
      // Handle the case where user data is null
      print("user data is null");
      // For example, you can show an error message or navigate back
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: _model != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username: ${_model.username}'),
                  Text('Email: ${_model.email}'),
                  FloatingActionButton(onPressed: () {
                    removeToken();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
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
