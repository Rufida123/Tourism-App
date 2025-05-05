import 'package:app/pages/User/cubits/trips/edit_reservation_cubit.dart';
import 'package:app/pages/User/cubits/trips/reservation_page_cubit.dart';
import 'package:flutter/material.dart';

void TripBookingDetailsDialog(
  BuildContext context,
  final int resId,
  final String numberOfPeople,
  final String firstName,
  final String lastName,
  final String notes,

) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Booking Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(context, 'First Name', firstName, resId),
            _buildDetailRow(context, 'Last Name', lastName, resId),
            _buildDetailRow(context, 'Number Of Peaple', numberOfPeople, resId),
            _buildDetailRow(context, 'Notes', notes, resId),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildDetailRow(
    BuildContext context, String label, String value, int resId) {
  TextEditingController controller = TextEditingController(text: value);

  return Row(
    children: [
      Expanded(child: Text('$label: $value')),
      TextButton(
        child: Text('Modify'),
        onPressed: () {
          _showEditDialog(context, label, controller, resId);
        },
      ),
    ],
  );
}

void _showEditDialog(BuildContext context, String detailName,
    TextEditingController controller, int resId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit $detailName'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: detailName,
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Save'),
            onPressed: () {
              final updatedValue = controller.text;

              // Determine which parameter to update based on the detailName
              String? firstName;
              String? lastName;
              String? numberOfPeople;
              String? notes;

              if (detailName == 'First Name') {
                firstName = updatedValue;
              } else if (detailName == 'Last Name') {
                lastName = updatedValue;
              } else if (detailName == 'Number Of Peaple') {
                numberOfPeople = updatedValue;
              } else if (detailName == 'Notes') {
                notes = updatedValue;
              } 

              TripEditReservationCubit.get(context).cubitTripEditReservation(
                resId.toString(), // Pass the existing reservation ID
                numberOfPeople,
                firstName,
                lastName,
                notes,
              );
              Navigator.of(context).pop();
              final tripReservationPageCubit =
                  TripReservationPageCubit.get(context);
              tripReservationPageCubit.cubitTripReservationPage();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}