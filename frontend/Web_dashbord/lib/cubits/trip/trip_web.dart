import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/assest/data%20and%20model/trip_model.dart';
class TripListWeb {
  Future<List<TripListModel>> fetchTripList() async {
    print('token restored');
    final url = 'http://127.0.0.1:8000/api/trip';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final TjsonData = json.decode(response.body);
        print('Received data: $TjsonData');
        final List<TripListModel> list = (TjsonData['data'] as List)
            .map((tripJson) => TripListModel.fromJson(tripJson))
            .toList();
        print('$list');
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
