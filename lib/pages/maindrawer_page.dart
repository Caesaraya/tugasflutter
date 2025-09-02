import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/nav_draw_controller.dart';
import 'package:project_pertama_flutter/pages/calculator_page.dart';
import 'package:project_pertama_flutter/pages/football_pages.dart';
import 'package:project_pertama_flutter/pages/Profile_page.dart';

class MaindrawerPage extends StatelessWidget {
  const MaindrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController(),
    );

    final pages = [
      Center(child: Text("Ini Halaman Home")), // index 0
      CalculatorPage(), // index 1
      FootballPages(), // index 2
      ProfilePage(), // index 3
    ];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text("")),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text("Caesaraya"),
                accountEmail: Text("caesaraya@email.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("asset/person.png"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                selected: navigationController.currentIndex.value == 0,
                onTap: () {
                  navigationController.changeIndex(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text("Calculator"),
                selected: navigationController.currentIndex.value == 1,
                onTap: () {
                  navigationController.changeIndex(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.sports_soccer),
                title: const Text("Football"),
                selected: navigationController.currentIndex.value == 2,
                onTap: () {
                  navigationController.changeIndex(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                selected: navigationController.currentIndex.value == 3,
                onTap: () {
                  navigationController.changeIndex(3);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: navigationController.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: (index) => navigationController.changeIndex(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
