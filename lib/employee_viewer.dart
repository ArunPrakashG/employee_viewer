import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/home/home.dart';

class EmployeeViewerApp extends StatelessWidget {
  const EmployeeViewerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employee Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(top: false, child: HomeUI()),
    );
  }
}
