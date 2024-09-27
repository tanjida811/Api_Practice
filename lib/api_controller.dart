// api_controller.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_models.dart';

class ApiController {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<ApiModels>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => ApiModels.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
