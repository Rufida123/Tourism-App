import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Flight%20Services/edit_flight_cubit.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_return_list_cubit.dart';
import 'package:web_dashbord/screens/flight_return_screen.dart';

class EditFlightPage extends StatefulWidget {
  const EditFlightPage({required this.flightId});
  final String flightId;
  @override
  State<EditFlightPage> createState() => _EditFlightPageState();
}

class _EditFlightPageState extends State<EditFlightPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController departureAirportController = TextEditingController();
  TextEditingController arrivalAirportController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController departureDateController = TextEditingController();
  TextEditingController arrivalDateController = TextEditingController();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController arrivalTimeController = TextEditingController();
  TextEditingController priceOfTicketsController = TextEditingController();
  TextEditingController passengersCountController = TextEditingController();
  String? selectedDirectionId;
  String? selectedTypeId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Enter The Details Of Flight",
        imageRoute: 'lib/assest/images/icons/plane (2).png',
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
                        'Departure Airport Name',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 217, 186)),
                      ),
                      TextFormField(
                        controller: departureAirportController,
                        decoration: InputDecoration(
                          hintText: 'Enter Departure Airport',
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
                            return 'Please enter departure dirport';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Arrival Airport Name',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 217, 186)),
                      ),
                      TextFormField(
                        controller: arrivalAirportController,
                        decoration: InputDecoration(
                          hintText: 'Enter Arrival Airport',
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
                            return 'Please enter arrival dirport';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Company Name',
                        style:
                            TextStyle(color: Color.fromARGB(255, 76, 217, 186)),
                      ),
                      TextFormField(
                        controller: companyNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Company Name',
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
                            return 'Please enter company name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Departure Date',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                          controller: departureDateController,
                          decoration: InputDecoration(
                            hintText: 'Enter Departure Date',
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
                              return 'Please enter departure date';
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
                      Text('Arrival Date',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                          controller: arrivalDateController,
                          decoration: InputDecoration(
                            hintText: 'Enter arrival date',
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
                              return 'Please enter arrival date';
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
                      Text('Departure Time',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: departureTimeController,
                        decoration: InputDecoration(
                          hintText: 'Enter Departure Time (HH:MM)',
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
                            return 'Please enter departure time';
                          }

                          // Custom time validation logic
                          final timePattern =
                              RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
                          if (!timePattern.hasMatch(value)) {
                            return 'Please enter a valid time (HH:MM)';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Arrival Time',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: arrivalTimeController,
                        decoration: InputDecoration(
                          hintText: 'Enter Arrival Time (HH:MM)',
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
                            return 'Please enter arrival time';
                          }

                          // Custom time validation logic
                          final timePattern =
                              RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
                          if (!timePattern.hasMatch(value)) {
                            return 'Please enter a valid time (HH:MM)';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Select Trip Type',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        value: selectedTypeId,
                        onChanged: (newValue) {
                          setState(() {
                            selectedTypeId = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(value: '1', child: Text('One way')),
                          DropdownMenuItem(
                              value: '2', child: Text('Round trip')),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text('Price Of The Tickets',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: priceOfTicketsController,
                        decoration: InputDecoration(
                          hintText: 'Price Of The Tickets',
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
                            return 'Please enter price of the tickets';
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
                      Text('Passengers Count',
                          style: TextStyle(
                              color: Color.fromARGB(255, 76, 217, 186))),
                      TextFormField(
                        controller: passengersCountController,
                        decoration: InputDecoration(
                          hintText: 'Passengers Count',
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
                            return 'Please enter passengers count';
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
                      DropdownButton<String>(
                        value: selectedDirectionId,
                        onChanged: (newValue) {
                          setState(() {
                            selectedDirectionId = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                              value: '1', child: Text('Return trip')),
                          DropdownMenuItem(
                              value: '2', child: Text('Departure trip')),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final usersDetailsCubit =
                                EditFlightCubit.get(context);
                            usersDetailsCubit.cubitAddFlight(
                                departureAirportController.text,
                                arrivalAirportController.text,
                                companyNameController.text,
                                departureDateController.text,
                                arrivalDateController.text,
                                departureTimeController.text,
                                arrivalTimeController.text,
                                selectedTypeId,
                                priceOfTicketsController.text,
                                passengersCountController.text,
                                selectedDirectionId,
                                widget.flightId);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FlightReturnListPage()));
                          final flightReturnListCubit =
                              FlightReturnListCubit.get(context);
                          flightReturnListCubit.cubitFlightReturnList();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5FCEB6),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          minimumSize: Size(double.infinity, 50), // Button size
                        ),
                        child: Text('Add Flight'),
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
