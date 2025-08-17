import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_controller.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballController footballController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int playerIndex = Get.arguments;
    final player = footballController.players[playerIndex];

    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Player')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(player.profileImage),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: positionController,
              decoration: const InputDecoration(labelText: 'Position'),
            ),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(labelText: 'Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                footballController.players[playerIndex] = player.copyWith(
                  name: nameController.text,
                  position: positionController.text,
                  number: int.tryParse(numberController.text) ?? player.number,
                );
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
