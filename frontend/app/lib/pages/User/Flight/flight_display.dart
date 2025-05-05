import 'package:app/pages/User/Flight/flight_booking.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_details_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define a new StatefulWidget for the flights display page
class FlightDetailsPage extends StatelessWidget {
  final int id;

  FlightDetailsPage({required this.id});

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).primaryColor;

    return BlocBuilder<FlightDetailsCubit, FlightDetailsState>(
      builder: (context, state) {
        final flight = FlightDetailsCubit.get(context).flightdetails;

        return Scaffold(
          appBar: AppBar(
            title: Text('Flight Details'),
            backgroundColor: Color.fromARGB(255, 103, 194, 180),
          ),
          body: state is FlightDetailsSuccess && flight != null
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.skewY(-0.1),
                                      child: Image.asset(
                                        'assets/7xm.xyz667851.jpg',
                                        width: double.infinity,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Departure Time: ${flight.departureTime}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Arrival Time: ${flight.arrivalTime}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Final Rating: ${flight.finalRating}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 10),
                                BlocBuilder<FlightOfferCubit, FlightOfferState>(
                                  builder: (context, offerState) {
                                    final flightoffer =
                                        FlightOfferCubit.get(context).offer;
                                    if (offerState is FlightOfferLoading) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else if (offerState
                                        is FlightOfferSuccess) {
                                      return Expanded(
                                        child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            final flightoff =
                                                flightoffer[index];
                                            return ListTile(
                                              trailing: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Offer Details'),
                                                        content: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Description:',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            Text(
                                                                '${flightoff.description}'),
                                                            Text(
                                                              'Offer Start Date:',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            Text(
                                                                '${flightoff.startDate}'),
                                                            Text(
                                                              'Offer End Date:',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            Text(
                                                                '${flightoff.endDate}'),
                                                          ],
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child: Text('OK'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text('Details'),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              Divider(),
                                          itemCount: flightoffer.length,
                                        ),
                                      );
                                    } else {
                                      return ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<FlightOfferCubit>(
                                                  context)
                                              .cubitFlightOffer(id);
                                        },
                                        child: Text('Load Offers'),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                int id = flight.id;
                                String price = flight.priceOfTickets;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FlightsBookingPage(id: id,price: price,)),
                                );
                                // Handle booking action
                              },
                              child: Text(
                                'Booking Flight',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 194, 180)),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.white, // White background
                                side: BorderSide(
                                    color: Color.fromARGB(
                                        255, 103, 194, 180)), // Border color
                              ),
                            ),
                          ),
                          SizedBox(height: 20), // Add some space at the bottom
                        ],
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
