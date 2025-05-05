import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/add_room_features_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/add_room_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/add_room_type_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;

class AddRoomWeb {
  Future<int?> fetchAddRoom(final String? capacity, final String? price,
      final String? description, String roomId) async {
    try {
      print('trying web');
      String body = jsonEncode(AddRoomModel(
        capacity,
        price,
        description,
      ).toJson());
      final response = await http.post(Uri.parse('$baseUrl/addroom/$roomId'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print(response.body);
        final bookingResponse = HResponse1.fromJson(json.decode(response.body));
        print('${bookingResponse.id}');
        hId2.setId(bookingResponse.id);
        print(bookingResponse);
        print('${response.statusCode}');
        return bookingResponse.id;
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

class HResponse1 {
  final int id;
  HResponse1({required this.id});

  factory HResponse1.fromJson(Map<String, dynamic> json) {
    return HResponse1(id: json['room']['id']);
  }
}

class HId2 {
  int? _addId;

  void setId(int addId) {
    _addId = addId;
  }

  int? getId() {
    return _addId;
  }
}

final hId2 = HId2();

class AddRoomTypeWeb {
  Future<void> fetchAddRoomType(final String name, final String roomId) async {
    try {
      print('trying web');
      String body = jsonEncode(AddRoomTypeModel(
        name,
      ).toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/addRoomtype/$roomId'),
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

class AddRoomFeaturesWeb {
  Future<void> fetchAddRoomFeatures(
      final String name, final String roomId) async {
    try {
      print('trying web');
      String body = jsonEncode(AddRoomFeaturesModel(
        name,
      ).toJson());
      final response = await http.post(Uri.parse('$baseUrl/addFeature/$roomId'),
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
