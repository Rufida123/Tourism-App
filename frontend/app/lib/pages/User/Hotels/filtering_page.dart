import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_search_model.dart';
import 'package:app/pages/User/Hotels/room_details_page.dart';
import 'package:app/pages/User/cubits/hotels/search_cubit.dart';
import 'package:app/pages/User/cubits/hotels/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FillteringPage extends StatelessWidget {
  const FillteringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelSearchFillterCubit, HotelSearchFillterState>(
      builder: (context, state) {
        final hotels = HotelSearchFillterCubit.get(context).hotels;
        if (state is HotelSearchFillterLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filtering Results'),
              backgroundColor: Color(0xff5FCEB6),
            ),
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HotelSearchFillterSuccess) {
          if (hotels.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Filtering Results'),
                backgroundColor: Color(0xff5FCEB6),
              ),
              backgroundColor: Colors.white,
              body: Center(child: Text('No hotels found in favorite.')),
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
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return HotelsListItem(hotel: hotels[index]);
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

class HotelsListItem extends StatelessWidget {
  final HotelSearchFillterModel hotel;
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
                      Text(
                        hotel.name,
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
                                  '${hotel.location}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                            ),
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
                  'Offer ${hotel.offer.discountRate}',
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
