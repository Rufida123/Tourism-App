import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_cubit.dart';
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_web.dart';
import 'package:web_dashbord/screens/add_trip_activity_page.dart';

class AddTripInDetailsPage extends StatefulWidget {
  const AddTripInDetailsPage({super.key});

  @override
  State<AddTripInDetailsPage> createState() => _AddTripInDetailsPageState();
}

class _AddTripInDetailsPageState extends State<AddTripInDetailsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionDetailtripController =
      TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController maximumParticipantsController = TextEditingController();
  TextEditingController durationDetailtripController = TextEditingController();
  TextEditingController startAgeFormDetailtripController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Inter Details Of Your Trip",
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
                      Text('Trip Description',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: descriptionDetailtripController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip description',
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
                            return 'Please enter a trip description';
                          }
                          return null;
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
                      Text('Trip Duration',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: durationDetailtripController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip duration',
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
                            return 'Please enter a trip duration';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Trip Allowed Start Age',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: startAgeFormDetailtripController,
                        decoration: InputDecoration(
                          hintText: 'Enter trip allowed start age',
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
                            return 'Please enter a trip allowed start age';
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
                            String tripId = id1.getId().toString();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddTripActivityPage()));
                            final usersDetailsCubit =
                                AddTripInDetailsCubit.get(context);
                            usersDetailsCubit.cubitAddTripInDetails(
                                nameController.text,
                                locationController.text,
                                maximumParticipantsController.text,
                                startDateController.text,
                                endDateController.text,
                                descriptionDetailtripController.text,
                                startAgeFormDetailtripController.text,
                                durationDetailtripController.text,
                                tripId);
                          }
                          // Extract other field values similarly

                          // Call your cubit method to add trip details
                          // Example: AddTripDetailsCubit.get(context).cubitAddTripDetails(...);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5FCEB6),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          minimumSize: Size(double.infinity, 50), // Button size
                        ),
                        child: Text('Add Inter Details'),
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
