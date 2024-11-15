import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/auth_service.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get auth service
  final _auth = AuthService();

  // text controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare data
    String email = emailTextController.text;
    String password = passwordTextController.text;

    // attempt login..
    try {
      await _auth.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          // email textfield
          TextField(
            controller: emailTextController,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          // password textfield
          TextField(
            controller: passwordTextController,
            decoration: const InputDecoration(labelText: "Password"),
          ),

          const SizedBox(height: 25),

          // login button
          ElevatedButton(
            onPressed: login,
            child: const Text("Login"),
          ),

          // go to register page
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                )),
            child: const Text("Sign Up Here"),
          ),
        ],
      ),
    );
  }
}
