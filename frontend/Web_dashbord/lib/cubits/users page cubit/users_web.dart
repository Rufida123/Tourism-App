import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/add_cash_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_dashbord/screens/log_in.dart';

import 'package:web_dashbord/url_api.dart';

class UsersDetailsWeb {
  Future<List<UsersModel>> fetchUsersList() async {
    print('token restored');
    final url = '$baseUrl/user';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final UjsonData = json.decode(response.body);
        print('Received data: $UjsonData');
        final List<UsersModel> list = (UjsonData['data'] as List)
            .map((userJson) => UsersModel.fromJson(userJson))
            .toList();
        print('$list');
        return list;
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}

class UserAddCashWeb {
  Future<void> addUserCash(
    final String? userId,
    final String? cash,
  ) async {
    final url = '$baseUrl/addMoneyToWallet';
    try {
      print('trying adding cash');
      String body = jsonEncode(AddUserCashModel(
        userId,
        cash,
      ).toJson());
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        print('Adding cash successful!');
      } else {
        print('${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
