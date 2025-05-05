import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/edit_hotel_mode.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_hotel_web.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;

class EditHotelWeb {
  Future<void> fetchEditHotel(
      final String? name,
      final String? email,
      final String? phone,
      final String? location,
      final String? priceforNight,
      String hotelId) async {
    try {
      print('trying web');
      String body = jsonEncode(EditHotelModel(
        name,
        email,
        phone,
        location,
        priceforNight,
      ).toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/updatHotel/$hotelId'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: body);
      print('$body');

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
