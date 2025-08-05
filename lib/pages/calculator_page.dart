import 'package:flutter/material.dart';
import 'package:project_pertama_flutter/widget/button.dart';
import 'package:project_pertama_flutter/widget/textfield.dart';
import 'package:project_pertama_flutter/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  final String hasil;
  CalculatorPage({super.key, required this.hasil});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Container(
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    textColor: Colors.white,
                    textt: "+",
                    press: calculatorController.tambah,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    textColor: Colors.white,
                    textt: "-",
                    press: calculatorController.kurang,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    textColor: Colors.white,
                    textt: "x",
                    press: calculatorController.kali,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    textColor: Colors.white,
                    textt: "/",
                    press: calculatorController.bagi,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            Obx(() {
              return Text(
                'hasil: ' + calculatorController.hasil.value.toString(),
              );
            }),
            SizedBox(height: 20),
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
