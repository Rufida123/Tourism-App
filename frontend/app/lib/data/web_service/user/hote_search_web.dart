import 'dart:convert';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_search_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HotelSearchFillterWeb {
  Future<List<HotelSearchFillterModel>> fetchSearchAndFilterHotels(
      String? name,
      String? location,
      String? roomType,
      String? checkin,
      String? checkout,
      String? rating,
      String? feature) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    print('token restored');
    final url = '$baseUrl/search';
    try {
      String body = jsonEncode(HotelSearchFillterRequestModel(
              name, location, roomType, checkin, checkout, rating, feature)
          .toJson());
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $storedToken',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final jsonData = json.decode(response.body);
        final List<HotelSearchFillterModel> hotelList =
            (jsonData['data'] as List)
                .map((hotelJson) => HotelSearchFillterModel.fromJson(hotelJson))
                .toList();
        return hotelList;
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}
