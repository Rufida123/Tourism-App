import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_cubit.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_cubit.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_state.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_web.dart';
import 'package:web_dashbord/screens/flight_screen.dart';
import 'package:web_dashbord/screens/hotel_screen.dart';
import 'package:web_dashbord/screens/trip_screen.dart';

class AddOfferPage extends StatelessWidget {
  final TextEditingController statusController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController discountRateController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  final TextEditingController offerableTypeController = TextEditingController();
  final TextEditingController offerableIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String offerabletype;
  String serviceId;

  AddOfferPage({required this.offerabletype, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    final addOfferWeb = AddOfferWeb();
    final addOfferCubit = AddOfferCubit(AddOfferWeb());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Offer', style: TextStyle(fontSize: 24)),
        backgroundColor: Color.fromARGB(255, 103, 194, 180),
        elevation: 4,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(constraints.maxWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('Status', statusController),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildTextField('Title', titleController),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildTextField('Description', descriptionController),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text('Start Date',
                      style:
                          TextStyle(color: Color.fromARGB(255, 76, 217, 186))),
                  TextFormField(
                      controller: startDateController,
                      decoration: InputDecoration(
                        labelText: 'Enter a start date',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a start date';
                        }

                        // Validate if the input is a valid date
                        final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
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
                      }),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text('End Date',
                      style:
                          TextStyle(color: Color.fromARGB(255, 76, 217, 186))),
                  TextFormField(
                      controller: endDateController,
                      decoration: InputDecoration(
                        labelText: 'Enter an end date',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an end date';
                        }

                        // Validate if the input is a valid date
                        final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
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
                      }),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildTextField(
                      'Discount Rate (number%)', discountRateController),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildTextField(
                      'Discount Value (number*100)', discountValueController),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final hoteListCubit = HotelListCubit.get(context);
                        hoteListCubit.cubitHotelList();
                        final usersDetailsCubit = AddOfferCubit.get(context);
                        usersDetailsCubit.cubitAddOffer(
                            statusController.text,
                            titleController.text,
                            descriptionController.text,
                            startDateController.text,
                            endDateController.text,
                            discountRateController.text,
                            discountValueController.text,
                            offerabletype,
                            serviceId);
                      }
                      if (offerabletype == 'hotels') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HotelListPage()));
                      } else if (offerabletype == 'trips') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TripListPage()));
                      } else if (offerabletype == 'flight') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FlightListPage()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5FCEB6),
                      foregroundColor: Colors.white,
                      shadowColor: Colors.black,
                      minimumSize: Size(double.infinity, 50), // Button size
                    ),
                    child: Text('Add Offer'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildTextField(String label, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $label';
      }
      return null;
    },
  );
}
