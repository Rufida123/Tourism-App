import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_trip_cubit.dart';
import 'package:web_dashbord/cubits/trip/trip_cubit.dart';
import 'package:web_dashbord/assest/data%20and%20model/trip_model.dart';
import 'package:web_dashbord/screens/add_offer_page.dart';
import 'package:web_dashbord/screens/edit_trip_in_page.dart';
import 'package:web_dashbord/screens/edit_trip_out_page.dart';

class TripListPage extends StatefulWidget {
  const TripListPage({super.key});

  @override
  State<TripListPage> createState() => _TripListPageState();
}

class _TripListPageState extends State<TripListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Trip",
        imageRoute: 'lib/assest/images/icons/ticket.png',
        backBotton: false,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            child: BlocBuilder<TripListCubit, TripListState>(
              builder: (context, state) {
                final trip = TripListCubit.get(context).list;

                if (state is TripListSuccess) {
                  return ListView.builder(
                    itemCount: trip.length,
                    itemBuilder: (context, index) {
                      return TripsListItem(trip: trip[index]);
                    },
                  );
                } else if (state is TripListLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Text('No data Available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TripsListItem extends StatelessWidget {
  final TripListModel trip;

  String get imgCompleteUrl {
    return '${trip.image.imageHttpLink}';
  }

  bool get hasOffer {
    if (trip.offer == '20%' || trip.offer == '%20') {
      return false;
    } else {
      return true;
    }
  }

  TripsListItem({required this.trip});

  @override
  Widget build(BuildContext context) {
    final isFavorite = trip.isFavorite;
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(maxHeight: 200),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgCompleteUrl,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 150,
                    color: Colors.grey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    width: 100,
                    height: 150,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              trip.name,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // FavoriteButton(
                          //   isFavorite: isFavorite,
                          //   onPressed: () {},
                          // ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Color(0xff5FCEB6)),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${trip.location}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.attach_money,
                                  color: Color(0xff5FCEB6)),
                              SizedBox(width: 6),
                              Text(
                                '${trip.price}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Color(0xff5FCEB6)),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${trip.phone}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {},
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
                  Positioned(
                    top: 20,
                    right: 0,
                    child: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert), // Three dots icon
                      onSelected: (value) {
                        // Handle menu item selection
                        if (value == 'Edit Service') {
                          // Handle edit action
                        } else if (value == 'Delete Service') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripListPage()));
                          final tripListCubit1 =
                              DeleteTripOutDetailsCubit.get(context);
                          tripListCubit1
                              .cubitDeleteTripOutDetails(trip.id.toString());
                          final tripListCubit = TripListCubit.get(context);
                          tripListCubit.cubitTripList();
                        } else if (value == 'Add Offer') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddOfferPage(
                                        offerabletype: 'trips',
                                        serviceId: trip.id.toString(),
                                      )));
                        } else if (value == 'Modyfiy Offer') {
                          // Handle delete action
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        final List<PopupMenuEntry<String>> menuItems = [
                          PopupMenuItem<String>(
                            value: 'Edit Service',
                            child: Text('Edit Service'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Delete Service',
                            child: Text('Delete Service'),
                          ),
                        ];

                        if (!hasOffer) {
                          menuItems.add(
                            PopupMenuItem<String>(
                              value: 'Add Offer',
                              child: Text('Add Offer'),
                            ),
                          );
                        }
                        if (hasOffer) {
                          menuItems.add(
                            PopupMenuItem<String>(
                              value: 'Modyfiy Offer',
                              child: Text('Modyfiy Offer'),
                            ),
                          );
                          menuItems.add(
                            PopupMenuItem<String>(
                              value: 'Delete Offer',
                              child: Text('Delete Offer'),
                            ),
                          );
                        }

                        return menuItems;
                      },
                    ),
                  ),
                  // Positioned(
                  //   top: 20,
                  //   right: 2,
                  //   child: PopupMenuButton<String>(
                  //     icon: Icon(Icons.more_vert), // Three dots icon
                  //     onSelected: (value) {
                  //       // Handle menu item selection
                  //       if (value == 'Edit Trip Out Details') {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => EditTripOutDetailsPage(
                  //                       tripId: trip.id.toString(),
                  //                     )));
                  //       } else if (value == 'Delete Service') {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => TripListPage()));
                  //         final tripListCubit1 =
                  //             DeleteTripOutDetailsCubit.get(context);
                  //         tripListCubit1
                  //             .cubitDeleteTripOutDetails(trip.id.toString());
                  //         final tripListCubit = TripListCubit.get(context);
                  //         tripListCubit.cubitTripList();
                  //       } else if (value == 'Edit Trip Inter Details') {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => EditTripInDetailsPage(
                  //                       tripId: trip.detailId.toString(),
                  //                     )));
                  //       } else if (value == 'Edit Trip Activities') {
                  //         // Handle delete action
                  //       } else if (value == 'Add Offer') {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => AddOfferPage(
                  //                       offerabletype: 'trips',
                  //                       serviceId: trip.id.toString(),
                  //                     )));
                  //       } else if (value == 'Modyfiy Offer') {
                  //         // Handle delete action
                  //       }
                  //     },
                  //     itemBuilder: (BuildContext context) {
                  //       final List<PopupMenuEntry<String>> menuItems = [
                  //         PopupMenuItem<String>(
                  //           value: 'Edit Trip Out Details',
                  //           child: Text('Edit Trip Out Details'),
                  //         ),
                  //         PopupMenuItem<String>(
                  //           value: 'Edit Trip Inter Details',
                  //           child: Text('Edit Trip Inter Details'),
                  //         ),
                  //         PopupMenuItem<String>(
                  //           value: 'Edit Trip Activities',
                  //           child: Text('Edit Trip Activities'),
                  //         ),
                  //         PopupMenuItem<String>(
                  //           value: 'Delete Service',
                  //           child: Text('Delete Service'),
                  //         ),
                  //       ];

                  //       if (!hasOffer) {
                  //         menuItems.add(
                  //           PopupMenuItem<String>(
                  //             value: 'Add Offer',
                  //             child: Text('Add Offer'),
                  //           ),
                  //         );
                  //       }
                  //       if (hasOffer) {
                  //         menuItems.add(
                  //           PopupMenuItem<String>(
                  //             value: 'Modyfiy Offer',
                  //             child: Text('Modyfiy Offer'),
                  //           ),
                  //         );
                  //         menuItems.add(
                  //           PopupMenuItem<String>(
                  //             value: 'Delete Offer',
                  //             child: Text('Delete Offer'),
                  //           ),
                  //         );
                  //       }

                  //       return menuItems;
                  //     },
                  //   ),
                  // ),
                  if (hasOffer)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                ],
              ),
            ),
          ],
        ),
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
  int fullStars = rating.floor();
  bool hasHalfStar = (rating - fullStars) >= 0.5;
  int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
  double starSize = 20.0;

  List<Widget> stars = List.generate(
    fullStars,
    (index) => Icon(Icons.star, color: Colors.yellow, size: starSize),
  );

  if (hasHalfStar) {
    stars.add(Icon(Icons.star_half, color: Colors.yellow, size: starSize));
  }

  stars.addAll(
    List.generate(
      emptyStars,
      (index) => Icon(Icons.star_border, color: Colors.yellow, size: starSize),
    ),
  );

  return Row(children: stars);
}
