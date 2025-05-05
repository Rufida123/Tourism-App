import 'package:app/components/hotel_bottom_navigation_bar_widget.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_list_model.dart';
import 'package:app/pages/User/Hotels/room_details_page.dart';
import 'package:app/pages/User/Hotels/search_page.dart';
import 'package:app/pages/User/cubits/hotels/list_cubit.dart';
import 'package:app/pages/User/cubits/hotels/list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsListPage extends StatelessWidget {
  String? selectedSearchCriterion; // Declare selectedSearchCriterion

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
        builder: (context) => HotelSearchPage(
          selectedSearchValue:
              selectedSearchCriterion, // Pass the correct value
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelListCubit, HotelListState>(
        builder: (context, state) {
      final hotels = HotelListCubit.get(context).hotels;
      if (state is HotelListSuccess || state is HotelAddToFavoriteSuccess) {
        return Scaffold(
            body: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Find  Your Hotel',
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
                              'Search for a Hotel ',
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
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return HotelsListItem(hotel: hotels[index]);
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: HotelBottomNavigationBarWidget());
      } else if (state is HotelListLoading) {
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
  final HotelListModel hotel;
  String get imgCompleteUrl {
    return '$imgUrl${hotel.image.relativePath}';
  }

  bool get hasOffer {
    if (hotel.offer == '%0')
      return false;
    else
      return true;
  }

  HotelsListItem({required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favoriteStatusCubit = context.watch<HotelAddToFavoriteCubit>();
    final favoriteStatusCubite = context.watch<HotelRemoveFromFavoriteCubit>();
    final isFavorite = hotel.isFavorite;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          FavoriteButton(
                            isFavorite: isFavorite,
                            onPressed: () {
                              if (!isFavorite) {
                                favoriteStatusCubit.addToFavorites(hotel.id);
                                print(
                                    'Hotel ID: ${hotel.id}, isFavorite: $isFavorite');
                                final hotelListCubit =
                                    HotelListCubit.get(context);
                                hotelListCubit.cubitHotelList();
                              } else if (isFavorite) {
                                favoriteStatusCubite.RemoveFromFavorites(
                                    hotel.id);
                                final hotelListCubit =
                                    HotelListCubit.get(context);
                                hotelListCubit.cubitHotelList();
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Color(0xff5FCEB6)),
                              Text('${hotel.location}'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('${hotel.rating}'),
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
                                  '${hotel.price}',
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
                  'Offer ${hotel.offer}',
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
                int id = hotel.id;
                String name = hotel.name;
                int rating = hotel.rating;
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

// IconButton(
//                                   icon: state.favourites ?const Icon(Icons.favorite,color: Colors.red,):
//                                   const Icon(Icons.favorite_border),
//                                   onPressed: () {
//                                     if(state.favourites)
//                                       {
//                                         context.read<NotesBloc>().add(NoteFavouritesClicked(favourites: false,
//                                             index: index));
//                                       }else{
//                                       context.read<NotesBloc>().add(NoteFavouritesClicked
//                                         (favourites: true, index: index,));
//                                     }
//                                   },),

class SearchDialog extends StatelessWidget {
  final Function(String?) onSearchCriterionSelected;

  SearchDialog({required this.onSearchCriterionSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose what to search for'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Search by Name'),
            onTap: () {
              onSearchCriterionSelected('name');
              Navigator.pop(context); // Close the dialog
            },
          ),
          ListTile(
            title: Text('Search by Location'),
            onTap: () {
              onSearchCriterionSelected('location');
              Navigator.pop(context); // Close the dialog
            },
          ),
        ],
      ),
    );
  }
}
