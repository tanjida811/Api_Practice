// api_models.dart
class ApiModels {
  final int userId;
  final int id;
  final String title;
  final String body;

  ApiModels({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ApiModels.fromJson(Map<String, dynamic> json) {
    return ApiModels(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
