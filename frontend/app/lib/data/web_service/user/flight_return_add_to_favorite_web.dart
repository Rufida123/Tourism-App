import 'package:app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FlightReturnAddToFavoriteWeb {
  Future<void> flightReturnAddToFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = Uri.parse('$baseUrl/favorite_Flight$id');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $storedToken',
      },
    );
    if (response.statusCode == 201) {
      print('${response.statusCode}');
      print('Flight added successfuly to the favorite');
    } else if (response.statusCode == 401) {
      print('${response.statusCode}');
      print('the Flight found in favourite before');
    } else if (response.statusCode == 404) {
      print('${response.statusCode}');
      print('flight not found');
    } else {
      print(response.statusCode.toString());
    }
  }
}
