import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_offer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripOfferWeb {
  Future<TripOfferModel?> fetchTripOffer(int tripId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/indexDetailOffers/$tripId';
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
        final tripOffer = TripOfferModel.fromJson(jsonData);
        return tripOffer;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
