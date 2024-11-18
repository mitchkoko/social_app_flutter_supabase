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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            const Icon(
              Icons.lock_open,
              size: 120,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text("T E X T   B A S E D   S O C I A L   A P P"),
            ),

            // email textfield
            TextField(
              controller: emailTextController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            // password textfield
            TextField(
              controller: passwordTextController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            const SizedBox(height: 50),

            // login button
            MaterialButton(
              onPressed: login,
              child: const Text("LOGIN"),
            ),

            // go to register page
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage())),
              child: const Text("SIGN UP"),
            ),
          ],
        ),
      ),
    );
  }
}
