import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/edit_trip_activity_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/edit_trip_in_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/edit_trip_out_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';

class EditTripOutDetailsWeb {
  Future<void> fetchEditTripOutDetails(
    final String name,
    final String phone,
    final String email,
    final String location,
    final String price,
    final String tripType,
    final String maximumParticipants,
    final String startDate,
    final String endDate,
    String tripId,
  ) async {
    try {
      print('trying web');
      String body = jsonEncode(EditTripOutDetailsModel(
        name,
        phone,
        email,
        location,
        price,
        tripType,
        maximumParticipants,
        startDate,
        endDate,
      ).toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/updateDetailTrip/$tripId'),
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

class EditTripInDetailsWeb {
  Future<void> fetchEditTripInDetails(
      final String name,
      final String location,
      final String maximumParticipants,
      final String startDate,
      final String endDate,
      final String descriptionDetailtrip,
      final String startAgeFormDetailtrip,
      final String durationDetailtrip,
      final String tripId) async {
    try {
      print('trying booking web');
      String body = jsonEncode(EditTripInDetailsModel(
              name,
              location,
              maximumParticipants,
              startDate,
              endDate,
              descriptionDetailtrip,
              startAgeFormDetailtrip,
              durationDetailtrip)
          .toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/updateDetailTrip/$tripId'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: body);
      print('$body');

      if (response.statusCode == 200) {
        print(response.body);

        print('${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }
}

class EditTripActivityDetailsWeb {
  Future<void> fetchEditTripActivityDetails(
      final String name, final String tripId) async {
    try {
      print('trying booking web');
      String body = jsonEncode(EditTripActivityDetailsModel(
        name,
      ).toJson());
      final response =
          await http.post(Uri.parse('$baseUrl/updateactive/$tripId'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: body);
      print('$baseUrl/addActive/$tripId');
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
