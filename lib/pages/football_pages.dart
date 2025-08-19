import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_controller.dart';
import 'package:project_pertama_flutter/routes/routes.dart';

class FootballPages extends StatelessWidget {
  FootballPages({super.key});
  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Players')),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipOval(
                    child: Image.asset(
                      player.profileImage,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: Text(
                    player.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    '${player.position} - #${player.number}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  onTap: () {
                    Get.snackbar(
                      'Player Selected',
                      '${player.name} - ${player.position}',
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.lightBlue,
                      colorText: Colors.white,
                    );
                    Get.toNamed(
                      AppRoutes.footballeditplayers,
                      arguments: index,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
