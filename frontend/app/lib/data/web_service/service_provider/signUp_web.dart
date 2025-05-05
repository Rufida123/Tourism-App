import 'dart:convert';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/service_provider_models/sign_up_model.dart';
import 'package:http/http.dart' as http;

class SignUpProviderWeb {
  Future<void> SignUpProvider(String Name, String email, String password,
      String confirmPassword, String commercialNumber) async {
    final url = Uri.parse('$baseUrl/provider/register_service_provider');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(SignUpProviderModel(
              Name: Name,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
              commercialNumber: commercialNumber)
          .toJson()),
    );

    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
    } else if (response.statusCode == 302) {
      throw UserAlreadyExistsException('The email already exists.');
    } else {
      print(response.statusCode.toString());
    }
  }
}

class UserAlreadyExistsException implements Exception {
  final String message;
  UserAlreadyExistsException(this.message);

  @override
  String toString() => message;
}
