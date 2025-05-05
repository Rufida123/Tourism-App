import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/search_flight_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchFlightWeb {
  Future<List<FlightSearchModel>> searchFlight(String searchQuery) async {
    final url = Uri.parse('$baseUrl/filter');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          FlightSearchRequestModel(searchQuery: searchQuery).toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      final jsonData = json.decode(response.body);
      final List<FlightSearchModel> list =
          (jsonData['filtered_flights'] as List)
              .map((flightJson) => FlightSearchModel.fromJson(flightJson))
              .toList();
      print('$list');
      return list;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized request');
    } else {
      print(response.statusCode.toString());
      throw Exception(
          'Failed to search flights with status code: ${response.statusCode}');
    }
  }
}
