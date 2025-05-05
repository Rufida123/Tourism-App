import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HotelListWeb {
  Future<List<HotelListModel>> fetchHotelList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/index';
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
        final List<HotelListModel> list = (jsonData['data'] as List)
            .map((hotelJson) => HotelListModel.fromJson(hotelJson))
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
