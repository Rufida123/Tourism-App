import 'package:web_dashbord/crud.dart';
import 'package:web_dashbord/url_api.dart';

class GetMainPageDate {
  Crud crud = Crud();
  int usersNumber=0;
  
 int getUserNumber ( ) {
   var response =  crud.getrequest(usersCountUrl);
   usersNumber = response["data"];
    return usersNumber;
  }

  getAllFlight (){

  }
  
  
  
}