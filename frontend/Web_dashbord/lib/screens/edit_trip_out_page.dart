import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Trips%20Services/edit_trip_cubit.dart';
import 'package:web_dashbord/cubits/trip/trip_cubit.dart';
import 'package:web_dashbord/screens/edit_trip_in_page.dart';
import 'package:web_dashbord/screens/trip_screen.dart';

class EditTripOutDetailsPage extends StatefulWidget {
  const EditTripOutDetailsPage({required this.tripId});
  final String tripId;
  @override
  State<EditTripOutDetailsPage> createState() => _EditTripOutDetailsPageState();
}

class _EditTripOutDetailsPageState extends State<EditTripOutDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? SelectedTripType;
  TextEditingController maximumParticipantsController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: "Enter The Outer Details Of Your Trip",
          imageRoute: 'lib/assest/images/icons/ticket.png',
          backBotton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 20),
          child: Row(children: [
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
                        'Trip Name',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 217, 186)),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip name',
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
                            return 'Please enter a trip name';
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
                      Text('Trip Location',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip location',
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
                            return 'Please enter a trip location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Trip Price',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip price',
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
                            return 'Please enter a trip price';
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
                      Text('Select Trip Type',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        value: SelectedTripType,
                        onChanged: (newValue) {
                          setState(() {
                            SelectedTripType = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                              value: 'natural', child: Text('natural')),
                          DropdownMenuItem(
                              value: 'Naval', child: Text('Naval')),
                          DropdownMenuItem(
                              value: 'archaeological',
                              child: Text('archaeological')),
                          DropdownMenuItem(
                              value: 'religious', child: Text('religious')),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text('Trip Maximum Participants',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: maximumParticipantsController,
                        decoration: InputDecoration(
                          hintText: 'Enter maximum participants',
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
                            return 'Please enter a maximum participants number';
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
                      Text('Trip Start Date',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                          controller: startDateController,
                          decoration: InputDecoration(
                            hintText: 'Enter trip start date',
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
                              return 'Please enter a trip start date';
                            }

                            // Validate if the input is a valid date
                            final DateFormat dateFormat =
                                DateFormat('yyyy-MM-dd');
                            try {
                              final DateTime parsedDate =
                                  dateFormat.parse(value);
                              // Additional checks (if needed):
                              // - Ensure the parsedDate is not in the past
                              // - Check for specific date ranges, etc.
                              // ...

                              // If all checks pass, return null (no error)
                              return null;
                            } catch (e) {
                              return 'Invalid date format. Please use yyyy-MM-dd.';
                            }
                          }),
                      SizedBox(height: 16.0),
                      Text('Trip End Date',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: endDateController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip end date',
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
                            return 'Please enter a trip end date';
                          }

                          // Validate if the input is a valid date
                          final DateFormat dateFormat =
                              DateFormat('yyyy-MM-dd');
                          try {
                            final DateTime parsedDate = dateFormat.parse(value);
                            // Additional checks (if needed):
                            // - Ensure the parsedDate is not in the past
                            // - Check for specific date ranges, etc.
                            // ...

                            // If all checks pass, return null (no error)
                            return null;
                          } catch (e) {
                            return 'Invalid date format. Please use yyyy-MM-dd.';
                          }
                        },
                      ),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final usersDetailsCubit =
                                EditTripOutDetailsCubit.get(context);
                            usersDetailsCubit.cubitEditTripOutDetails(
                                nameController.text,
                                phoneController.text,
                                emailController.text,
                                locationController.text,
                                priceController.text,
                                SelectedTripType.toString(),
                                maximumParticipantsController.text,
                                startDateController.text,
                                endDateController.text,
                                widget.tripId);
                          }
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
                          minimumSize: Size(double.infinity, 50), // Button size
                        ),
                        child: Text('Add Outer Details'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
