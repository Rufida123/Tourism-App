import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/edit_room_features_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/edit_room_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/edit_room_types_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;

class EditRoomWeb {
  Future<void> fetchAddRoom(final String? capacity, final String? price,
      final String? description, String roomId) async {
    try {
      print('trying web');
      String body = jsonEncode(EditRoomModel(
        capacity,
        price,
        description,
      ).toJson());
      final response = await http.post(Uri.parse('$baseUrl/updatRoom/$roomId'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print(response.body);
        // final bookingResponse = HResponse1.fromJson(json.decode(response.body));
        // print('${bookingResponse.id}');
        // hId2.setId(bookingResponse.id);
        // print(bookingResponse);
        // print('${response.statusCode}');
        // return bookingResponse.id;
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

// class HResponse1 {
//   final int id;
//   HResponse1({required this.id});

//   factory HResponse1.fromJson(Map<String, dynamic> json) {
//     return HResponse1(id: json['room']['id']);
//   }
// }

// class HId2 {
//   int? _addId;

//   void setId(int addId) {
//     _addId = addId;
//   }

//   int? getId() {
//     return _addId;
//   }
// }

// final hId2 = HId2();

class EditRoomTypeWeb {
  Future<void> fetchEditRoomType(final String name, final String roomId) async {
    try {
      print('trying web');
      String body = jsonEncode(EditRoomTypeModel(
        name,
      ).toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/updateRoomType/$roomId'),
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

class EditRoomFeaturesWeb {
  Future<void> fetchEditRoomFeatures(
      final String name, final String roomId) async {
    try {
      print('trying web');
      String body = jsonEncode(EditRoomFeaturesModel(
        name,
      ).toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/updateFeature/$roomId'),
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
