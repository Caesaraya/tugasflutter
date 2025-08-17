import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_pertama_flutter/pages/calculator_page.dart';
import 'package:project_pertama_flutter/pages/football_edit_page.dart';
import 'package:project_pertama_flutter/pages/football_pages.dart';
import 'package:project_pertama_flutter/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(hasil: ''),
    ),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPages()),
    GetPage(
      name: AppRoutes.footballeditplayers,
      page: () => FootballEditPage(),
    ),
  ];
}
