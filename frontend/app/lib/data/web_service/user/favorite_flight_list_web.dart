import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/favorite_flight_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FlightFavoriteWeb {
  Future<List<FlightFavoriteModel>> fetchFlightFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/list';
    try {
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
        print('json data is: $jsonData');
        final List<FlightFavoriteModel> list = (jsonData['data'] as List)
            .map((favoritJson) => FlightFavoriteModel.fromJson(favoritJson))
            .toList();
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
