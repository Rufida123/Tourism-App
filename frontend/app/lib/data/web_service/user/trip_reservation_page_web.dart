import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_reservation_page_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripReservationPageWeb {
  Future<List<TripReservationPageModel>> fetchTripReservationPage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/indexbookingUsers';
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
        final List<TripReservationPageModel> tList =
            (jsonData['YourReservation'] as List)
                .map((tripJson) => TripReservationPageModel.fromJson(tripJson))
                .toList();
        print('$tList');
        return tList;
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
