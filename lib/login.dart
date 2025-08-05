import 'package:flutter/material.dart';
import 'package:project_pertama_flutter/home.dart';
import 'package:project_pertama_flutter/register.dart';
import 'widget/textfield.dart';
import 'widget/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController Username = TextEditingController();
  final TextEditingController Password = TextEditingController();

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  void _login() {
    final username = Username.text;
    final password = Password.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("⚠️ Username dan password wajib diisi"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
    } else if (username == 'raya' && password == '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("✅ Login berhasil!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌ Username atau password salah"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
      Password.clear();
      Username.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/rus.png", width: 100, height: 100),
            Text(
              "Welcome to first App",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blueAccent[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Textfield(hint: "Username", controller: Username),
            SizedBox(height: 20),
            Textfield(hint: "Password", controller: Password, isPassword: true),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CustomButton(
                    color: Colors.blueAccent,
                    press: _login,
                    textt: "login",
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text("atau"),
                const SizedBox(width: 10),
                Container(
                  child: CustomButton(
                    color: Colors.blueAccent,
                    press: _register,
                    textt: "Register",
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
