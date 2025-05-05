import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  String? title;
  String? imageRoute;
  bool ?backBotton;
  CustomAppbar({  this.title , this.imageRoute , this.backBotton});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backBotton!,
      title: Row(
        children: [
          Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Container(
                  width: 30,
                  height: 30,
                  child: Image(image: AssetImage('lib/assest/images/logo.png'),fit: BoxFit.cover,height: 25,width: 25,)),
              Padding(
                padding:  EdgeInsets.only(left: 12),
                child: Text('visit syria',style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.w700, color: Colors.black,)),
              )
            ],
          ),
              ),
          SizedBox(width: MediaQuery.of(context).size.width/17),
          Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage('$imageRoute'),fit: BoxFit.cover,height: 14,width: 14,)),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("$title", style: TextStyle(fontSize: 18),),
          ),
        ],
      ),);

  }
}
