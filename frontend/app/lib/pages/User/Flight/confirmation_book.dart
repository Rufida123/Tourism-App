import 'package:app/components/shared_state_manager.dart';
import 'package:app/pages/User/cubits/flight_cubit/confirm_booking_cubit.dart';
import 'package:flutter/material.dart';

class ConfirmationBooking extends StatelessWidget {
  String phoneNumber;
  String adultNamber;
  String childernNumber;
  String price;

  ConfirmationBooking(
      {required this.adultNamber,
      required this.childernNumber,
      required this.phoneNumber,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: Text('Confirmation Booking'),
          backgroundColor: Color.fromARGB(255, 103, 194, 180),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                    maxHeight: 200.0,
                  ),
                  child: Card(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/7xm.xyz667851.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            myColor.withOpacity(0.2),
                            BlendMode.dstATop,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Adult Number: $adultNamber',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Children Number: $childernNumber',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Phone: $phoneNumber',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Price Of the Ticket: $price',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                int? resId = FreservationId.getId();
                                final flightReservationCubit =
                                    FlightReservationCubit.get(context);
                                flightReservationCubit
                                    .cubitFlightReservation(resId!);
                                    Navigator.pushNamedAndRemoveUntil(
              context, '/ReservationFlightPage', (Route<dynamic> route) => false);
                              },
                              child: Text(
                                'Confirm Reservation',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 103, 194, 180),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Color.fromARGB(255, 103, 194, 180),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))));
  }
}
