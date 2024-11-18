import 'package:social_media_app/features/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'post.dart';

class PostService {
  final _supabase = Supabase.instance.client;
  final _auth = AuthService();

  // Insert a new post
  Future<void> insertPost(String content) async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      throw 'User not authenticated';
    }

    await _supabase.from('posts').insert({
      'user_id': user.id,
      'content': content,
      'email': _auth.getCurrentUserEmail(),
    });
  }

  // read posts
  final stream = Supabase.instance.client.from('posts').stream(
    primaryKey: ['id'],
  ).map((data) => data.map((postMap) => Post.fromMap(postMap)).toList());
}
