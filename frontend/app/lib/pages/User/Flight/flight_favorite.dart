import 'package:app/components/custom_snackbar.dart';
import 'package:app/components/flight_navigation_bar.dart';
import 'package:app/data/models/user_models/favorite_flight_list_model.dart';
import 'package:app/data/web_service/user/flight_remove_from_favorite_wev.dart';
import 'package:app/pages/User/Flight/flight_display.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightFavoriteCubit, FlightListState>(
        builder: (context, state) {
      final flights = FlightFavoriteCubit.get(context).flights;
      final flightRemoveFromFavoriteWeb = FlightRemoveFromFavoriteWeb();
      final flightRemoveFromFavoriteCubit =
          FlightRemoveFromFavoriteCubit(flightRemoveFromFavoriteWeb);
      final favoriteStatusCubit = context.watch<FlightAddToFavoriteCubit>();
      if (state is FlightFavoriteSuccess ||
          state is FlightRemoveFromFavoriteSuccess) {
        if (flights.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('No flight found in favorite.')),
            bottomNavigationBar: FlightBottomNavigationBarWidget(),
          );
        }
        return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Favorite Flights',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff5FCEB6),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Swipe Left to remove flights from favorite',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5FCEB6),
                      ),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: flights.length,
                      itemBuilder: (context, index) {
                        return FlightsListItem(
                          fmodel: flights[index],
                          onRemovePressed: () {
                            print('the id is :${flights[index].id}');
                            flightRemoveFromFavoriteCubit.RemoveFromFavorites(
                                flights[index].id);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: FlightBottomNavigationBarWidget());
      } else if (state is FlightFavoriteLoading) {
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
  final FlightFavoriteModel fmodel;

  final VoidCallback onRemovePressed;

  // bool get hasOffer {
  //   if (flight.offers.asMap() == '%0')
  //     return false;
  //   else
  //     return true;
  // }

  FlightsListItem({required this.fmodel, required this.onRemovePressed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(fmodel.id.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          onRemovePressed();

          showCustomSnackBar(context, '${fmodel.companyName} dismissed');
        },
        background: Container(
          color: Colors.red, // Background color when swiping
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: Card(
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
                            fmodel.departureTime,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            fmodel.arrivalTime,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Row(children: [
                            // Airplane icon
                            SizedBox(
                                width: 5), // Add spacing between icon and text
                            Text(
                              fmodel.companyName,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ])
                        ],
                      ),
                    ],
                  ),

                  // Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Colors.yellow,
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(8),
                  //         bottomRight: Radius.circular(8),
                  //       ),
                  //     ),
                  //     child: Text(
                  //        'Offer ${flight.offers}', // Use your flight data to get offer information
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),

              //  Row(
              //     children: [
              //       Icon(Icons.star, color: Colors.amber),
              //                 Text('${flight.finalRating}'),
              //     ],
              //   ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${fmodel.priceOfTickets}',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int id = fmodel.id;
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
        ));
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
