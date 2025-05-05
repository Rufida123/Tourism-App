import 'dart:convert';

import 'package:app/components/shared_state_manager.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_booking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripBookingWeb {
  Future<int?> fetchBookingTrips(
      final String? firstName,
      final String? lastName,
      final String? numberOfPeople,
      final String? notes,
      int tripId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/createBookings/$tripId';
    try {
      print('trying booking web');
      String body = jsonEncode(TripBookingModel(
        firstName,
        lastName,
        numberOfPeople,
        notes,
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
            TBookingResponse.fromJson(json.decode(response.body));
        print(
            'Booking successful! Reservation ID: ${bookingResponse.reservationId}');
        TreservationId.setId(bookingResponse.reservationId);
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

class TBookingResponse {
  final int reservationId;
  TBookingResponse({required this.reservationId});

  factory TBookingResponse.fromJson(Map<String, dynamic> json) {
    return TBookingResponse(reservationId: json['detail booking']['id']);
  }
}
