import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_dashbord/assest/data%20and%20model/flight_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FlightListWeb {
  Future<List<FlightListModel>> fetchFlightList() async {
      print('token restored');
    final url = '$baseUrl/departure';
    
    
    try {
      print('trying web');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final jsonData = json.decode(response.body);
        final List<FlightListModel> list = (jsonData['data'] as List)
            .map((flightJson) => FlightListModel.fromJson(flightJson))
            .toList();
        print(list);

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
