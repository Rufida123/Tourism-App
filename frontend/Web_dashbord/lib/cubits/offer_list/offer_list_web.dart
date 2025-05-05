import 'package:web_dashbord/assest/data%20and%20model/offer_list_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OfferListWeb {
  Future<List<OfferListModel>> fetchOfferList() async {
    print('token restored');
    final url = '$baseUrl/list/offer';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('${response.statusCode}');
        final jsonData = json.decode(response.body);
        print('Received data: $jsonData');
        final List<OfferListModel> list = (jsonData['offers'] as List)
            .map((offerJson) => OfferListModel.fromJson(offerJson))
            .toList();
        print('$list');
        return list;
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}
