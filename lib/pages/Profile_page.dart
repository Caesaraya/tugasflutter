import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'asset/person.png',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Caesaraya",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "11 PPLG 1 - 08",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Get.offAllNamed(AppRoutes.calculator);
          } else if (index == 1) {
            Get.offAllNamed(AppRoutes.footballplayers);
          } else if (index == 2) {
            Get.offAllNamed(AppRoutes.profile);
          }
        },
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
  }
}
