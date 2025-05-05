import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_offer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FlightOfferWeb {
  Future<List<FlightOfferModel?>> fetchFlightOffer(int flightId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/offer/$flightId';
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
        final List<FlightOfferModel> flightOffer = (jsonData['offer'] as List)
            .map(
                (flightOfferJson) => FlightOfferModel.fromJson(flightOfferJson))
            .toList();

        return flightOffer;
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
