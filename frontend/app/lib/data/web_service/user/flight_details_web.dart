import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_details_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FlightDetailsWeb {
  Future<FlightDetailsModel?> fetchFlightDetails(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = await prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/show$id';
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
        final FlightDetailsModel flightList =
            FlightDetailsModel.fromJson(jsonData['flight']);
        return flightList;
      } else {
        print('Error: ${response.statusCode}');
        return FlightDetailsModel(
            id: -1,
            departureAirport: '',
            arrivalAirport: '',
            companyName: '',
            departureDate: '',
            arrivalDate: '',
            departureTime: '',
            arrivalTime: '',
            typeId: -1,
            status: '',
            priceOfTickets: '',
            passengerCount: -1,
            finalRating: null,
            departureReturnId: -1,
            returnFlightId: -1,
            offers: OfferModel(
                id: -1,
                status: '',
                title: '',
                description: '',
                startDate: '',
                endDate: '',
                discountRate: '',
                discountValue: '',
                offerableType: '',
                offerableId: -1,
                createdAt: '',
                updatedAt: ''));
      }
    } catch (e) {
      print('Exception: $e');
      return FlightDetailsModel(
          id: -1,
          departureAirport: '',
          arrivalAirport: '',
          companyName: '',
          departureDate: '',
          arrivalDate: '',
          departureTime: '',
          arrivalTime: '',
          typeId: -1,
          status: '',
          priceOfTickets: '',
          passengerCount: -1,
          finalRating: null,
          departureReturnId: -1,
          returnFlightId: -1,
          offers: OfferModel(
              id: -1,
              status: '',
              title: '',
              description: '',
              startDate: '',
              endDate: '',
              discountRate: '',
              discountValue: '',
              offerableType: '',
              offerableId: -1,
              createdAt: '',
              updatedAt: ''));
    }
  }
}
