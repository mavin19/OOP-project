import 'package:flutter/material.dart';

import '../Components/Constant.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';
import '../model/project_list_req.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // final ApiService _apiService = getIt.get();
    final SharePrefService sharePrefService = getIt.get();
    print("V ${sharePrefService}");
    super.initState();
  }

  // Future<ProjectListReq> getProjectList() {
  //   final caller = _apiService.getProject();
  //   final callHelper = ApiCallHandler(caller);
  //   return callHelper.execute();
  // }
  //
  // List<ProjectDataReq> getProjectListByUsername(
  //     List<ProjectDataReq>? project, String username) {
  //   if (project == null) return [];
  //   return project
  //       .where((element) =>
  //   element.attributes.assignee == username ||
  //       element.attributes.project_manager == username ||
  //       sharePrefService.getRole() == "developer").map((item) => item)
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello')
    );
  }
}
