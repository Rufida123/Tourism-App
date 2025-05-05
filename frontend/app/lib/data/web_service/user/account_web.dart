import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AccountWeb {
  Future<AccountModel?> fetchAccountProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = await prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/profile';
    try {
      print('trying web');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $storedToken',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final jsonData = json.decode(response.body);
        final AccountModel accountList =
            AccountModel.fromJson(jsonData['user']);
        return accountList;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
