import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Components/Constant.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/error_throwable.dart';
import '../Service/share_pref_service.dart';
import '../components/PasswordInputField.dart';
import '../components/PrimaryButton.dart';
import '../components/RoundInput.dart';
import '../di/configure.dart';
import '../model/login_req.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();

  void login(context) async {
    final loginReq = LoginReq(
      LoginDataReq(
        'auth',
        LoginDataAttrReq(
          emailController.text,
          passwordController.text,
        ),
      ),
    );
    // final caller = _apiService.login(loginReq);
    // final callHelper = ApiCallHandler(caller);
    // try {
    //   final response = await callHelper.execute();
    //   await sharePrefService
    //       .setAccessToken(response.data.attributes.accessToken);
    //   await sharePrefService.setRole(response.data.attributes.role);
    //   await sharePrefService.setUsername(response.data.attributes.name);
    //   await sharePrefService.setEmail(response.data.attributes.email);
    //   print(sharePrefService.getAccessToken ());
    // } catch (e) {
    //   if (e is ErrorThrowable) {
    //     final snackBar = SnackBar(
    //       content: Text(e.errorRes?.getConcatError() ?? "System error"),
    //       backgroundColor: Colors.red,
    //     );
    //
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     debugPrint("ERROR ${e.message}");
    //   }
    // }
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
                        "Enter your username email role and \n password",
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
