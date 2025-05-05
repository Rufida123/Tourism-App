import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_list_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FlightListWeb {
  Future<List<FlightListModel>> fetchFlightList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = await prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/user/departure';
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
        final List<FlightListModel> list = (jsonData['flights'] as List)
            .map((flightJson) => FlightListModel.fromJson(flightJson))
            .toList();
        print(list);

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
