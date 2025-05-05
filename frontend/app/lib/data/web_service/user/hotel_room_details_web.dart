import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_room_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RoomDetailsWeb {
  Future<RoomDetailsModel> fetchRoomDetails(int roomId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');
    final url = '$baseUrl/indexDetail/$roomId';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $storedToken',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        print('trying room web');
        final jsonData = json.decode(response.body);
        final roomData = jsonData['room_datails'][0];

        return RoomDetailsModel.fromJson(roomData);
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to fetch room details');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to fetch room details');
    }
  }
}
