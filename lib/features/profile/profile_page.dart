import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // get auth service
  final _auth = AuthService();

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // get current user email
    String currentUserEmail = _auth.getCurrentUserEmail() ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Text(currentUserEmail),
      ),
    );
  }
}
