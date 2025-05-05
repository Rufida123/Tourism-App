import 'package:web_dashbord/assest/data%20and%20model/add_offer_model.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddOfferWeb {
  Future<int?> addOffer(
      String status,
      String title,
      String description,
      String startDate,
      String endDate,
      String discountRate,
      String discountValue,
      String offerableType,
      String offerableId) async {
    final url = '$baseUrl/offer/store';

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(OfferAddModel(
                  status: status,
                  title: title,
                  description: description,
                  startDate: startDate,
                  endDate: endDate,
                  discountRate: discountRate,
                  discountValue: discountValue,
                  offerableType: offerableType,
                  offerableId: offerableId)
              .toJson()));

      print(jsonEncode(OfferAddModel(
              status: status,
              title: title,
              description: description,
              startDate: startDate,
              endDate: endDate,
              discountRate: discountRate,
              discountValue: discountValue,
              offerableType: offerableType,
              offerableId: offerableId)
          .toJson()));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(responseBody);
        final bookingResponse = Response.fromJson(json.decode(response.body));
        print('${bookingResponse.id}');
        offerId.setId(bookingResponse.id);
        print(bookingResponse);
        print('${response.statusCode}');
        return bookingResponse.id;
      } else {
        print('HTTP Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}

class Response {
  final int id;
  Response({required this.id});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(id: json['offer']['id']);
  }
}

class OfferId {
  int? _addId;

  void setId(int addId) {
    _addId = addId;
  }

  int? getId() {
    return _addId;
  }
}

final offerId = OfferId();
