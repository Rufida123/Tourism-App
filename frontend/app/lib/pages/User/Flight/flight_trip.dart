import 'dart:math';

import 'package:app/components/flight_navigation_bar.dart';
import 'package:app/components/flight_rating_dialog.dart';
import 'package:app/data/models/user_models/flight_details_model.dart';
import 'package:app/data/models/user_models/flight_list_model.dart';
import 'package:app/pages/User/Flight/filter_details.dart';
import 'package:app/pages/User/Flight/flight_display.dart';
import 'package:app/pages/User/Flight/flight_search.dart';
import 'package:app/pages/User/Flight/return_flight_page.dart';
import 'package:app/pages/User/cubits/flight_cubit/filter_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_details_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_rate_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_return_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTrip extends StatelessWidget {
  TextEditingController departureDateStartController = TextEditingController();
  TextEditingController departureDateEndController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController airlineNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Placeholder data for flights

  @override
  Widget build(BuildContext context) {
    // Define a list of airline company names and corresponding colors

    List<Color> airlineColors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.orange
    ];
    return BlocBuilder<FlightListCubit, FlightListState>(
        builder: (context, state) {
      final flights = FlightListCubit.get(context).flights;

      final flightRating = FlightRatingCubit.get(context).myRating;

      if (state is FlightListSuccess || state is FlightAddToFavoriteSuccess) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 40),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Find trip',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to the flight search page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlightSearchPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xff5FCEB6),
                              side: BorderSide(
                                  color: Color(0xff5FCEB6), width: 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 102, vertical: 15),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.search, color: Color(0xff5FCEB6)),
                                SizedBox(width: 8),
                                Text(
                                  'Search for a trip',
                                  style: TextStyle(
                                    color: Color(0xff5FCEB6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text('Filter Options'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Departure date field
                                          TextFormField(
                                            controller:
                                                departureDateStartController,
                                            decoration: InputDecoration(
                                              labelText: 'Departure Date',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter search query';
                                              }
                                              return null;
                                            },
                                            // Add logic to handle date selection
                                          ),
                                          SizedBox(height: 10),
                                          // Arrival date field
                                          TextFormField(
                                            controller:
                                                departureDateEndController,
                                            decoration: InputDecoration(
                                              labelText: 'Arrival Date',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter search query';
                                              }
                                              return null;
                                            },
                                            // Add logic to handle date selection
                                          ),
                                          SizedBox(height: 10),
                                          // Price range slider

                                          TextFormField(
                                            controller: minPriceController,
                                            decoration: InputDecoration(
                                              labelText: 'MinPrice',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter search query';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: maxPriceController,
                                            decoration: InputDecoration(
                                              labelText: 'MaxPrice',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter search query';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
// Airplane name field
                                          TextFormField(
                                            controller: airlineNameController,
                                            decoration: InputDecoration(
                                              labelText: 'Airplane Name',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 8, 145, 125),
                                                ),
                                              ),
                                            ),

                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter search query';
                                              }
                                              return null;
                                            },
                                            // Add logic to handle airplane name input
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Close the dialog when "Done" is pressed
                                          Navigator.of(context).pop();
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState!
                                                  .validate()) {
                                            final cubit = BlocProvider.of<
                                                FilterFlightCubit>(context);
                                            if (cubit != null) {
                                              cubit.cubitFilterFlight(
                                                departureDateStartController
                                                    .text,
                                                departureDateEndController.text,
                                                minPriceController.text,
                                                maxPriceController.text,
                                                airlineNameController.text,
                                              );
                                            }
                                          }
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FilterDetails(),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Done',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 122, 228, 214)),
                                        ),
                                      ),

                                      //        if (state is FilterFlightLoading)
                                      //   Center(child: CircularProgressIndicator())
                                      // else if (state is FilterFlightSuccess)
                                      //   Expanded(
                                      //     child: ListView.separated(
                                      //       itemBuilder: (context, index) {
                                      //         final flight = flights[index];
                                      //         return Card(
                                      //           child: ListTile(
                                      //             leading: Text(flight.departureAirport),
                                      //             title: Text(flight.arrivalAirport),
                                      //             subtitle: Text(flight.companyName),
                                      //           ),
                                      //         );
                                      //       },
                                      //       separatorBuilder: (context, index) => SizedBox(height: 20.0),
                                      //       itemCount: flights.length,
                                      //     ),
                                      //   ),
                                    ]);
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.menu,
                                      size: 40, color: Color(0xff5FCEB6)),
                                  SizedBox(width: 8),
                                  Text(
                                    'Add Filter',
                                    style: TextStyle(
                                        color: Color(0xff5FCEB6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final flightReturnListCubit =
                                FlightReturnListCubit.get(context);
                            flightReturnListCubit.cubitFlightReturnList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FlightReturnTrip(),
                              ),
                            );
                          },
                          child: Text(
                            'Show Return Flights',
                            style: TextStyle(
                              color: Color(0xff5FCEB6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            height: 450,
                            child: ListView.builder(
                                itemCount: flights.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FlightsListItem(
                                      flight: flights[index],
                                      index: index,
                                      flightRating: flightRating ?? 0);
                                }))
                      ])),
            ),
            bottomNavigationBar: FlightBottomNavigationBarWidget());
      } else if (state is FlightListLoading) {
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
    });
  }
}

class FlightsListItem extends StatelessWidget {
  final FlightListModel flight;

  final int flightRating;

  final int index;
  List<Color> airlineColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  FlightsListItem(
      {required this.flight, required this.index, required this.flightRating});
  @override
  Widget build(BuildContext context) {
    final favoriteStatusCubit = context.watch<FlightAddToFavoriteCubit>();
    final isFavorite = flight.isFavorite;
    final FlightDetailsModel flightdetails;

    return Card(
      elevation: 4,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/7xm.xyz667851.jpg', // Replace with the actual path to your airline logo image
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flight.departureTime,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        flight.arrivalTime,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Row(
                        children: [
                          Icon(Icons.airplanemode_active,
                              color: airlineColors[index %
                                  airlineColors.length]), // Airplane icon
                          SizedBox(
                              width: 5), // Add spacing between icon and text
                          Text(
                            flight.companyName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          FavoriteButton(
                            isFavorite: isFavorite,
                            onPressed: () {
                              favoriteStatusCubit.addToFavorites(flight.id);
                              print(
                                  'Flight ID: ${flight.id}, isFavorite: $isFavorite');
                              final flightListCubit =
                                  FlightListCubit.get(context);
                              flightListCubit.cubitFlightList();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: flight.discountRates.isNotEmpty
                      ? Text(
                          'Offer ${flight.discountRates}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              showRatingDialog(context, (addedRating) {
                print('User rated: $addedRating');
              }, flight.id);
            },
            child: Row(
              children: [
                buildStarRating(flightRating),
                Text(' ($flightRating)'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${flight.priceOfTickets}',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    final flightDetailsCubit = FlightDetailsCubit.get(context);
                    flightDetailsCubit.cubitFlightDetails(flight.id);
                    int id = flight.id;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlightDetailsPage(
                                id: id,
                              )),
                    );
                  },
                  child: Text(
                    'Show Details',
                    style: TextStyle(color: Color(0xff5FCEB6)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  FavoriteButton({required this.isFavorite, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: isFavorite ? Colors.red : null,
      onPressed: onPressed,
    );
  }
}

Widget buildStarRating(int rating) {
  // Calculate the number of full stars
  int fullStars = rating.floor();
  // Calculate if there is a half star
  bool hasHalfStar = (rating - fullStars) >= 0.5;
  // Calculate the number of empty stars
  int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
  double starSize = 20.0;
// Create a list of star icons
  List<Widget> stars = List.generate(
      fullStars,
      (index) => Icon(
            Icons.star,
            color: Colors.yellow,
            size: starSize,
          ));
  if (hasHalfStar) {
    stars.add(Icon(
      Icons.star_half,
      color: Colors.yellow,
      size: starSize,
    ));
  }
  stars.addAll(List.generate(
      emptyStars,
      (index) => Icon(
            Icons.star_border,
            color: Colors.yellow,
            size: starSize,
          )));

  return Row(children: stars);
}

class CircularStarClipper extends CustomClipper<Path> {
  final int numPoints;

  CircularStarClipper({this.numPoints = 12});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = size.width / 2;
    final double angleIncrement = 2 * pi / numPoints;

    for (int i = 0; i < numPoints; i++) {
      final double x = radius + radius * 0.8 * cos(i * angleIncrement);
      final double y = radius + radius * 0.8 * sin(i * angleIncrement);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
