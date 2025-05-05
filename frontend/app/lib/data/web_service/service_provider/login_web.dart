import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/service_provider_models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProviderWeb {
  Future<void> loginProvider(String email, String password) async {
    final url = Uri.parse('$baseUrl/provider/login_provider');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          LoginProviderModel(email: email, password: password).toJson()),
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
