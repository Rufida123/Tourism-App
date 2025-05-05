import 'package:flutter/material.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Edit%20Services/rooms%20services/edit_room_cubit.dart';
import 'package:web_dashbord/screens/hotel_screen.dart';

class EditRoomTypePage extends StatefulWidget {
  const EditRoomTypePage({required this.hotelId});
  final String hotelId;
  @override
  State<EditRoomTypePage> createState() => _EditRoomTypeState();
}

class _EditRoomTypeState extends State<EditRoomTypePage> {
  TextEditingController roomTypeController1 = TextEditingController();
  TextEditingController roomTypeController2 = TextEditingController();
  TextEditingController roomTypeController3 = TextEditingController();
  TextEditingController roomTypeController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Room Types",
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
                    Text('Room Type',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomTypeController1,
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
                        final usersDetailsCubit =
                            EditRoomTypeCubit.get(context);
                        usersDetailsCubit.cubitEditRoomType(
                            roomTypeController1.text, widget.hotelId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Type Added Successfuly',
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
                      child: Text('Add Room Type'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Room Type ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomTypeController2,
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
                        final usersDetailsCubit =
                            EditRoomTypeCubit.get(context);
                        usersDetailsCubit.cubitEditRoomType(
                            roomTypeController2.text, widget.hotelId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Type Added Successfuly',
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
                      child: Text('Add Room Type'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Room Type',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomTypeController3,
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
                        final usersDetailsCubit =
                            EditRoomTypeCubit.get(context);
                        usersDetailsCubit.cubitEditRoomType(
                            roomTypeController3.text, widget.hotelId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Type Added Successfuly',
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
                      child: Text('Add Room Type'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Room Type',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: roomTypeController4,
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
                        final usersDetailsCubit =
                            EditRoomTypeCubit.get(context);
                        usersDetailsCubit.cubitEditRoomType(
                            roomTypeController4.text, widget.hotelId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Room Type Added Successfuly',
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
                      child: Text('Add Room Type'),
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
                                      builder: (context) => HotelListPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5FCEB6),
                              foregroundColor: Colors.white,
                              shadowColor: Colors.black,
                              minimumSize:
                                  Size(double.infinity, 50), // Button size
                            ),
                            child: Text('Edit Types'),
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
