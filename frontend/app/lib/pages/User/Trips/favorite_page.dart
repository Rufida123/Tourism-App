import 'package:app/components/custom_snackbar.dart';
import 'package:app/components/trip_bottom_navigation_bar_widget.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_favorite_list_model.dart';
import 'package:app/data/web_service/user/trip_remove_from_favorite_web.dart';
import 'package:app/pages/User/Trips/trip_details_page.dart';
import 'package:app/pages/User/cubits/trips/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripFavoriteCubit, TripListState>(
        builder: (context, state) {
      final trips = TripFavoriteCubit.get(context).trips;
      final hotelRemoveFromFavoriteWeb = TripRemoveFromFavoriteWeb();
      final hotelRemoveFromFavoriteCubit =
          TripRemoveFromFavoriteCubit(hotelRemoveFromFavoriteWeb);
      if (state is TripFavoriteSuccess ||
          state is TripRemoveFromFavoriteSuccess) {
        if (trips.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('No trips found in favorite.')),
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
                    'Favorite Hotels',
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
                    'Swipe Left to remove from favorite',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5FCEB6),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true, // Allow dynamic height
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      return TripListItem(
                        trip: trips[index],
                        onRemovePressed: () {
                          print('the id is :${trips[index].id}');
                          hotelRemoveFromFavoriteCubit.RemoveFromFavorites(
                              trips[index].id);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: TripBottomNavigationBarWidget());
      } else if (state is TripFavoriteLoading) {
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
    });
  }
}

class TripListItem extends StatelessWidget {
  final TripFavoriteModel trip;

  final VoidCallback onRemovePressed;
  String get imgCompleteUrl {
    return '$imgUrl${trip.photos.relativePath}';
  }

  bool get hasOffer {
    if (trip.offers.discountRate == '%0')
      return false;
    else
      return true;
  }

  TripListItem({required this.trip, required this.onRemovePressed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(trip.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onRemovePressed();
        showCustomSnackBar(context, '${trip.name} dismissed');
      },
      background: Container(
        color: Colors.red, // Background color when swiping
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
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
                          height: 15,
                        ),
                        Text(
                          trip.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                // visible: hasOffer, // Show the offer band only if offer > 0
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
                  String tripPrice = trip.price;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TripDetailsPage(
                                id: id,
                                hotelName: name,
                                hotelRating: rating,
                                tripPrice: tripPrice,
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
      ),
    );
  }
}
