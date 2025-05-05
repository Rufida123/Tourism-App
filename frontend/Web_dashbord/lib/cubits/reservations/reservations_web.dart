import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/reservations_flight_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_hotel_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_trip_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;

class ReservationsFlightWeb {
  Future<List<ReservationFlightModel>> fetchReservationFlighList() async {
    print('token restored');
    final url = '$baseUrl/reservation/flight';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final RjsonData = json.decode(response.body);
        print('Received data: $RjsonData');
        final List<ReservationFlightModel> list = (RjsonData['data'] as List)
            .map((tripJson) => ReservationFlightModel.fromJson(tripJson))
            .toList();
        print('$list');
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

class ReservationsHotelWeb {
  Future<List<ReservationHotelModel>> fetchReservationHotelList() async {
    print('token restored');
    final url = '$baseUrl/reservation/hotel';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final RjsonData = json.decode(response.body);
        print('Received data: $RjsonData');
        final List<ReservationHotelModel> list = (RjsonData['data'] as List)
            .map((tripJson) => ReservationHotelModel.fromJson(tripJson))
            .toList();
        print('$list');
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

class ReservationsTripWeb {
  Future<List<ReservationTripModel>> fetchReservationTripList() async {
    print('token restored');
    final url = '$baseUrl/reservation/trip';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final RjsonData = json.decode(response.body);
        print('Received data: $RjsonData');
        final List<ReservationTripModel> list = (RjsonData['data'] as List)
            .map((tripJson) => ReservationTripModel.fromJson(tripJson))
            .toList();
        print('$list');
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
