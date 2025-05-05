import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/assest/data%20and%20model/hotel_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delet_hotel_cubit.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_cubit.dart';
import 'package:web_dashbord/screens/add_offer_page.dart';
import 'package:web_dashbord/screens/edit_hotel_page.dart';
import 'package:web_dashbord/screens/edit_room_features_page.dart';
import 'package:web_dashbord/screens/edit_room_types_page.dart';
import 'package:web_dashbord/screens/edite_room_page.dart';
import 'package:web_dashbord/url_api.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Hotel",
        imageRoute: 'lib/assest/images/icons/hotel.png',
        backBotton: false,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            child: BlocBuilder<HotelListCubit, HotelListState>(
              builder: (context, state) {
                final hotel = HotelListCubit.get(context).hotels;

                if (state is HotelListSuccess) {
                  return ListView.builder(
                    itemCount: hotel.length,
                    itemBuilder: (context, index) {
                      return HotelsListItem(hotel: hotel[index]);
                    },
                  );
                } else if (state is HotelListLoading) {
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

class HotelsListItem extends StatelessWidget {
  final HotelListModel hotel;

  bool get hasOffer {
    if (hotel.offer == '0%' || hotel.offer == '%0') {
      return false;
    } else {
      return true;
    }
  }

  HotelsListItem({required this.hotel});

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
              child: Image.network(
                hotel.image.imageHttpLink,
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
                              hotel.name,
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
                                  '${hotel.location}',
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
                                '${hotel.price}',
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
                                  '${hotel.phone}',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditHotelPage(
                                        hotelId: hotel.id.toString(),
                                      )));
                        } else if (value == 'Delete Service') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotelListPage()));
                          final tripListCubit1 =
                              DeleteHotelOutDetailsCubit.get(context);
                          tripListCubit1
                              .cubitDeleteTripOutDetails(hotel.id.toString());
                          final tripListCubit = HotelListCubit.get(context);
                          tripListCubit.cubitHotelList();
                        } else if (value == 'Edit Room Details') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditRoomPage(
                                        hotelId: hotel.roomId.toString(),
                                      )));
                        } else if (value == 'Edit Room types') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditRoomTypePage(
                                        hotelId: hotel.roomId.toString(),
                                      )));
                        } else if (value == 'Edit Room features') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditRoomFeaturesPage(
                                        hotelId: hotel.roomId.toString(),
                                      )));
                        } else if (value == 'Add Offer') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddOfferPage(
                                        offerabletype: 'hotels',
                                        serviceId: hotel.id.toString(),
                                      )));
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
                          'Offer ${hotel.offer}',
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
