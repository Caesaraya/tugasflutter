import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/calculator_controller.dart';
import 'package:project_pertama_flutter/widget/button.dart';
import 'package:project_pertama_flutter/widget/textfield.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Textfield(
              hint: "angka1",
              controller: calculatorController.txtangka1,
            ),
            Textfield(
              hint: "angka2",
              controller: calculatorController.txtangka2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  textColor: Colors.white,
                  textt: "+",
                  press: calculatorController.tambah,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  textColor: Colors.white,
                  textt: "-",
                  press: calculatorController.kurang,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  textColor: Colors.white,
                  textt: "x",
                  press: calculatorController.kali,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  textColor: Colors.white,
                  textt: "/",
                  press: calculatorController.bagi,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            Obx(() => Text('hasil: ${calculatorController.hasil.value}')),
            const SizedBox(height: 20),
            CustomButton(
              textColor: Colors.white,
              textt: "Clear",
              press: calculatorController.clear,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
