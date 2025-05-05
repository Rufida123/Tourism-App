import 'package:flutter/foundation.dart';

class ListFlight  {

  List<dynamic>? flights;

  ListFlight ({this.flights});

   factory ListFlight.fromjson(Map< String , dynamic> jsonfile){
     print("hello you arrive to list factory");
     return ListFlight(
       flights: jsonfile["data"]
     );
  }

}