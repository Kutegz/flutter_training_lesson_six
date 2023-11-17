final class Post {
  final int userId;
  final int id;
  final String title;
  final String message;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.message});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'] ?? 0,
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        message: json['body'] ?? '',
      );
}
