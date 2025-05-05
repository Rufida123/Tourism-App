import 'package:app/pages/User/cubits/hotels/edit_reservation_cubit.dart';
import 'package:app/pages/User/cubits/hotels/reservation_page_cubit.dart';
import 'package:flutter/material.dart';

void HotelBookingDetailsDialog(
  BuildContext context,
  final int resId,
  final String firstName,
  final String checkInDate,
  final String checkOutDate,
  final String numberOFday,
  final String numberRoom,
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
            _buildDetailRow(context, 'Check-in Date', checkInDate, resId),
            _buildDetailRow(context, 'Check-out Date', checkOutDate, resId),
            _buildDetailRow(context, 'Number Of Days', numberOFday, resId),
            _buildDetailRow(context, 'Number Of Rooms', numberRoom, resId),
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
              String? checkIn;
              String? checkOut;
              String? firstName;
              String? numberOFday;
              String? numberRoom;

              if (detailName == 'Check-in Date') {
                checkIn = updatedValue;
              } else if (detailName == 'Check-out Date') {
                checkOut = updatedValue;
              } else if (detailName == 'First Name') {
                firstName = updatedValue;
              } else if (detailName == 'Number Of Days') {
                numberOFday = updatedValue;
              } else if (detailName == 'Number Of Rooms') {
                numberRoom = updatedValue;
              }

              HotelEditReservationCubit.get(context).cubitHotelEditReservation(
                resId.toString(), // Pass the existing reservation ID
                checkIn,
                checkOut,
                numberOFday,
                firstName,
                numberRoom,
              );
              Navigator.of(context).pop();
              final hotelReservationPageCubit =
                  HotelReservationPageCubit.get(context);
              hotelReservationPageCubit.cubitHotelReservationPage();
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
