import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/forgot_password_model.dart';
import 'package:http/http.dart' as http;

class UserForgotPassWeb {
  Future<void> userForgotPass(String email) async {
    final url = Uri.parse('$baseUrl/user/password/email');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ForgotPassUserModel(email: email).toJson()),
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
    } else {
      print(response.statusCode.toString());
      throw Exception('the code is not correct');
    }
  }
}
