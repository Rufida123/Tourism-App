import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;

class DeleteFlightOutDetailsWeb {
  Future<void> fetchDeleteFlightOutDetails(String tripId) async {
    try {
      print('trying web');

      final response = await http.post(
        Uri.parse('$baseUrl/destroyflight/$tripId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);

        print('${response.statusCode}');
      } else {
        print('${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }
}
