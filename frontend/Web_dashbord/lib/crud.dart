
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';

class Crud {
  getrequest(String url) async {
    try{
    //  print('qqqqqqqqqqqqqqq');
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200){
          var responsebody = jsonDecode(response.body);
          print('dddddddddddddddddddddddddddddddd');
          print(responsebody);
          return responsebody;
        }else{
          print("Error ${response.statusCode}");
        }

    }catch(e){
     print("Eror catch $e");
    }

  }

  postrequest(String url , Map data) async {
    var responsebody;
    try{
      var response = await http.post(Uri.parse(url), body: data );
      if (response.statusCode == 200){
        print("ahmad00000");
         responsebody = jsonDecode(response.body);
        return responsebody;
      }else{
        print("ahmad00000");
        print("Error ${response.statusCode}");
        responsebody = jsonDecode(response.body);
        return responsebody;

      }
    }catch(e){
      print("Eror catch $e");
    }
  }

  anas(String url) async {
    try {
      print('qqqqqqqqqqqqqqq');
      print('Bearer $token');
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        print("+++++++++++++$responsebody");
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    }

    catch (e) {
      print("Eror catch $e");
    }
  }

  ahmad(String url) async {
    try {
      print('qqqqqqqqqqqqqqq');
      print('Bearer $token');
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body).cast<Map<String , dynamic>>();

        print("+++++++++++++$responsebody");
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    }

    catch (e) {
      print("Eror catch $e");
    }
  }

}