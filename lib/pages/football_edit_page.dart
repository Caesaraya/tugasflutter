import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_controller.dart';
import 'package:project_pertama_flutter/widget/button.dart';
import 'package:project_pertama_flutter/widget/textfield.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballController footballController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int playerIndex = Get.arguments;
    final player = footballController.players[playerIndex];

    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Player')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Textfield(hint: 'name', controller: nameController),
            Textfield(hint: 'position', controller: positionController),
            TextField(
              controller: numberController,
              decoration: InputDecoration(hintText: 'Number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            CustomButton(
              textColor: Colors.white,
              textt: 'Save',
              color: Colors.purple,
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
