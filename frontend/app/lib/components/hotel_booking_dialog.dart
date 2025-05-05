import 'package:app/components/shared_state_manager.dart';
import 'package:app/pages/User/cubits/hotels/booking%20_cubit.dart';
import 'package:app/pages/User/cubits/hotels/confirm_reservation_cubit.dart';
import 'package:flutter/material.dart';

void hShowBookingDialoge(
    BuildContext context, final VoidCallback onConfirm, int id, int price) {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController checkInDateController = TextEditingController();
  TextEditingController checkOutDateController = TextEditingController();
  TextEditingController numberOfDaysController = TextEditingController();
  TextEditingController numberOfRoomsController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      void submitBooking() {
        final hotelBookingCubit = HotelBookingCubit.get(context)
            .cubitHotelBooking(
                checkInDateController.text,
                checkOutDateController.text,
                numberOfDaysController.text,
                firstNameController.text,
                numberOfRoomsController.text,
                id);
        Navigator.of(context).pop();

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return HBookingConfirmation(
                price: price,
                onConfirm: onConfirm,
              );
            });
      }

      return AlertDialog(
        title: Text('Bokking Details',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff5FCEB6),
            )),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: numberOfDaysController,
                decoration: InputDecoration(
                  labelText: 'Number Of Days',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: numberOfRoomsController,
                decoration: InputDecoration(
                  labelText: 'Number Of Rooms',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: checkInDateController,
                decoration: InputDecoration(
                  labelText: 'Check-in Date (yyyy-MM-dd)',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: checkOutDateController,
                decoration: InputDecoration(
                  labelText: 'Check-out Date (yyyy-MM-dd)',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5FCEB6),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Book'),
            onPressed: submitBooking,
          ),
        ],
      );
    },
  );
}

class HBookingConfirmation extends StatelessWidget {
  final int price;
  final VoidCallback onConfirm;

  HBookingConfirmation({required this.price, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    void submitReservation() {
      int? resId = HreservationId.getId();
      final hotelReservationCubit = HotelReservationCubit.get(context);
      hotelReservationCubit.cubitHotelReservation(resId!);
      Navigator.of(context).pop();
    }

    return AlertDialog(
      title: Text('Confirm Booking'),
      content: Text('The total price is \$${price}. Do you want to proceed?'),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
            child: Text('Confirm'),
            onPressed: () {
              onConfirm();
              submitReservation();
            }),
      ],
    );
  }
}
