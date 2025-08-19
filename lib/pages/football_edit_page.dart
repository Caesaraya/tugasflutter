import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_edit_controller.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});
  final editController = Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Player')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                editController.imageUrlController.text,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: editController.imageUrlController,
              decoration: const InputDecoration(hintText: 'Image Path / URL'),
            ),
            TextField(
              controller: editController.nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextField(
              controller: editController.positionController,
              decoration: const InputDecoration(hintText: 'Position'),
            ),
            TextField(
              controller: editController.numberController,
              decoration: const InputDecoration(hintText: 'Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => editController.saveChanges(),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
