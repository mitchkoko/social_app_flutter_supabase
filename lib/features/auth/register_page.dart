import 'package:flutter/material.dart';
import 'auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // get auth service
  final _auth = AuthService();

  // text controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  // register button pressed
  void register() async {
    // prepare data
    String email = emailTextController.text;
    String password = passwordTextController.text;
    String confirmPassword = confirmPasswordTextController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match!")));
    }

    // attempt sign up..
    try {
      await _auth.signUpWithEmailPassword(email, password);
      if (mounted) Navigator.pop(context);
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
        title: const Text("Create Account"),
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
            obscureText: true,
          ),

          // confirm password textfield
          TextField(
            controller: confirmPasswordTextController,
            decoration: const InputDecoration(labelText: "Confirm Password"),
            obscureText: true,
          ),

          const SizedBox(height: 25),

          // sign up button
          MaterialButton(
            onPressed: register,
            child: const Text("SIGN UP"),
          ),
        ],
      ),
    );
  }
}
