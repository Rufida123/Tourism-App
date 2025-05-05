
import 'package:web_dashbord/assest/data%20and%20model/flight_return_list_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FlightReturnListWeb {
  Future<FlightReturnListModel?> fetchFlightReturnList() async {
      print('token restored');
    final url = '$baseUrl/return';
    
    
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
     final FlightReturnListModel flightList =
           FlightReturnListModel.fromJson(jsonData['data']);
        return flightList;
        
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