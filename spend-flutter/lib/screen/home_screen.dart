import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendflutter/di/configure.dart';
import 'package:spendflutter/screen/get_start_screen.dart';
import 'package:spendflutter/screen/login_screen.dart';
import 'package:spendflutter/service/api_service.dart';

import '../service/share_pref_service.dart';
import '../components/Constant.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  void initState() {
    test();
    super.initState();
  }
  void test() async {
    print("base url ${ getIt.get<String>()}");
    final ApiService sharePrefService = getIt.get();
    print("API $sharePrefService");
    final SharePrefService v = getIt.get();
    print("SH $v ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 14.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Spend Record App",
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GetStart(),
                ),
              );
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
