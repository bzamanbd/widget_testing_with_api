import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:widget_test_with_api/user_model.dart';

class UserModelRepository {
  final url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> get fetchUsers => _fetchUsers();

  Future<List<UserModel>> _fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch the users');
    }
  }
}
