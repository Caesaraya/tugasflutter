import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pertama_flutter/controllers/calculator_controller.dart';
import 'package:project_pertama_flutter/routes/routes.dart';
import 'package:project_pertama_flutter/widget/button.dart';
import 'package:project_pertama_flutter/widget/textfield.dart';

class CalculatorPage extends StatelessWidget {
  final String hasil;
  CalculatorPage({super.key, required this.hasil});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: _calculatorBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

  Widget _calculatorBody() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Textfield(hint: "angka1", controller: calculatorController.txtangka1),
          Textfield(hint: "angka2", controller: calculatorController.txtangka2),
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
          Obx(() {
            return Text('hasil: ${calculatorController.hasil.value}');
          }),
          const SizedBox(height: 20),
          CustomButton(
            textColor: Colors.white,
            textt: "Clear",
            press: calculatorController.clear,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
