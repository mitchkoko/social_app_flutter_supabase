class Post {
  String? id;
  String content;
  String email;

  Post({
    this.id,
    required this.content,
    required this.email,
  });

  // map -> post
  factory Post.fromMap(Map<String, dynamic> postMap) {
    return Post(
      id: postMap['id'] as String,
      content: postMap['content'] as String,
      email: postMap['email'] as String,
    );
  }

  // post -> map
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'email': email,
    };
  }
}
