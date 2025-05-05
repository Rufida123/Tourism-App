import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/service_provider_models/password_reset_model.dart';
import 'package:http/http.dart' as http;

class ProviderPassResetWeb {
  Future<void> providerPassReset(
      String code, String password, String passwordConfirmation) async {
    final url = Uri.parse('$baseUrl/user/password/reset');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(PassResetProviderModel(
              code: code,
              password: password,
              passwordConfirmation: passwordConfirmation)
          .toJson()),
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
