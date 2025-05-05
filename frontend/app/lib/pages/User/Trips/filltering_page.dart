import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_search_model.dart';
import 'package:app/pages/User/Hotels/room_details_page.dart';
import 'package:app/pages/User/cubits/trips/search_cubit.dart';
import 'package:app/pages/User/cubits/trips/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripFillteringPage extends StatelessWidget {
  const TripFillteringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripSearchFillterCubit, TripSearchFillterState>(
      builder: (context, state) {
        final trips = TripSearchFillterCubit.get(context).trips;
        if (state is TripSearchFillterLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filtering Results'),
              backgroundColor: Color(0xff5FCEB6),
            ),
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TripSearchFillterSuccess) {
          if (trips.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Filtering Results'),
                backgroundColor: Color(0xff5FCEB6),
              ),
              backgroundColor: Colors.white,
              body: Center(child: Text('No results to show.')),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filtering Results'),
              backgroundColor: Color(0xff5FCEB6),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true, // Allow dynamic height
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      return TripsListItem(trip: trips[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filtering Results'),
              backgroundColor: Color(0xff5FCEB6),
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No data Available'),
            ),
          );
        }
      },
    );
  }
}

class TripsListItem extends StatelessWidget {
  final TripSearchFilterModel trip;
  String get imgCompleteUrl {
    return '$imgUrl${trip.photo.relativePath}';
  }

  bool get hasOffer {
    if (trip.offers.discountRate == '%0')
      return false;
    else
      return true;
  }

  TripsListItem({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgCompleteUrl,
                    width: 100,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        trip.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: Color(0xff5FCEB6)),
                                Flexible(
                                    child: Text(
                                  '${trip.location}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('${trip.finalRating}'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Color(0xff5FCEB6),
                                ),
                                Text(
                                  '${trip.phone}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Color(0xff5FCEB6),
                                ),
                                Text(
                                  '${trip.price}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Visibility(
              visible: hasOffer, // Show the offer band only if offer > 0
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  'Offer ${trip.offers.discountRate}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 8,
            child: InkWell(
              onTap: () {
                int id = trip.id;
                String name = trip.name;
                int rating = trip.finalRating;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoomDetailsPage(
                              id: id,
                              hotelName: name,
                              hotelRating: rating,
                            )));
              },
              child: Text(
                'Show Details',
                style: TextStyle(
                  color: Color(0xff5FCEB6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
