import 'package:app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TripRemoveFromFavoriteWeb {
  Future<void> tripRemoveFromFavorite(int tripId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = Uri.parse('$baseUrl/destroyFavourits/$tripId');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $storedToken',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      print('Hotel successfuly removed from favorite');
    } else {
      print(response.statusCode.toString());
    }
  }
}
