import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_drawer.dart';
import 'package:social_media_app/features/auth/auth_service.dart';
import 'package:social_media_app/features/post/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get auth service
  final _auth = AuthService();

  // get post service
  final _post = PostService();

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
              // post to supabase
              _post.insertPost(postTextController.text);
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
      drawer: const MyDrawer(),
      body: StreamBuilder(
        stream: _post.stream,
        builder: (context, snapshot) {
          // loading..
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // loaded
          final posts = snapshot.data!;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              // get each post
              final post = posts[index];

              // list tile UI
              return ListTile(
                title: Text(post.content),
                subtitle: Text(post.email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postNewMessage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
