import 'package:get/get.dart';
import 'package:project_pertama_flutter/pages/calculator_page.dart';
import 'package:project_pertama_flutter/pages/football_edit_page.dart';
import 'package:project_pertama_flutter/pages/football_pages.dart';
import 'package:project_pertama_flutter/routes/routes.dart';
import 'package:project_pertama_flutter/pages/Profile_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(hasil: ''),
    ),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPages()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
    GetPage(
      name: AppRoutes.footballeditplayers,
      page: () => FootballEditPage(),
    ),
  ];
}
