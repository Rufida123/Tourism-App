import 'dart:math';

import 'package:app/components/hotel_booking_dialog.dart';
import 'package:app/components/hotel_rating_dialog.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_room_details_model.dart';
import 'package:app/pages/User/cubits/hotels/offer_cubit.dart';
import 'package:app/pages/User/cubits/hotels/offer_state.dart';
import 'package:app/pages/User/cubits/hotels/room_details_cubit.dart';
import 'package:app/pages/User/cubits/hotels/room_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomDetailsPage extends StatelessWidget {
  int id;
  String hotelName;
  int hotelRating;
  RoomDetailsPage(
      {required this.id, required this.hotelName, required this.hotelRating});
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    final roomDetailsCubit = BlocProvider.of<RoomDetailsCubit>(context);
    roomDetailsCubit.cubitRoomDetails(id);

    // final hotelOfferCubit = BlocProvider.of<HotelOfferCubit>(context);
    // final offer = hotelOfferCubit.offer;
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return BlocBuilder<RoomDetailsCubit, RoomDetailsState>(
      builder: (context, state) {
        if (state is RoomDetailsLoading) {
          // Show a loading indicator
          return Center(child: CircularProgressIndicator());
        } else if (state is RoomDetailsSuccess) {
          final room = RoomDetailsCubit.get(context).room;
          // final hotelRatingCubit = BlocProvider.of<HotelRatingCubit>(context);

          // int finalRating = hotelRatingCubit.myRating!.finalRating;

          final relativePhotoPaths = room.relativePhotoPaths;
          final roomFeatures = room.roomFeatures;
          final roomTypes = room.roomTypes;
          print('$relativePhotoPaths');
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 251, 248, 223),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTop(context, relativePhotoPaths),
                  _buildBottom(context, room, roomFeatures, roomTypes,
                      hotelName, hotelRating)
                ],
              ),
            ),
            bottomNavigationBar: ElevatedButton(
              onPressed: () {
                hShowBookingDialoge(context, () {}, id, room.price);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5FCEB6),
                foregroundColor: Colors.white,
                shadowColor: Colors.black,
                minimumSize: Size(double.infinity, 50), // Button size
              ),
              child: Text('Book Now',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          );
        } else if (state is RoomDetailsFailure) {
          return Center(child: Text('Failed to fetch room details.'));
        } else {
          return Center(child: Text('Unknown state.'));
        }
      },
    );
  }

  Widget _buildTop(BuildContext context, List<String> relativePaths) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: relativePaths.length,
        itemBuilder: (context, photoIndex) {
          final roomPhotos = relativePaths[photoIndex];
          final photoUrl = '$imgUrl$roomPhotos';
          return Image.network(
            photoUrl,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildBottom(
      BuildContext context,
      RoomDetailsModel room,
      List<String> features,
      List<String> types,
      String hotelName,
      int hotelRating) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: Color.fromARGB(255, 251, 248, 223),
          width: mediaSize.width,
          height: 500,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32, left: 32, right: 32, bottom: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$hotelName',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        // if (offer.offerDiscountRate != '%0')
                        BlocBuilder<HotelOfferCubit, HotelOfferState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                final hoteOfferCubit =
                                    BlocProvider.of<HotelOfferCubit>(context);
                                hoteOfferCubit.cubitHotelOffer(id);
                                if (state is HotelOfferSuccess) {
                                  final offer =
                                      HotelOfferCubit.get(context).offer;
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Offer Details'),
                                        content: Column(
                                          children: [
                                            Text(
                                              'Description:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text('${offer.offerDescription}'),
                                            Text(
                                              'Offer Start Date:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'Offer End Date:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text('${offer.offerEndDate}'),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: ClipPath(
                                clipper: CircularStarClipper(),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.orange, // Customize the color
                                  child: Center(
                                    child: Text(
                                      'Offer Details',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showHotelRatingDialog(context, (addedRating) {
                          print('User rated: $addedRating');
                        }, room.id);
                      },
                      child: Row(
                        children: [
                          buildStarRating(hotelRating),
                          Text(' ($hotelRating'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${room.description}'),
                    Text(
                      'Advantages:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: features.map((feature) {
                          return Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 205, 205, 205), // Gray background color
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text('• $feature'),
                          );
                        }).toList(),
                      ),
                    ),
                    Text(
                      'Room Type:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: types.map((type) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text('• $type'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildStarRating(int rating) {
    // Calculate the number of full stars
    int fullStars = rating.floor();
    // Calculate if there is a half star
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    // Calculate the number of empty stars
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    // Create a list of star icons
    List<Widget> stars = List.generate(
        fullStars, (index) => Icon(Icons.star, color: Colors.amber));
    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, color: Colors.amber));
    }
    stars.addAll(List.generate(
        emptyStars, (index) => Icon(Icons.star_border, color: Colors.amber)));

    // Return the row of star icons
    return Row(children: stars);
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false; // Initial favorite status

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: isFavorite
          ? Colors.red
          : null, // Color the heart red if it's a favorite
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; // Toggle the favorite status
        });
        // Add additional logic if needed, such as updating a list or saving the status
      },
    );
  }
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
