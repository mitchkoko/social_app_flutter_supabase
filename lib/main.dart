import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase setup
  await Supabase.initialize(
    url: "https://ixcfcpdwjaazikdbifqw.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4Y2ZjcGR3amFhemlrZGJpZnF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2NjU4NzUsImV4cCI6MjA0NzI0MTg3NX0.ojD5p2MaDkTzDCXdYn0t-0WPSutPtAhqqWdHcNaeOcE",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.grey,
        ),
      ),
      home: const AuthGate(),
    );
  }
}
