import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripDetailsWeb {
  Future<TripDetailsModel> fetchTripDetails(int tripId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    final url = '$baseUrl/indexDetails/$tripId';

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
        print('trying trip web');
        final jsonData = json.decode(response.body);
        final tripData = jsonData['detailtrips'][0];

        return TripDetailsModel.fromJson(tripData);
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to fetch trip details');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to fetch trip details');
    }
  }
}
