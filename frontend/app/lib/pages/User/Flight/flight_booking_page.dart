import 'package:app/components/flight_edit_reservation_dialog.dart';
import 'package:app/data/models/user_models/flight_reservation_page.dart';
import 'package:app/pages/User/Flight/navigation_bar.dart';
import 'package:app/pages/User/cubits/flight_cubit/reservation_page_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/reservation_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationFlightPage extends StatelessWidget {
  ReservationFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightReservationPageCubit, FlightReservationPageState>(
      builder: (context, state) {
        final reservations =
            FlightReservationPageCubit.get(context).reservations;
        if (state is FlightReservationPageSuccess) {
          if (reservations.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: Text('No reservations to show.')),
              bottomNavigationBar: FlightBottomNavigationBarWidget(),
            );
          }
          return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Flight Reservations',
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
              bottomNavigationBar: FlightBottomNavigationBarWidget());
        } else if (state is FlightReservationPageLoading) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator()),
              bottomNavigationBar: FlightBottomNavigationBarWidget());
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No data Available'),
            ),
            bottomNavigationBar: FlightBottomNavigationBarWidget(),
          );
        }
      },
    );
  }
}

class ReservationListItem extends StatelessWidget {
  final FlightReservationPageModel reservation;

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
                          'Number Of Adults: ',
                          style: TextStyle(
                              color: Color(0xff5FCEB6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          '${reservation.numOfAdult}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Number Of Children: ${reservation.numOfChild}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Phone Number: ${reservation.phone}',
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
                                    final hotelCancelReservationCubit =
                                        FlightCancelReservationCubit.get(
                                            context);
                                    hotelCancelReservationCubit
                                        .cubitFlightCancelReservation(
                                            reservation.id);
                                    Navigator.of(context).pop();
                                    final hotelReservationPageCubit =
                                        FlightReservationPageCubit.get(context);
                                    hotelReservationPageCubit
                                        .cubitFlightReservationPage(); // Dismiss the dialog
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
                          FlightBookingDetailsDialog(
                              context,
                              reservation.id,
                              reservation.numOfAdult.toString(),
                              reservation.numOfChild.toString(),
                              reservation.phone.toString());
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
