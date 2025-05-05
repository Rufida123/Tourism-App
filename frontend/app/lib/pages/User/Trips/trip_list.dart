import 'package:app/components/trip_bottom_navigation_bar_widget.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_list_model.dart';
import 'package:app/pages/User/Trips/search_page.dart';
import 'package:app/pages/User/Trips/trip_details_page.dart';
import 'package:app/pages/User/cubits/trips/list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsListPage extends StatelessWidget {
  String? selectedSearchCriterion;

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Choose what to search for',
            style: TextStyle(
                color: Color(0xff5FCEB6), fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Search by Name'),
                onTap: () {
                  selectedSearchCriterion =
                      'name'; // Update selectedSearchCriterion
                  Navigator.pop(context); // Close the dialog
                  _navigateToSearchPage(context);
                },
              ),
              ListTile(
                title: Text('Search by Location'),
                onTap: () {
                  selectedSearchCriterion =
                      'location'; // Update selectedSearchCriterion
                  Navigator.pop(context); // Close the dialog
                  _navigateToSearchPage(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TripSearchPage(
          selectedSearchValue:
              selectedSearchCriterion, // Pass the correct value
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripListCubit, TripListState>(builder: (context, state) {
      final trip = TripListCubit.get(context).trips;
      if (state is TripListSuccess) {
        return Scaffold(
            body: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Find  Your Trip',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      _showSearchDialog(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff5FCEB6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search, size: 40, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Search for a Trip ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true, // Allow dynamic height
                    itemCount: trip.length,
                    itemBuilder: (context, index) {
                      return TripsListItem(trip: trip[index]);
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: TripBottomNavigationBarWidget());
      } else if (state is TripListLoading) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: CircularProgressIndicator()),
          // bottomNavigationBar: HotelBottomNavigationBarWidget());
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text('No data Available'),
          ),
          // bottomNavigationBar: HotelBottomNavigationBarWidget(),
        );
      }
    });
  }
}

class TripsListItem extends StatelessWidget {
  final TripListModel trip;
  String get imgCompleteUrl {
    return '$imgUrl${trip.image.relativePath}';
  }

  bool get hasOffer {
    if (trip.offer == '%0')
      return false;
    else
      return true;
  }

  TripsListItem({required this.trip});

  @override
  Widget build(BuildContext context) {
    final favoriteStatusCubit = context.watch<TripAddToFavoriteCubit>();
    final favoriteStatusCubite = context.watch<TripRemoveFromFavoriteCubit>();
    final isFavorite = trip.isFavorite;
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
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              trip.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          FavoriteButton(
                            isFavorite: isFavorite,
                            onPressed: () {
                              if (!isFavorite) {
                                favoriteStatusCubit.addToFavorites(trip.id);
                                print(
                                    'Hotel ID: ${trip.id}, isFavorite: $isFavorite');
                                final tripListCubit =
                                    TripListCubit.get(context);
                                tripListCubit.cubitTripList();
                              } else if (isFavorite) {
                                favoriteStatusCubite.RemoveFromFavorites(
                                    trip.id);
                                final tripListCubit =
                                    TripListCubit.get(context);
                                tripListCubit.cubitTripList();
                              }
                            },
                          ),
                        ],
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
                              Text('${trip.rating}'),
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
                        height: 15,
                      ),
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
                  'Offer ${trip.offer}',
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
                int rating = trip.rating;
                String price = trip.price;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TripDetailsPage(
                              id: id,
                              hotelName: name,
                              hotelRating: rating,
                              tripPrice: price,
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
