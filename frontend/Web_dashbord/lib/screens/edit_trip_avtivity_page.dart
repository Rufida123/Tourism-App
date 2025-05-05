import 'package:flutter/material.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/trip/trip_cubit.dart';
import 'package:web_dashbord/screens/trip_screen.dart';

import '../cubits/Edit Services/Trips Services/edit_trip_cubit.dart';

class AddTripActivityPage extends StatefulWidget {
  const AddTripActivityPage({required this.tripId});
  final String tripId;

  @override
  State<AddTripActivityPage> createState() => _AddTripActivityPageState();
}

class _AddTripActivityPageState extends State<AddTripActivityPage> {
  TextEditingController nameActiviteController1 = TextEditingController();
  TextEditingController nameActiviteController2 = TextEditingController();
  TextEditingController nameActiviteController3 = TextEditingController();
  TextEditingController nameActiviteController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Activities Of Your Trip",
        imageRoute: 'lib/assest/images/icons/ticket.png',
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
                    Text('Trip Activity',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: nameActiviteController1,
                      decoration: InputDecoration(
                        hintText: 'Enter trip activity',
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
                            EditTripActivityDetailsCubit.get(context);
                        usersDetailsCubit.cubitAddTripActivityDetails(
                            nameActiviteController1.text, widget.tripId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Avtivity Added Successfuly',
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
                      child: Text('Edit Activity'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Trip Activity',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: nameActiviteController2,
                      decoration: InputDecoration(
                        hintText: 'Enter trip activity',
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
                            EditTripActivityDetailsCubit.get(context);
                        usersDetailsCubit.cubitAddTripActivityDetails(
                            nameActiviteController2.text, widget.tripId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Avtivity Added Successfuly',
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
                      child: Text('Edit Activity'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Trip Activity',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: nameActiviteController3,
                      decoration: InputDecoration(
                        hintText: 'Enter trip activity',
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
                            EditTripActivityDetailsCubit.get(context);
                        usersDetailsCubit.cubitAddTripActivityDetails(
                            nameActiviteController3.text, widget.tripId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Avtivity Added Successfuly',
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
                      child: Text('Edit Activity'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Trip Activity',
                        style: TextStyle(
                            color: Color.fromARGB(255, 76, 217, 186))),
                    TextFormField(
                      controller: nameActiviteController4,
                      decoration: InputDecoration(
                        hintText: 'Enter trip activity',
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
                            EditTripActivityDetailsCubit.get(context);
                        usersDetailsCubit.cubitAddTripActivityDetails(
                            nameActiviteController4.text, widget.tripId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Avtivity Added Successfuly',
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
                      child: Text('Edit Activity'),
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
                                      builder: (context) => TripListPage()));
                              final tripListCubit = TripListCubit.get(context);
                              tripListCubit.cubitTripList();
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
