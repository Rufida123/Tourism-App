import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/loginModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserWeb {
  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login_user');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(LoginUserModel(email: email, password: password).toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', responseBody['data']);
      print(responseBody);
    } else if (response.statusCode == 401) {
      throw WrongPasswordOrNotVerifiedException();
    } else if (response.statusCode == 422) {
      throw InvalidEmailException();
    } else {
      print(response.statusCode.toString());
      throw Exception(
          'Failed to login with status code: ${response.statusCode}');
    }
  }
}

class WrongPasswordOrNotVerifiedException implements Exception {}

class InvalidEmailException implements Exception {}
