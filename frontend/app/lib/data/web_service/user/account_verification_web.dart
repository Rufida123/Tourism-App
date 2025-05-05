import 'dart:convert';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/account_verification_model.dart';
import 'package:http/http.dart' as http;

class AccVerifiUserWeb {
  Future<void> accVerifiUser(String email, String code) async {
    final url = Uri.parse('$baseUrl/verifyUser');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(AccVerifiUserModel(email: email, code: code).toJson()),
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
