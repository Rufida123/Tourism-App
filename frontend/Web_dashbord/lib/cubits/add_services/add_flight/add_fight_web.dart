import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/add_flight_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';

class AddFlightWeb {
  Future<void> fetchAddFlight(
    final String? departureAirport,
    final String? arrivalAirport,
    final String? companyName,
    final String? departureDate,
    final String? arrivalDate,
    final String? departureTime,
    final String? arrivalTime,
    final String? typeTrip,
    final String? priceOfTicket,
    final String? passengerCount,
    final String? departureReturnId,
  ) async {
    try {
      print('trying booking web');
      String body = jsonEncode(AddFlightModel(
        departureAirport,
        arrivalAirport,
        companyName,
        departureDate,
        arrivalDate,
        departureTime,
        arrivalTime,
        typeTrip,
        priceOfTicket,
        passengerCount,
        departureReturnId,
      ).toJson());
      final response = await http.post(Uri.parse('$baseUrl/store/flight'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print(response.body);

        print('${response.statusCode}');
        print('Booking successful!');
      } else {
        print('${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }
}
