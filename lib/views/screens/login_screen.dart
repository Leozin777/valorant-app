import 'package:flutter/material.dart';
import 'package:valorant_app/data/service/auth_service.dart';
import 'package:valorant_app/views/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Container(
          height: 100,
          width: 100,
          color: Colors.transparent,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                height: 400,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(
                      image: NetworkImage(
                          "https://1000logos.net/wp-content/uploads/2022/09/Valorant-Logo-500x281.png",
                          scale: 3),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        controller: _emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: const InputDecoration(
                            labelText: "Senha", border: OutlineInputBorder()),
                        obscureText: true,
                        controller: _passwordController,
                      ),
                    ),
                    FilledButton(
                        onPressed: () {
                          _authService.signIn(
                              _emailController.text, _passwordController.text);
                        },
                        child: const Text("Login")),
                    FilledButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const RegisterScreen(),
                              ));
                        },
                        child: const Text("Registrar-se"))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
