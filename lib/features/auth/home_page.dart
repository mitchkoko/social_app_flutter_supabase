import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get auth service
  final _auth = AuthService();

  // text controller
  final postTextController = TextEditingController();

  // user wants to post new message
  void postNewMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Post"),
        content: TextField(
          controller: postTextController,
        ),
        actions: [
          // cancel button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              postTextController.clear();
            },
            child: const Text("Cancel"),
          ),

          // post button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              postTextController.clear();
            },
            child: const Text("Post"),
          ),
        ],
      ),
    );
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: postNewMessage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
