import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripSearchFillterWeb {
  Future<List<TripSearchFilterModel>> fetchSearchAndFilterTrips(
      final name,
      final rating,
      final maxPrice,
      final minPrice,
      final tripType,
      final location) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/searchTrip';
    try {
      String body = jsonEncode(TripSearchFillterRequestModel(
              name, rating, maxPrice, minPrice, tripType, location)
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
        final jsonData = json.decode(response.body);
        final List<TripSearchFilterModel> hotelList = (jsonData['data'] as List)
            .map((tripJson) => TripSearchFilterModel.fromJson(tripJson))
            .toList();
        return hotelList;
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}
