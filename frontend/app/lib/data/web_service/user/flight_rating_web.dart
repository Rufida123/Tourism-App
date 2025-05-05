import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/flight_rating_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FlightRatingWeb {
  Future<FlightRatingResponseModel?> sendFlightRating(
      int id, int rating) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/addRating$id';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $storedToken',
          },
          body: jsonEncode(FlightRatingRequestModel(rating: rating).toJson()));
      print(jsonEncode(FlightRatingRequestModel(rating: rating).toJson()));

      if (response.statusCode == 201) {
        print('${response.statusCode}');
        print('trying rating web');
        final jsonData = json.decode(response.body);
        print('$jsonData');
        final flightRating = FlightRatingResponseModel.fromJson(jsonData);

        return flightRating;
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
