import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spendflutter/model/spend_record_model_req.dart';
import 'package:spendflutter/screen/home_screen.dart';

import '../components/Constant.dart';
import '../components/PrimaryButton.dart';
import '../components/RoundInput.dart';
import '../di/configure.dart';
import '../service/api_call_handler.dart';
import '../service/api_service.dart';
import '../service/error_throwable.dart';
import '../service/share_pref_service.dart';

class CreateRecord extends StatefulWidget {
  _CreateRecord createState() => _CreateRecord();
}

class _CreateRecord extends State<CreateRecord> {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();

  void createRecord(context) async {
    final createRecord = SpendRecordModelReq(
      itemController.text,
      priceController.text,
    );

    final caller =
        _apiService.createSpend(sharePrefService.getId(), createRecord);
    final callHelper = ApiCallHandler(caller);
    try {
      final response = await callHelper.execute();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      if (e is ErrorThrowable) {
        debugPrint("ERROR ${e.message}");
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
          "Create Project",
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
                child: SvgPicture.asset("asset/image/create_project_icon.svg"),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Create Record",
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
                        "Create your record to sum your total spend.",
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
                      hintText: "Items",
                      controller: itemController,
                      onChanged: (val) {},
                      type: TextInputType.text,
                      color: Colors.black,
                    ),
                    RoundInput(
                      hintText: "Price",
                      controller: priceController,
                      onChanged: (val) {},
                      type: TextInputType.number,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      text: 'Submit',
                      press: () async {
                        createRecord(context);
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
