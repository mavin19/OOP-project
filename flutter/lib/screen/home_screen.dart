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
  final ApiService _apiService = getIt.get();

  final SharePrefService sharePrefService = getIt.get();

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
      body: FutureBuilder<ProjectListReq>(
        // future: getProjectList(),
        builder:
            (BuildContext context, AsyncSnapshot<ProjectListReq> snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            // var projects = getProjectListByUsername(
            //     snapShot.data!.data, sharePrefService.getUsername());
            print(sharePrefService.getUsername());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 24.0,
                  ),
                  child: Text(
                    "Project",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Expanded(
                //   child: RefreshIndicator(
                //     onRefresh: () async {
                //       // final res = await getProjectList();
                //       // projects = getProjectListByUsername(
                //       //     res.data, sharePrefService.getUsername());
                //       // setState(() {});
                //     },
                //     child: ListView.builder(
                //       itemCount: projects.length,
                //       itemBuilder: (_, index) {
                //         final project = projects[index];
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             children: [
                //
                //             ],
                //           )
                //         );
                //       },
                //     ),
                //   ),
                // )
              ],
            );
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
      floatingActionButton: sharePrefService.getRole() == "manager"
          ? FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      )
          : null,
    );
  }
}
