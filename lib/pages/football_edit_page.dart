import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/football_controller.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballController footballController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Ambil index player dari arguments
    final int playerIndex = Get.arguments;
    final player = footballController.players[playerIndex];

    // Isi form dengan data lama
    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();
    imageUrlController.text = player.profileImage;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Player')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Preview gambar dari URL
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrlController.text),
            ),
            const SizedBox(height: 10),

            // TextField URL Gambar
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
              onChanged: (value) {
                // Update preview ketika mengetik URL baru
                // Pakai setState kalau StatefulWidget, atau biarkan preview update setelah save
              },
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
                  profileImage: imageUrlController.text,
                  name: nameController.text,
                  position: positionController.text,
                  number: int.tryParse(numberController.text) ?? player.number,
                );
                Get.back(); // kembali ke list page
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
