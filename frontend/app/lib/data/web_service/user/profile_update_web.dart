import 'dart:convert';

import 'dart:io';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileWeb {
  Future<ProfileModel?> updateProfile(String firstName, String lastName) async {
    final url = Uri.parse('$baseUrl/update');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          ProfileRequestModel(firstName: firstName, lastName: lastName)
              .toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      final jsonData = json.decode(response.body);

      final ProfileModel profile = ProfileModel.fromJson(jsonData['user']);
      return profile;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized request');
    } else {
      print(response.statusCode.toString());
      throw Exception(
          'Failed to search flights with status code: ${response.statusCode}');
    }
  }
}
