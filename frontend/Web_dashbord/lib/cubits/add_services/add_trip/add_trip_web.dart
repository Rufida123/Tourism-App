import 'dart:convert';

import 'package:web_dashbord/assest/data%20and%20model/add_trip_avtivity_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/add_trip_in_details_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/add_trip_out_details_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;

class AddTripOutDetailsWeb {
  Future<int?> fetchAddTripOutDetails(
    final String name,
    final String phone,
    final String email,
    final String location,
    final String price,
    final String tripType,
    final String maximumParticipants,
    final String startDate,
    final String endDate,
  ) async {
    try {
      print('trying booking web');
      String body = jsonEncode(AddTripOutDetailsModel(
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
      final response = await http.post(Uri.parse('$baseUrl/addTrip'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print('$body');

      if (response.statusCode == 200) {
        print(response.body);
        final bookingResponse = Response1.fromJson(json.decode(response.body));
        print('${bookingResponse.id}');
        id1.setId(bookingResponse.id);
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

class Response1 {
  final int id;
  Response1({required this.id});

  factory Response1.fromJson(Map<String, dynamic> json) {
    return Response1(id: json['trip']['id']);
  }
}

class Id1 {
  int? _addId;

  void setId(int addId) {
    _addId = addId;
  }

  int? getId() {
    return _addId;
  }
}

final id1 = Id1();

class AddTripInDetailsWeb {
  Future<int?> fetchAddTripInDetails(
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
      String body = jsonEncode(AddTripInDetailsModel(
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
          await http.post(Uri.parse('$baseUrl/addDetailTrip/$tripId'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: body);
      print('$body');

      if (response.statusCode == 200) {
        print(response.body);
        final bookingResponse = Response2.fromJson(json.decode(response.body));
        print('${bookingResponse.id}');
        id2.setId(bookingResponse.id);
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

class Response2 {
  final int id;
  Response2({required this.id});

  factory Response2.fromJson(Map<String, dynamic> json) {
    return Response2(id: json['data']['id']);
  }
}

class Id2 {
  int? _addId;

  void setId(int addId) {
    _addId = addId;
  }

  int? getId() {
    return _addId;
  }
}

final id2 = Id2();

class AddTripActivityDetailsWeb {
  Future<void> fetchAddTripActivityDetails(
      final String name, final String tripId) async {
    try {
      print('trying booking web');
      String body = jsonEncode(AddTripActivityDetailsModel(
        name,
      ).toJson());
      final response = await http.post(Uri.parse('$baseUrl/addActive/$tripId'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print('$body');
      print(tripId);
      print('$baseUrl/addActive/$tripId');
      if (response.statusCode == 200) {
        print(response.body);
        // final bookingResponse = Response.fromJson(json.decode(response.body));
        // print('Booking successful! Reservation ID: ${bookingResponse.id}');
        // id.setId(bookingResponse.id);
        // print(bookingResponse);
        print('${response.statusCode}');
        // print('Booking successful!');
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
