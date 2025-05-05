import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_return_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FlightReturnListWeb {
  Future<List<FlightReturnListModel>> fetchFlightReturnList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = await prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/user/return';
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
        final List<FlightReturnListModel> list = (jsonData['data'] as List)
            .map((flightReturnJson) =>
                FlightReturnListModel.fromJson(flightReturnJson))
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
