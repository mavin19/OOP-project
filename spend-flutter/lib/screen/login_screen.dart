import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spendflutter/helper/api_helper.dart';
import 'package:spendflutter/model/login_model_req.dart';
import 'package:spendflutter/screen/home_screen.dart';

import '../components/Constant.dart';
import '../components/PrimaryButton.dart';
import '../di/configure.dart';
import '../service/api_service.dart';
import '../components/PasswordInputField.dart';
import '../components/RoundInput.dart';
import '../service/api_call_handler.dart';
import '../service/error_throwable.dart';
import '../service/share_pref_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final SharePrefService sharePrefService = getIt.get();

  void login(context) async {
    final ApiService _apiService = ApiHelper.getApiService();

    final loginReq = LoginModelReq(
      emailController.text,
      passwordController.text,
    );
    final caller = _apiService.login(loginReq);
    final callHelper = ApiCallHandler(caller);
    try {
      final response = await callHelper.execute();
      sharePrefService.setId(response.id.toString());
      sharePrefService.setUsername(response.name);
      sharePrefService.setEmail(response.email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      if (e is ErrorThrowable) {
        if (e.code == HttpStatus.forbidden) {
          final snackBar = SnackBar(
            content: Text("Invalid credential"),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          debugPrint("ERROR ${e.message}");
        } else {
          final snackBar = SnackBar(
            content: Text("System Error"),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          debugPrint("ERROR ${e.message}");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Sign in",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: inputBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Center(
                      child: SvgPicture.asset("asset/image/register_logo.svg"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "Enter your email and password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundInput(
                      hintText: "Enter your email",
                      controller: emailController,
                      onChanged: (val) {},
                      type: TextInputType.text,
                      color: Colors.black,
                    ),
                    PasswordInputField(
                      hideText: "Password",
                      onChanged: (val) {},
                      onPress: () {},
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      text: 'Sign in',
                      press: () {
                        login(context);
                      },
                      color: kPrimaryColor,
                      textColor: inputBackgroundColor,
                      borderColor: kPrimaryColor,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
