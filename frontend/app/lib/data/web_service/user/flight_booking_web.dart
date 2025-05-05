import 'package:app/components/shared_state_manager.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_booking_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BookingFlightWeb {
  Future<int?> bookingFlight(
      String phoneNumber, int numOfChild, int numOfAdult, int id) async {
    final url = Uri.parse('$baseUrl/booking/flight$id');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(BookingFlightRequestModel(
              phoneNumber: phoneNumber,
              numOfChild: numOfChild,
              numOfAdult: numOfAdult)
          .toJson()),
    );

    print(jsonEncode(BookingFlightRequestModel(
            phoneNumber: phoneNumber,
            numOfChild: numOfChild,
            numOfAdult: numOfAdult)
        .toJson()));

    if (response.statusCode == 200) {
      final bookingResponse =
          FBookingResponse.fromJson(json.decode(response.body));
      print(
          'Booking successful! Reservation ID: ${bookingResponse.reservationId}');
      FreservationId.setId(bookingResponse.reservationId);
      print('${response.statusCode}');
      print('Booking successful!');
      return bookingResponse.reservationId;
    } else if (response.statusCode == 403) {
      print('No enough Money.');
    }

    return null;
  }
}

class FBookingResponse {
  final int reservationId;
  FBookingResponse({required this.reservationId});

  factory FBookingResponse.fromJson(Map<String, dynamic> json) {
    return FBookingResponse(reservationId: json['data']['id']);
  }
}
