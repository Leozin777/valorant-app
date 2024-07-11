import 'package:flutter/material.dart';
import 'package:valorant_app/views/screens/home_screen.dart';
import 'package:valorant_app/views/tab_bar_personalizada.dart';

import '../../data/service/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Email"),
                controller: _emailController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                controller: _passwordController,
              ),
              FilledButton(
                  onPressed: () async {
                    try {
                      await _authService.register(
                          _emailController.text, _passwordController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabBarPersonalizada()));
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                  child: const Text("Registrar-se"))
            ],
          ),
        ),
      ),
    );
  }
}
