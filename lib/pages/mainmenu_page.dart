import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/bottom_nav_controller.dart';
import 'package:project_pertama_flutter/pages/calculator_page.dart';
import 'package:project_pertama_flutter/pages/football_pages.dart';
import 'package:project_pertama_flutter/pages/profile_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.put(
      BottomNavController(),
    );
    final List<Widget> pages = [
      CalculatorPage(),
      FootballPages(),
      ProfilePage(),
    ];
    return Obx(() {
      return Scaffold(
        body: pages[bottomNavController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavController.currentIndex.value,
          onTap: bottomNavController.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}
