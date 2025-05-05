import 'package:app/pages/User/cubits/flight_cubit/edit_reservation_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/reservation_page_cubit.dart';
import 'package:flutter/material.dart';

void FlightBookingDetailsDialog(
  BuildContext context,
  final int resId,
  final String numberOfAdults,
  final String numberOfChildren,
  final String phone,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Booking Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(context, 'Number Of Adults', numberOfAdults, resId),
            _buildDetailRow(
                context, 'Number Of Children', numberOfChildren, resId),
            _buildDetailRow(context, 'phone', phone, resId),
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
              String? numberOfAdults;
              String? numberOfChildren;
              String? phone;

              if (detailName == 'Number Of Adults') {
                numberOfAdults = updatedValue;
              } else if (detailName == 'Number Of Children') {
                numberOfChildren = updatedValue;
              } else if (detailName == 'phone') {
                phone = updatedValue;
              }

              FlightEditReservationCubit.get(context)
                  .cubitFlightEditReservation(
                      numberOfAdults, // Pass the existing reservation ID
                      numberOfChildren,
                      phone,
                      resId);
              Navigator.of(context).pop();
              final flightReservationPageCubit =
                  FlightReservationPageCubit.get(context);
              flightReservationPageCubit.cubitFlightReservationPage();
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
