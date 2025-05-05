import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_edit_reservation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HotelEditReservationWeb {
  Future<void> editReservationHotels(
      String? reservationId,
      String? checkin,
      String? checkout,
      String? numberOFday,
      String? firstName,
      String? numberRoom) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/updateReservationUser';
    try {
      String body = jsonEncode(HotelEditReservationModel(reservationId, checkin,
              checkout, numberOFday, firstName, numberRoom)
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
