import 'dart:math';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/filter_flight_model.dart';
import 'package:app/data/models/user_models/filter_flight_return_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class FilterReturnFlightWeb {
  Future<List<FlightFilterReturnModel>> filterReturnFlight(
      String departureDateStart,
      String departureDateEnd,
      String minPrice,
      String maxPrice,
      String airlineName) async {
    final url = Uri.parse('$baseUrl/filter');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(FlightFilterRequestModel(
              departureDateStart: departureDateStart,
              departureDateEnd: departureDateEnd,
              minPrice: minPrice,
              maxPrice: maxPrice,
              airlineName: airlineName)
          .toJson()),
    );
    print(jsonEncode(FlightFilterRequestModel(
        departureDateStart: departureDateStart,
        departureDateEnd: departureDateEnd,
        minPrice: minPrice,
        maxPrice: maxPrice,
        airlineName: airlineName)));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      final jsonData = json.decode(response.body);
      final List<FlightFilterReturnModel> flightList =
          (jsonData['filtered_flights'] as List)
              .map((flightJson) => FlightFilterReturnModel.fromJson(flightJson))
              .toList();
      return flightList;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  }
}
