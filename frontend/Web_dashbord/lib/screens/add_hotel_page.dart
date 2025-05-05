import 'package:flutter/material.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_hotel_cubit.dart';
import 'package:web_dashbord/screens/add_room_page.dart';

class AddHotelPage extends StatefulWidget {
  const AddHotelPage({super.key});

  @override
  State<AddHotelPage> createState() => _AddHotelPageState();
}

class _AddHotelPageState extends State<AddHotelPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController hotelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceOfNightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Details Of Hotel",
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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hotel Name',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 217, 186)),
                      ),
                      TextFormField(
                        controller: hotelController,
                        decoration: InputDecoration(
                          hintText: 'Hotel Airport',
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

                          filled: true, // Fill the background
                          // Label text
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 236, 216)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter hotel name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Your Email',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
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

                          filled: true, // Fill the background
                          // Label text
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 236, 216)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Phone Number',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }

                          // Remove any non-digit characters (e.g., spaces, dashes)
                          final cleanedValue =
                              value.replaceAll(RegExp(r'[^\d]'), '');

                          if (cleanedValue.length != 10) {
                            return 'Please enter a valid 10-digit phone number';
                          }

                          return null; // If it's a valid phone number, return null (no error)
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Hotel Location',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          hintText: 'Enter hotel location',
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

                          filled: true, // Fill the background
                          // Label text
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 236, 216)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a hotel location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Price Of The Night',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: priceOfNightController,
                        decoration: InputDecoration(
                          hintText: 'Price Of The Night',
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

                          filled: true, // Fill the background
                          // Label text
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 236, 216)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter price of the night';
                          }

                          // Use a regex to check if the input contains only digits
                          final RegExp numericRegex = RegExp(r'^\d+$');
                          if (!numericRegex.hasMatch(value)) {
                            return 'Please enter a valid number';
                          }

                          return null; // If it's a valid number, return null (no error)
                        },
                      ),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddRoomPage()));
                            final usersDetailsCubit =
                                AddHotelCubit.get(context);
                            usersDetailsCubit.cubitAddHotel(
                                hotelController.text,
                                emailController.text,
                                phoneController.text,
                                locationController.text,
                                priceOfNightController.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5FCEB6),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          minimumSize: Size(double.infinity, 50), // Button size
                        ),
                        child: Text('Add Hotel'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
