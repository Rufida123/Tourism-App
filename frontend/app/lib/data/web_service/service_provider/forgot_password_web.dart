import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/service_provider_models/forgot_password_model.dart';
import 'package:http/http.dart' as http;

class ProviderForgotPassWeb {
  Future<void> providerForgotPass(String email) async {
    final url = Uri.parse('$baseUrl/user/password/email');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ForgotPassProviderModel(email: email).toJson()),
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
