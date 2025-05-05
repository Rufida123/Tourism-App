import 'package:flutter/material.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_room_cubit.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_room_web.dart';
import 'package:web_dashbord/screens/add_hotel_images_page.dart';

class AddRoomFeaturesPage extends StatefulWidget {
  const AddRoomFeaturesPage({super.key});

  @override
  State<AddRoomFeaturesPage> createState() => _AddRoomFeaturesState();
}

class _AddRoomFeaturesState extends State<AddRoomFeaturesPage> {
  TextEditingController roomFeaturesController1 = TextEditingController();
  TextEditingController roomFeaturesController2 = TextEditingController();
  TextEditingController roomFeaturesController3 = TextEditingController();
  TextEditingController roomFeaturesController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Room Features",
        imageRoute: 'lib/assest/images/icons/hotel.png',
        backBotton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 20),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: LeftSlider(),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room Features',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomFeaturesController1,
                      decoration: InputDecoration(
                        hintText: 'Enter Room Type',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 76, 217, 186)), // Border color
                          borderRadius:
                              BorderRadius.circular(8.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 143, 236, 216),
                            width: 2.0,
                          ),
                        ),

                        // Background color when focused
                        filled: true, // Fill the background
                        // Label text
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 143, 236, 216)),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        String roomId = hId2.getId().toString();
                        final usersDetailsCubit =
                            AddRoomFeaturesCubit.get(context);
                        usersDetailsCubit.cubitAddRoomFeatures(
                            roomFeaturesController1.text, roomId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Features Added Successfuly',
                              style: TextStyle(
                                color: Color(0xff55D3BD),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5FCEB6),
                        foregroundColor: Colors.white,
                        shadowColor: Colors.black,
                        minimumSize: Size(double.infinity, 50), // Button size
                      ),
                      child: Text('Add Room Features'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Room Features ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomFeaturesController2,
                      decoration: InputDecoration(
                        hintText: 'Enter Room Features',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 76, 217, 186)), // Border color
                          borderRadius:
                              BorderRadius.circular(8.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 143, 236, 216),
                            width: 2.0,
                          ),
                        ),

                        // Background color when focused
                        filled: true, // Fill the background
                        // Label text
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 143, 236, 216)),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        String roomId = hId2.getId().toString();
                        final usersDetailsCubit =
                            AddRoomFeaturesCubit.get(context);
                        usersDetailsCubit.cubitAddRoomFeatures(
                            roomFeaturesController2.text, roomId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Features Added Successfuly',
                              style: TextStyle(
                                color: Color(0xff55D3BD),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5FCEB6),
                        foregroundColor: Colors.white,
                        shadowColor: Colors.black,
                        minimumSize: Size(double.infinity, 50), // Button size
                      ),
                      child: Text('Add Room Features'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Room Features',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomFeaturesController3,
                      decoration: InputDecoration(
                        hintText: 'Enter Room Features',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 76, 217, 186)), // Border color
                          borderRadius:
                              BorderRadius.circular(8.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 143, 236, 216),
                            width: 2.0,
                          ),
                        ),

                        // Background color when focused
                        filled: true, // Fill the background
                        // Label text
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 143, 236, 216)),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        String roomId = hId2.getId().toString();
                        final usersDetailsCubit =
                            AddRoomFeaturesCubit.get(context);
                        usersDetailsCubit.cubitAddRoomFeatures(
                            roomFeaturesController3.text, roomId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Features Added Successfuly',
                              style: TextStyle(
                                color: Color(0xff55D3BD),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5FCEB6),
                        foregroundColor: Colors.white,
                        shadowColor: Colors.black,
                        minimumSize: Size(double.infinity, 50), // Button size
                      ),
                      child: Text('Add Room Features'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Room Features',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomFeaturesController4,
                      decoration: InputDecoration(
                        hintText: 'Enter Room Type',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 76, 217, 186)), // Border color
                          borderRadius:
                              BorderRadius.circular(8.0), // Border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 143, 236, 216),
                            width: 2.0,
                          ),
                        ),

                        // Background color when focused
                        filled: true, // Fill the background
                        // Label text
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 143, 236, 216)),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        String roomId = hId2.getId().toString();
                        final usersDetailsCubit =
                            AddRoomFeaturesCubit.get(context);
                        usersDetailsCubit.cubitAddRoomFeatures(
                            roomFeaturesController4.text, roomId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Features Added Successfuly',
                              style: TextStyle(
                                color: Color(0xff55D3BD),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5FCEB6),
                        foregroundColor: Colors.white,
                        shadowColor: Colors.black,
                        minimumSize: Size(double.infinity, 50), // Button size
                      ),
                      child: Text('Add Room Features'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddHotelImagesPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5FCEB6),
                              foregroundColor: Colors.white,
                              shadowColor: Colors.black,
                              minimumSize:
                                  Size(double.infinity, 50), // Button size
                            ),
                            child: Text('Add Images'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
