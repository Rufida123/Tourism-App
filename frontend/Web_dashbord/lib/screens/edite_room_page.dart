import 'package:flutter/material.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Edit%20Services/rooms%20services/edit_room_cubit.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_cubit.dart';
import 'package:web_dashbord/screens/hotel_screen.dart';

class EditRoomPage extends StatefulWidget {
  const EditRoomPage({required this.hotelId});

  final String hotelId;
  @override
  State<EditRoomPage> createState() => _EditRoomPageState();
}

class _EditRoomPageState extends State<EditRoomPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController roomCapacityController = TextEditingController();
  TextEditingController priceOfRoomController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Details Of Room",
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
                      Text('Room Capacity',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: roomCapacityController,
                        decoration: InputDecoration(
                          hintText: 'Room Capacity',
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
                            return 'Please enter room capacity';
                          }

                          // Use a regex to check if the input contains only digits
                          final RegExp numericRegex = RegExp(r'^\d+$');
                          if (!numericRegex.hasMatch(value)) {
                            return 'Please enter a valid number';
                          }

                          return null; // If it's a valid number, return null (no error)
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Price Of The Room',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: priceOfRoomController,
                        decoration: InputDecoration(
                          hintText: 'Price Of The Room',
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
                            return 'Please enter price of the room';
                          }

                          // Use a regex to check if the input contains only digits
                          final RegExp numericRegex = RegExp(r'^\d+$');
                          if (!numericRegex.hasMatch(value)) {
                            return 'Please enter a valid number';
                          }

                          return null; // If it's a valid number, return null (no error)
                        },
                      ),
                      SizedBox(height: 16),
                      Text('Room Description',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Enter room description',
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
                            return 'Please enter a room description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final usersDetailsCubit =
                                EditRoomCubit.get(context);
                            usersDetailsCubit.cubitAddRoom(
                                roomCapacityController.text,
                                priceOfRoomController.text,
                                descriptionController.text,
                                widget.hotelId);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotelListPage()));
                          final hoteListCubit = HotelListCubit.get(context);
                          hoteListCubit.cubitHotelList();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5FCEB6),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          minimumSize: Size(double.infinity, 50), // Button size
                        ),
                        child: Text('Edit Room'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
