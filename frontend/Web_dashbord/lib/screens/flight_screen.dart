import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/assest/data%20and%20model/flight_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_flight_cubit.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_list_cubit.dart';
import 'package:web_dashbord/screens/add_offer_page.dart';
import 'package:web_dashbord/screens/flight_return_screen.dart';

class FlightListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       final flightReturnListCubit = FlightReturnListCubit.get(context);
          //       flightReturnListCubit.cubitFlightReturnList();
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => FlightReturnListPage(),
          //         ),
          //       );
          //     },
          //     child: Text('Show Return Flights',style: TextStyle(color: Color.fromARGB(255, 147, 221, 203)),),
          //   ),
          // ),
          // // الشريط العلوي
          CustomAppbar(
            title: "Flight",
            imageRoute: 'lib/assest/images/icons/plane (2).png',
            backBotton: false,
          ),
          // باقي الصفحة
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: LeftSlider(),
                ),
                Expanded(
                  child: BlocBuilder<FlightListCubit, FlightListState>(
                    builder: (context, state) {
                      final flight = FlightListCubit.get(context).flights;

                      if (state is FlightListSuccess) {
                        return ListView.builder(
                          itemCount: flight.length,
                          itemBuilder: (context, index) {
                            return FlightsListItem(
                                flight: flight[index], index: index);
                          },
                        );
                      } else if (state is FlightListLoading) {
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
          ),
        ],
      ),
    );
  }
}

class FlightsListItem extends StatelessWidget {
  final FlightListModel flight;
  final int index;

  List<Color> airlineColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  FlightsListItem({required this.flight, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(maxHeight: 200),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/assest/images/flight_plane.jpg', // استبدل بمسار صورة الشعار الفعلي
                width: 80, // تصغير عرض الصورة
                height: 80, // تصغير ارتفاع الصورة
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: Text(
                      //         flight.,
                      //         style: TextStyle(
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //         overflow: TextOverflow.ellipsis,
                      //       ),
                      //     ),
                      //     // FavoriteButton(
                      //     //   isFavorite: isFavorite,
                      //     //   onPressed: () {},
                      //     // ),
                      //   ],
                      // ),
                      SizedBox(height: 10),
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
                              Icon(
                                Icons.airplanemode_active,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                flight.companyName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
                          onTap: () {
                            //                  int id = trip.id;
                            //                 String name = trip.name;
                            //                int rating = trip.rating;
                            //                  String price = trip.price;
                            //                Navigator.push(context, MaterialPageRoute(builder: (context) => TripDetailsPage(id: id,tripPrice: price,
                            //             )));
                            //  final tripDetailsCubit = TripDetailsCubit.get(context);
                            // tripDetailsCubit.cubitTripIdDetails(id);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${flight.priceOfTickets}',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
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
                        if (value == 'Edit Hotel Details') {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EditHotelPage(
                          //               hotelId: hotel.id.toString(),
                          //             )));
                        } else if (value == 'Delete Service') {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => HotelListPage()));
                          //   final tripListCubit1 =
                          //       DeleteHotelOutDetailsCubit.get(context);
                          //   tripListCubit1
                          //       .cubitDeleteTripOutDetails(hotel.id.toString());
                          //   final tripListCubit = HotelListCubit.get(context);
                          //   tripListCubit.cubitHotelList();
                          // } else if (value == 'Edit Room Details') {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => EditRoomPage(
                          //                 hotelId: hotel.roomId.toString(),
                          //               )));
                        } else if (value == 'Edit Room types') {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EditRoomTypePage(
                          //               hotelId: hotel.roomId.toString(),
                          //             )));
                        } else if (value == 'Edit Room features') {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EditRoomFeaturesPage(
                          //               hotelId: hotel.roomId.toString(),
                          //             )));
                        } else if (value == 'Add Offer') {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AddOfferPage(
                          //               offerabletype: 'hotels',
                          //               serviceId: hotel.id.toString(),
                          //             )));
                        } else if (value == 'Modyfiy Offer') {
                          // Handle delete action
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        final List<PopupMenuEntry<String>> menuItems = [
                          PopupMenuItem<String>(
                            value: 'Edit Hotel Details',
                            child: Text('Edit Hotel Details'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Edit Room Details',
                            child: Text('Edit Room Details'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Edit Room types',
                            child: Text('Edit Room types'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Edit Room features',
                            child: Text('Edit Hotel Details'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Delete Service',
                            child: Text('Delete Service'),
                          ),
                        ];

                        // if (!hasOffer) {
                        //   menuItems.add(
                        //     PopupMenuItem<String>(
                        //       value: 'Add Offer',
                        //       child: Text('Add Offer'),
                        //     ),
                        //   );
                        // }
                        // if (hasOffer) {
                        //   menuItems.add(
                        //     PopupMenuItem<String>(
                        //       value: 'Modyfiy Offer',
                        //       child: Text('Modyfiy Offer'),
                        //     ),
                        //   );
                        //   menuItems.add(
                        //     PopupMenuItem<String>(
                        //       value: 'Delete Offer',
                        //       child: Text('Delete Offer'),
                        //     ),
                        //   );
                        // }

                        return menuItems;
                      },
                    ),
                  ),
                  // if (hasOffer)
                  //   Positioned(
                  //     top: 0,
                  //     right: 0,
                  //     child: Container(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //       decoration: BoxDecoration(
                  //         color: Colors.orange,
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(8),
                  //           bottomRight: Radius.circular(8),
                  //         ),
                  //       ),
                  //       child: Text(
                  //         'Offer ${hotel.offer}',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
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
    (index) => Icon(
      Icons.star,
      color: Colors.yellow,
      size: starSize,
    ),
  );

  if (hasHalfStar) {
    stars.add(
      Icon(
        Icons.star_half,
        color: Colors.yellow,
        size: starSize,
      ),
    );
  }

  stars.addAll(
    List.generate(
      emptyStars,
      (index) => Icon(
        Icons.star_border,
        color: Colors.yellow,
        size: starSize,
      ),
    ),
  );

  return Row(children: stars);
}
