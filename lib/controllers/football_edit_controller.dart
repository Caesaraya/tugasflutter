import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_controller.dart';

class FootballEditController extends GetxController {
  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final numberController = TextEditingController();
  final imageUrlController = TextEditingController();

  late int playerIndex;
  late Player player;

  final footballController = Get.find<FootballController>();

  @override
  void onInit() {
    super.onInit();
    playerIndex = Get.arguments as int;
    player = footballController.players[playerIndex];

    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();
    imageUrlController.text = player.profileImage;
  }

  void saveChanges() {
    footballController.players[playerIndex] = player.copyWith(
      name: nameController.text,
      position: positionController.text,
      number: int.tryParse(numberController.text) ?? player.number,
      profileImage: imageUrlController.text,
    );
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    positionController.dispose();
    numberController.dispose();
    imageUrlController.dispose();
    super.onClose();
  }
}
