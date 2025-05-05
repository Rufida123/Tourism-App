import 'package:app/components/shared_state_manager.dart';
import 'package:app/pages/User/cubits/trips/booking_cubit.dart';
import 'package:app/pages/User/cubits/trips/confirm_reservaton_cubit.dart';
import 'package:flutter/material.dart';

void tShowBookingDialoge(
    BuildContext context, final VoidCallback onConfirm, int id, String price) {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberOfPeopleController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      void submitBooking() {
        final tripBookingCubit = TripBookingCubit.get(context).cubitTripBooking(
            firstNameController.text,
            lastNameController.text,
            numberOfPeopleController.text,
            notesController.text,
            id);
        Navigator.of(context).pop();

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return TBookingConfirmation(
                price: int.parse(price),
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
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
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
                controller: numberOfPeopleController,
                decoration: InputDecoration(
                  labelText: 'Number Of People',
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
                controller: notesController,
                decoration: InputDecoration(
                  labelText: 'Notes',
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

class TBookingConfirmation extends StatelessWidget {
  final int price;
  final VoidCallback onConfirm;

  TBookingConfirmation({required this.price, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    void submitReservation() {
      int? resId = TreservationId.getId();
      final tripReservationCubit = TripReservationCubit.get(context);
      tripReservationCubit.cubitTripReservation(resId!);
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
