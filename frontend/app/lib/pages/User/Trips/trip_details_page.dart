import 'package:app/components/hotel_booking_dialog.dart';
import 'package:app/components/hotel_rating_dialog.dart';
import 'package:app/components/trip_booking_dialog.dart';
import 'package:app/components/trip_rating_dialog.dart';
import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_details_model.dart';
import 'package:app/pages/User/Hotels/room_details_page.dart';
import 'package:app/pages/User/cubits/trips/offer_cubit.dart';
import 'package:app/pages/User/cubits/trips/offer_state.dart';
import 'package:app/pages/User/cubits/trips/trip_details_cubit.dart';
import 'package:app/pages/User/cubits/trips/trip_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripDetailsPage extends StatelessWidget {
  int id;
  String hotelName;
  int hotelRating;
  String tripPrice;
  TripDetailsPage(
      {required this.id,
      required this.hotelName,
      required this.hotelRating,
      required this.tripPrice});
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    final tripDetailsCubit = BlocProvider.of<TripDetailsCubit>(context);
    tripDetailsCubit.cubitTripIdDetails(id);

    // final hotelOfferCubit = BlocProvider.of<HotelOfferCubit>(context);
    // final offer = hotelOfferCubit.offer;
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      builder: (context, state) {
        if (state is TripDetailsLoading) {
          // Show a loading indicator
          return Center(child: CircularProgressIndicator());
        } else if (state is TripDetailsSuccess) {
          final trip = TripDetailsCubit.get(context).trip;
          // final hotelRatingCubit = BlocProvider.of<HotelRatingCubit>(context);

          // int finalRating = hotelRatingCubit.myRating!.finalRating;

          final relativePhotoPaths = trip.relativePhotoPaths;
          final avtivities = trip.activity;
          print('$relativePhotoPaths');
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 251, 248, 223),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTop(context, relativePhotoPaths),
                  _buildBottom(
                      context, trip, hotelName, hotelRating, id, avtivities)
                ],
              ),
            ),
            bottomNavigationBar: ElevatedButton(
              onPressed: () {
                tShowBookingDialoge(context, () {}, id, tripPrice);
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
        } else if (state is TripDetailsFailure) {
          return Center(child: Text('Failed to fetch room details.'));
        } else {
          return Center(child: Text('Unknown state.'));
        }
      },
    );
  }

  Widget _buildTop(BuildContext context, List<String> relativePaths) {
    return Container(
      height: 600,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: relativePaths.length,
        itemBuilder: (context, photoIndex) {
          final tripPhotos = relativePaths[photoIndex];
          final photoUrl = '$imgUrl$tripPhotos';
          return Image.network(
            photoUrl,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildBottom(BuildContext context, TripDetailsModel trip,
      String tripName, int tripRating, int id, List<String> activities) {
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
                        Flexible(
                          child: Text(
                            '$hotelName',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // if (offer.offerDiscountRate != '%0')
                        BlocBuilder<TripOfferCubit, TripOfferState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                final hoteOfferCubit =
                                    BlocProvider.of<TripOfferCubit>(context);
                                hoteOfferCubit.cubitTripOffer(id);
                                if (state is TripOfferSuccess) {
                                  final offer =
                                      TripOfferCubit.get(context).offer;
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
                        showTripRatingDialog(context, (addedRating) {
                          print('User rated: $addedRating');
                        }, id);
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
                      'Location:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.tripLocation}'),
                    SizedBox(height: 20),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.descriptionTrip}'),
                    SizedBox(height: 20),
                    Text(
                      'Start Date:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.startDateTrip}'),
                    SizedBox(height: 20),
                    Text(
                      'End Date:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.endDateTrip}'),
                    SizedBox(height: 20),
                    Text(
                      'Maximum Participants:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.maximumParticipantsTrip}'),
                    SizedBox(height: 20),
                    Text(
                      'Duration:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.durationTrip}'),
                    SizedBox(height: 20),
                    Text(
                      'Start Age From:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('${trip.startAgeFormTrip}'),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Activities:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        for (var activity in activities)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.circle,
                                    size: 10, color: Colors.black),
                                SizedBox(width: 8),
                                Text(activity.toString()),
                              ],
                            ),
                          ),
                      ],
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
