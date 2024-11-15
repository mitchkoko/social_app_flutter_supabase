import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // get auth service
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // current user email
    String currentUserEmail = _auth.getCurrentUserEmail() ?? "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          // logout button
          IconButton(
            onPressed: () {
              _auth.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(currentUserEmail),
      ),
    );
  }
}
