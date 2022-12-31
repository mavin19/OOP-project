import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendflutter/Service/api_service.dart';
import 'package:spendflutter/screen/login_screen.dart';

import '../Service/share_pref_service.dart';
import '../components/Constant.dart';
import '../di/configure.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  void initState() {
    test();
    super.initState();
  }
  void test() async {
    final SharePrefService sharePrefService = getIt.get();
    print("SHARE $sharePrefService");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 14.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Report App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: kPrimaryColor,
              size: 35,
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
