import 'package:flutter/material.dart';
import 'package:spendflutter/di/configure.dart';
import 'package:spendflutter/screen/home_screen.dart';
import 'package:spendflutter/screen/login_screen.dart';
import 'package:spendflutter/service/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // initialRoute: '/',
      home: HomeScreen(),
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/login': (context) => LoginScreen(),
      // },
    );
  }
}

