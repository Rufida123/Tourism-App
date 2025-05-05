import 'package:app/components/trip_bottom_navigation_bar_widget.dart';
import 'package:app/components/trip_edit_reservation_dialog.dart';
import 'package:app/data/models/user_models/trip_reservation_page_model.dart';
import 'package:app/pages/User/cubits/trips/reservation_page_cubit.dart';
import 'package:app/pages/User/cubits/trips/reservation_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationTripPage extends StatelessWidget {
  ReservationTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripReservationPageCubit, TripReservationPageState>(
      builder: (context, state) {
        final reservations =
            TripReservationPageCubit.get(context).Treservations;
        if (state is TripReservationPageSuccess) {
          if (reservations.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: Text('No reservations to show.')),
              bottomNavigationBar: TripBottomNavigationBarWidget(),
            );
          }
          return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Hotel Reservations',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true, // Allow dynamic height
                      itemCount: reservations.length,
                      itemBuilder: (context, index) {
                        return ReservationListItem(
                            reservation: reservations[index]);
                      },
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: TripBottomNavigationBarWidget());
        } else if (state is TripReservationPageLoading) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator()),
              bottomNavigationBar: TripBottomNavigationBarWidget());
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No data Available'),
            ),
            bottomNavigationBar: TripBottomNavigationBarWidget(),
          );
        }
      },
    );
  }
}

class ReservationListItem extends StatelessWidget {
  // final ReservationDetails reservation;
  final TripReservationPageModel reservation;

  ReservationListItem({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'First Name: ',
                          style: TextStyle(
                              color: Color(0xff5FCEB6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          reservation.firstName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Last Name: ${reservation.lastName}',
                      style: TextStyle(
                          color: Color(0xff5FCEB6),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Number of people: ${reservation.numberOfPeople}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'notes: ${reservation.notes}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Cancel Reservation'),
                              content: Text(
                                  'Are you sure you want to cancel your reservation?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Dismiss the dialog
                                  },
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    final tripCancelReservationCubit =
                                        TripCancelReservationCubit.get(context);
                                    tripCancelReservationCubit
                                        .cubitHotelCancelReservation(
                                            reservation.id);
                                    Navigator.of(context).pop();
                                    final hotelReservationPageCubit =
                                        TripReservationPageCubit.get(context);
                                    hotelReservationPageCubit
                                        .cubitTripReservationPage(); // Dismiss the dialog
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5FCEB6),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black, // Button size
                          maximumSize: Size(180, 40)),
                      child: Text('Cancel Reservation',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          TripBookingDetailsDialog(
                              context,
                              reservation.id,
                              reservation.numberOfPeople,
                              reservation.firstName,
                              reservation.lastName,
                              reservation.notes,
                              );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff5FCEB6),
                            foregroundColor: Colors.white,
                            shadowColor: Colors.black,
                            minimumSize: Size(180, 40),
                            maximumSize: Size(200, 40)),
                        child: Text(
                          'Edite Reservation',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
