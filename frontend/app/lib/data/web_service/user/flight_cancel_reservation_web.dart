import 'package:app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FlightCancelReservationWeb {
  Future<void> CancelReservationFlight(int resId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/flight/cancelBooking/$resId';
    try {
      // final Map<String, dynamic> requestBody = {
      //   'reservation_id': resId,
      // };

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $storedToken',
        },
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
