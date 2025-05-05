import 'package:app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FlightReservationWeb {
  Future<void> fetchReservationFlight(int resId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/booking/flighttt$resId';
    try {
      // final Map<String, dynamic> requestBody = {
      //   'user_ids': roomId,
      // };

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $storedToken',
        },
        // body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print('Reservation Confirm successful!');
      } else if (response.statusCode == 404) {
        print('Reservation Not Found');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
