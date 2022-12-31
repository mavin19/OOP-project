import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendflutter/di/configure.dart';
import 'package:spendflutter/model/spend_record_model.dart';
import 'package:spendflutter/screen/create_record_screen.dart';
import 'package:spendflutter/screen/get_start_screen.dart';
import 'package:spendflutter/screen/login_screen.dart';
import 'package:spendflutter/screen/logout_screeen.dart';
import 'package:spendflutter/service/api_service.dart';

import '../service/api_call_handler.dart';
import '../service/share_pref_service.dart';
import '../components/Constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final SharePrefService sharePrefService = getIt.get();
  final ApiService _apiService = getIt.get();

  @override
  void initState() {
    super.initState();
  }

  Future<List<SpendRecordModel>> getSpendRecordList() {
    final caller = _apiService.getAllSpend(sharePrefService.getId());
    final callHelper = ApiCallHandler(caller);
    return callHelper.execute();
  }

  List<SpendRecordModel> getSpendListbyDate(
      List<SpendRecordModel> record, DateTime currentDate) {
    if (record == null) [];
    return record
        .where((element) =>
            element.createdAt.day == currentDate.day &&
            element.createdAt.month == currentDate.month &&
            element.createdAt.day == currentDate.day)
        .toList();
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
              if (sharePrefService.getId().isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogoutScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetStart(),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: kPrimaryColor,
              size: 35,
            ),
          ),
        ],
      ),
      body: sharePrefService.getId().isNotEmpty
          ? FutureBuilder<List<SpendRecordModel>>(
              future: getSpendRecordList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<SpendRecordModel>> snapShot) {
                if (snapShot.connectionState == ConnectionState.done) {
                  var record = getSpendListbyDate(
                    snapShot.data!,
                    DateTime.now(),
                  );
                  if (record.length == 0) {
                    return _EmptyWidget();
                  }

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 25.0,
                        ),
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 25.0,
                            ),
                            child: Text(
                              "Item",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 25.0,
                            ),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            final res = await getSpendRecordList();
                            record = getSpendListbyDate(res, DateTime.now());
                            setState(() {});
                          },
                          child: ListView.builder(
                            itemCount: record.length,
                            itemBuilder: (_, index) {
                              var item = record[index];
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                          ),
                                          child: Text(
                                            item.item,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                          ),
                                          child: Text(
                                            "\$ ${item.cost}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Colors.black,
                                      indent:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      endIndent:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: Text("error"));
                }
              },
            )
          : _EmptyWidget(),
      floatingActionButton: sharePrefService.getId().isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateRecord(),
                  ),
                );
              },
              backgroundColor: kPrimaryColor,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "There no record yet",
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
