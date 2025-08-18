import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_controller.dart';
import 'package:project_pertama_flutter/widget/textfield.dart';
import 'package:project_pertama_flutter/widget/button.dart';

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
            Textfield(hint: 'name', controller: nameController),
            Textfield(hint: 'position', controller: positionController),
            TextField(
              controller: numberController,
              decoration: InputDecoration(hintText: 'Number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            CustomButton(
              textColor: Colors.purple,
              textt: 'Save',
              color: Colors.white,
              press: () {
                footballController.players[playerIndex] = player.copyWith(
                  name: nameController.text,
                  position: positionController.text,
                  number: int.tryParse(numberController.text) ?? player.number,
                );
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
