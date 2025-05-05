import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/widgets/Custom appar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:web_dashbord/crud.dart';
import 'package:web_dashbord/cubits/home%20page%20bloc/home_page_bloc.dart';
import 'package:web_dashbord/cubits/home%20page%20bloc/home_page_event.dart';
import 'package:web_dashbord/cubits/home%20page%20bloc/home_page_state.dart';

int countUser = 0;

class MainPageScreen extends StatefulWidget {
  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(GetHomePageData());
  }

  Crud crud = Crud();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "main page",
        imageRoute: "lib/assest/images/icons/home (1).png",
        backBotton: false,
      ),
      backgroundColor: Color(0xffECFFFB),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 25),
                child: BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                  if (state is HomePageLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomePageDataSuccess) {
                    int? userCountFinal = state.userCountToMainPage;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quick statistics",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            // GestureDetector(
                            //     onTap:(){
                            //       anas(String url) async {
                            //         try{
                            //           print('qqqqqqqqqqqqqqq');
                            //           var response = await http.get(Uri.parse(url) , headers: {
                            //              'Authorization': 'Bearer ${token}' ,
                            //
                            //
                            //           });
                            //           if (response.statusCode == 200){
                            //             var responsebody = jsonDecode(response.body);
                            //
                            //             print(responsebody);
                            //             return responsebody;
                            //           }else{
                            //             print("Error ${response.statusCode}");
                            //           }
                            //
                            //         }catch(e){
                            //           print("Eror catch $e");
                            //         }
                            //
                            //       }
                            //
                            //
                            //
                            //     } ,
                            //     child: Container(color: Colors.red,height: 100 , width: 100,)),
                            //

                            //total users number
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5, top: 5, right: 2, bottom: 5),
                                height: 60,
                                width: 300,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0,
                                        blurRadius: 20,
                                      )
                                    ]),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        'lib/assest/images/icons/user.png'),
                                    height: 20,
                                    width: 20,
                                    color: Color(0xFFE8C547),
                                  ),
                                  horizontalTitleGap: 10,
                                  title: Text("Total users number   $countUser",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700)),
                                  trailing: CircularPercentIndicator(
                                    radius: 20,
                                    lineWidth: 3,
                                    progressColor: Color(0xFF55D3BD),
                                    percent: 0.4,
                                    center: Text(
                                      "40%",
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFE8C547),
                                      ),
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Image( image: AssetImage('lib/assest/images/icons/user.png')),
                                  //
                                  //   ],
                                  // ),
                                )),
                            SizedBox(
                              width: 50,
                            ),
                            //total completed reservations
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5, top: 5, right: 2, bottom: 5),
                                height: 60,
                                width: 300,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 20)
                                    ]),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        'lib/assest/images/icons/payment-done.png'),
                                    height: 30,
                                    width: 30,
                                    color: Color(0xFFE8C547),
                                  ),
                                  horizontalTitleGap: 10,
                                  title: Row(
                                    children: [
                                      Text("Total completed \n reservation",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700)),
                                      Text("       500",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  trailing: CircularPercentIndicator(
                                    radius: 20,
                                    lineWidth: 3,
                                    progressColor: Color(0xFF55D3BD),
                                    percent: 0.3,
                                    center: Text(
                                      "30%",
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFE8C547),
                                      ),
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Image( image: AssetImage('lib/assest/images/icons/user.png')),
                                  //
                                  //   ],
                                  // ),
                                )),
                            SizedBox(
                              width: 50,
                            ),
                            //total payments
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5, top: 5, right: 2, bottom: 5),
                                height: 60,
                                width: 300,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 20)
                                    ]),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        'lib/assest/images/icons/wallet.png'),
                                    height: 20,
                                    width: 20,
                                    color: Color(0xFFE8C547),
                                  ),
                                  horizontalTitleGap: 10,
                                  title: Text("Total payments   27600",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700)),
                                  trailing: CircularPercentIndicator(
                                    radius: 20,
                                    lineWidth: 3,
                                    progressColor: Color(0xFF55D3BD),
                                    percent: 0.6,
                                    center: Text(
                                      "60%",
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFE8C547),
                                      ),
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Image( image: AssetImage('lib/assest/images/icons/user.png')),
                                  //
                                  //   ],
                                  // ),
                                )),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Text("Error");
                  }
                })),
          ),
        ],
      ),
    );
  }
}
