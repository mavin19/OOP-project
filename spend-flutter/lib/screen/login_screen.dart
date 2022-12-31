import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spendflutter/model/login_model_req.dart';
import 'package:spendflutter/screen/home_screen.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';
import '../Service/api_service.dart';
import '../Service/share_pref_service.dart';
import '../components/PasswordInputField.dart';
import '../components/RoundInput.dart';
import '../di/configure.dart';
import '../service/api_call_handler.dart';
import '../service/error_throwable.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();

  // void login(context) async {
  //   final loginReq = LoginModelReq(
  //     emailController.text,
  //     passwordController.text,
  //   );
  //   final caller = _apiService.login(loginReq);
  //   final callHelper = ApiCallHandler(caller);
  //   try {
  //     final response = await callHelper.execute();
  //     Navigator.pop(context);
  //   } catch (e) {
  //     if (e is ErrorThrowable) {
  //       final snackBar = SnackBar(
  //         content: Text("System error"),
  //         backgroundColor: Colors.red,
  //       );
  //
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       debugPrint("ERROR ${e.message}");
  //     }
  //   }
  // }

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
                child: SvgPicture.asset("asset/image/register_logo.svg"),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
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
                        // login(context);
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
