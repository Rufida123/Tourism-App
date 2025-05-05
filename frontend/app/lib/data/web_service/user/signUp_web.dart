import 'dart:convert';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/signupModel.dart';
import 'package:http/http.dart' as http;

class SignUpUserWeb {
  Future<void> SignUpUser(String email, String firstName, String lastName,
      String password, String confirmPassword, String phone) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(SignUpUserModel(
              email: email,
              firstName: firstName,
              lastName: lastName,
              password: password,
              confirmPassword: confirmPassword,
              phone: phone)
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
