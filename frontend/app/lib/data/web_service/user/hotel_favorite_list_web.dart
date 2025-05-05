import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_favorite_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HotelFavoriteWeb {
  Future<List<HotelFavoriteModel>> fetchHotelFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/indexallfavourite';
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
        final List<HotelFavoriteModel> hList = (jsonData['data'] as List)
            .map((favoritJson) => HotelFavoriteModel.fromJson(favoritJson))
            .toList();
        return hList;
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
