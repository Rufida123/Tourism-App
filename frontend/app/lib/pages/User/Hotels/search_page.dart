import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/hotel_search_model.dart';
import 'package:app/pages/User/Hotels/filtering_page.dart';
import 'package:app/pages/User/Hotels/room_details_page.dart';
import 'package:app/pages/User/cubits/hotels/search_cubit.dart';
import 'package:app/pages/User/cubits/hotels/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSearchPage extends StatelessWidget {
  String? selectedSearchValue;
  HotelSearchPage({required this.selectedSearchValue});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelSearchFillterCubit, HotelSearchFillterState>(
        builder: (context, state) {
      final hotels = HotelSearchFillterCubit.get(context).hotels;

      return Scaffold(
        appBar: AppBar(
          title: Text('Search for a Hotel'),
          backgroundColor: Color(0xff5FCEB6),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search for $selectedSearchValue',
                    hintText: 'Enter $selectedSearchValue',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff5FCEB6), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please $selectedSearchValue';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedSearchValue == 'name') {
                        BlocProvider.of<HotelSearchFillterCubit>(context)
                            .cubitHotelSearchFillter(
                          searchController.text, // First variable
                          null, // location (second variable)
                          null, // roomType
                          null, // checkin
                          null, // checkout
                          null, // rating
                          null, // feature
                        );
                      } else if (selectedSearchValue == 'location') {
                        BlocProvider.of<HotelSearchFillterCubit>(context)
                            .cubitHotelSearchFillter(
                          null, // name (first variable)
                          searchController.text, // Second variable
                          null, // roomType
                          null, // checkin
                          null, // checkout
                          null, // rating
                          null, // feature
                        );
                      }
                    }
                  },
                  child: Text('Search',
                      style:
                          TextStyle(color: Color.fromARGB(255, 8, 145, 125))),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    String searchValue = searchController.text;
                    _showFilterDialog(
                        context, selectedSearchValue, searchValue);
                  },
                  child: Container(
                    height: 40,
                    color:
                        Colors.grey[200], // Set your desired background color
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu,
                            color: Color(
                                0xff5FCEB6)), // Replace with your square icon
                        SizedBox(width: 8),
                        Text(
                          'Add Filter',
                          style: TextStyle(
                              color: Color(0xff5FCEB6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ), // Optional label
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (state is HotelSearchFillterLoading)
                  Center(child: CircularProgressIndicator())
                else if (state is HotelSearchFillterSuccess)
                  Expanded(
                    child: ListView.separated(
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        return CustomHotelCard(hotel: hotels[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CustomHotelCard extends StatelessWidget {
  final HotelSearchFillterModel hotel;

  CustomHotelCard({required this.hotel});

  String get imgCompleteUrl {
    return '$imgUrl${hotel.image.relativePath}';
  }

  bool get hasOffer {
    if (hotel.offer.discountRate == '%0')
      return false;
    else
      return true;
  }

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

class FilterDialog extends StatefulWidget {
  final String selectedSearchValue;
  final String searchController;

  FilterDialog(
      {required this.selectedSearchValue, required this.searchController});
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedRoomType;
  String? selectedFeature;
  String? selectedRating;
  final TextEditingController checkInController = TextEditingController();
  final TextEditingController checkOutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedSearchValue = widget.selectedSearchValue;
    final searchController = widget.searchController;
    return AlertDialog(
      title: Text('Select Filters'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Room Type'),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedRoomType,
              onChanged: (newValue) {
                setState(() {
                  selectedRoomType = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                    value: 'DoubleRoom', child: Text('DoubleRoom')),
                DropdownMenuItem(
                    value: 'SingleRoom', child: Text('SingleRoom')),
                DropdownMenuItem(
                    value: 'StandardRoom', child: Text('StandardRoom')),
                DropdownMenuItem(value: 'Suite', child: Text('Suite')),
                DropdownMenuItem(
                    value: 'DeluxeRoom', child: Text('DeluxeRoom')),
                DropdownMenuItem(value: 'Studio', child: Text('Studio')),
                DropdownMenuItem(
                    value: 'FamilyRoom', child: Text('FamilyRoom')),
                DropdownMenuItem(
                    value: 'PresidentialSuite',
                    child: Text('PresidentialSuite')),
                DropdownMenuItem(
                    value: 'AccessibleRoom', child: Text('AccessibleRoom')),
                DropdownMenuItem(value: 'Villa', child: Text('Villa')),
                DropdownMenuItem(value: 'Studio', child: Text('Studio')),
              ],
            ),
            SizedBox(height: 16),
            Text('Room feature'),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedFeature,
              onChanged: (newValue) {
                setState(() {
                  selectedFeature = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                    value: 'Complimentary Wi-Fi',
                    child: Text('Complimentary Wi-Fi')),
                DropdownMenuItem(
                    value: 'Room Service', child: Text('Room Service')),
                DropdownMenuItem(
                    value: 'television', child: Text('television')),
                DropdownMenuItem(
                    value: 'Air Conditioning and Heating',
                    child: Text('Air Conditioning and Heating')),
                DropdownMenuItem(
                    value: 'Coffee Maker or Tea Service',
                    child: Text('Coffee Maker or Tea Service')),
                DropdownMenuItem(
                    value: 'Balcony or Terrace',
                    child: Text('Balcony or Terrace')),
                DropdownMenuItem(
                    value: 'Blackout Curtains',
                    child: Text('Blackout Curtains')),
                DropdownMenuItem(
                    value: 'Soundproof Windows',
                    child: Text('Soundproof Windows')),
                DropdownMenuItem(
                    value: 'Work Desk with Chair',
                    child: Text('Work Desk with Chair')),
                DropdownMenuItem(
                    value: 'Sofa or Sitting Area',
                    child: Text('Sofa or Sitting Area')),
              ],
            ),
            SizedBox(height: 16),
            Text('Room rating'),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedRating,
              onChanged: (newValue) {
                setState(() {
                  selectedRating = newValue!;
                  // Send the selectedRating to the backend
                  print('Selected rating: $selectedRating');
                });
              },
              items: List.generate(5, (index) {
                final ratingValue = index + 1;
                return DropdownMenuItem<String>(
                  value: ratingValue.toString(),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 8),
                      Text('$ratingValue stars'),
                    ],
                  ),
                );
              }),
            ),
            TextFormField(
              controller: checkInController,
              decoration: InputDecoration(
                labelText: 'Check-In Date: YYYY/MM/DD',
                labelStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: checkOutController,
              decoration: InputDecoration(
                labelText: 'Check-Out Date: YYYY/MM/DD',
                labelStyle: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            final roomType =
                selectedRoomType.toString().isEmpty ? null : selectedRoomType;
            final roomFeatue =
                selectedFeature.toString().isEmpty ? null : selectedFeature;
            final roomRating =
                selectedRating.toString().isEmpty ? null : selectedRating;
            final checkInDate =
                checkInController.text.isEmpty ? null : checkInController.text;
            final checkOutDate = checkOutController.text.isEmpty
                ? null
                : checkOutController.text;
            if (selectedSearchValue == 'name') {
              BlocProvider.of<HotelSearchFillterCubit>(context)
                  .cubitHotelSearchFillter(
                searchController, // First variable
                null, // location (second variable)
                roomType, // roomType
                checkInDate, // checkin
                checkOutDate, // checkout
                roomRating, // rating
                roomFeatue, // feature
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FillteringPage()));
            } else if (selectedSearchValue == 'location') {
              BlocProvider.of<HotelSearchFillterCubit>(context)
                  .cubitHotelSearchFillter(
                null, // name (first variable)
                searchController, // Second variable
                roomType, // roomType
                checkInDate, // checkin
                checkOutDate, // checkout
                roomRating, // rating
                roomFeatue, // feature
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FillteringPage()));
            }
          },
          child: Text('Apply Filters'),
        ),
      ],
    );
  }
}

void _showFilterDialog(BuildContext context, selectedSearchValue, searchValue) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FilterDialog(
        selectedSearchValue: selectedSearchValue,
        searchController: searchValue,
      );
    },
  );
}
