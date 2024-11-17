import 'package:flutter/material.dart';
import '../features/profile/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 25),
        child: Column(
          children: [
            // header
            const DrawerHeader(
              child: Icon(
                Icons.person,
                size: 80,
              ),
            ),

            // home list tile
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("H O M E"),
              onTap: () => Navigator.pop(context),
            ),

            // profile list tile
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("P R O F I L E"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
