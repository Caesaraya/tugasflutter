import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
// import 'package:project_pertama_flutter/pages/calculator_page.dart';
import 'package:project_pertama_flutter/routes/pages.dart';
import 'package:project_pertama_flutter/routes/routes.dart';
// import 'package:project_pertama_flutter/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.mainmenu,
      getPages: AppPages.pages,
    );
  }
}
