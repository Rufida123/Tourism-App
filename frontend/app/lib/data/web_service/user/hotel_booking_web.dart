import 'dart:convert';

import 'package:app/components/shared_state_manager.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_booking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HotelBookingWeb {
  Future<int?> fetchBookingHotels(
      final String? checkin,
      final String? checkout,
      final String? numberOFday,
      final String? firstName,
      final String? numberroom,
      int roomId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/createBooking/$roomId';
    try {
      print('trying booking web');
      String body = jsonEncode(HotelBookingModel(
        checkin,
        checkout,
        numberOFday,
        firstName,
        numberroom,
      ).toJson());
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $storedToken',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        final bookingResponse =
            HBookingResponse.fromJson(json.decode(response.body));
        print(
            'Booking successful! Reservation ID: ${bookingResponse.reservationId}');
        HreservationId.setId(bookingResponse.reservationId);
        print(bookingResponse);
        print('${response.statusCode}');
        print('Booking successful!');
        return bookingResponse.reservationId;
      } else if (response.statusCode == 403) {
        print('No available rooms in this hotel or insufficient funds.');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }
}

class HBookingResponse {
  final int reservationId;
  HBookingResponse({required this.reservationId});

  factory HBookingResponse.fromJson(Map<String, dynamic> json) {
    return HBookingResponse(reservationId: json['detail booking']['id']);
  }
}
