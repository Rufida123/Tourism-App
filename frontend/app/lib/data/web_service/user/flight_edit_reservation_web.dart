import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_edit_reservation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FlightEditReservationWeb {
  Future<void> editReservationFlight(
    String? NumberOfAdults,
    String? NumberOfChildren,
    String? phone,
    int id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/updateBooking/$id';
    try {
      String body = jsonEncode(
          FlightEditReservationModel(NumberOfAdults, NumberOfChildren, phone)
              .toJson());
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $storedToken',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print('${response.statusCode}');
      } else {
        print('${response.statusCode}');
        throw Exception('Failed to edit reservation details');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
