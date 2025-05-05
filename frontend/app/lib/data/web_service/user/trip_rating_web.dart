import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_rating_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripRatingWeb {
  Future<TripRatingResponseModel?> sendTripRating(
      int tripId, int rating) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/createRating/$tripId';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $storedToken',
          },
          body: jsonEncode(TripRatingRequestModel(rating: rating).toJson()));

      if (response.statusCode == 201) {
        print('${response.statusCode}');
        print('trying rating web');
        final jsonData = json.decode(response.body);
        print('$jsonData');
        final tripRating = TripRatingResponseModel.fromJson(jsonData);
        return tripRating;
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
