import 'package:app/components/custom_snackbar.dart';
import 'package:app/components/hotel_bottom_navigation_bar_widget.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_favorite_list_model.dart';
import 'package:app/data/web_service/user/hotel_remove_from_favorite_web.dart';
import 'package:app/pages/User/cubits/hotels/list_cubit.dart';
import 'package:app/pages/User/cubits/hotels/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelFavoriteCubit, HotelListState>(
        builder: (context, state) {
      final hotels = HotelFavoriteCubit.get(context).hotels;
      final hotelRemoveFromFavoriteWeb = HotelRemoveFromFavoriteWeb();
      final hotelRemoveFromFavoriteCubit =
          HotelRemoveFromFavoriteCubit(hotelRemoveFromFavoriteWeb);
      if (state is HotelFavoriteSuccess ||
          state is HotelRemoveFromFavoriteSuccess) {
        if (hotels.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('No hotels found in favorite.')),
            bottomNavigationBar: HotelBottomNavigationBarWidget(),
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
                    'Swipe Left to remove hotel from favorite',
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
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return HotelsListItem(
                        hotel: hotels[index],
                        onRemovePressed: () {
                          print('the id is :${hotels[index].id}');
                          hotelRemoveFromFavoriteCubit.RemoveFromFavorites(
                              hotels[index].id);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: HotelBottomNavigationBarWidget());
      } else if (state is HotelFavoriteLoading) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
            bottomNavigationBar: HotelBottomNavigationBarWidget());
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text('No data Available'),
          ),
          bottomNavigationBar: HotelBottomNavigationBarWidget(),
        );
      }
    });
  }
}

class HotelsListItem extends StatelessWidget {
  final HotelFavoriteModel hotel;

  final VoidCallback onRemovePressed;
  String get imgCompleteUrl {
    return '$imgUrl${hotel.photos.relativePath}';
  }

  bool get hasOffer {
    if (hotel.offers.discountRate == '%0')
      return false;
    else
      return true;
  }

  HotelsListItem({required this.hotel, required this.onRemovePressed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(hotel.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onRemovePressed();
        showCustomSnackBar(context, '${hotel.name} dismissed');
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
                        Text(
                          hotel.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: Color(0xff5FCEB6)),
                                Text('${hotel.location}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text('${hotel.finalRating}'),
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
                                    '${hotel.phone}',
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
                                    '${hotel.priceForNight}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ]),
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
                    'Offer ${hotel.offers.discountRate}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
