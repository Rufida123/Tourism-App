import 'package:app/constants/constants.dart';
import 'package:app/data/models/user_models/trip_search_model.dart';
import 'package:app/pages/User/Trips/filltering_page.dart';
import 'package:app/pages/User/Trips/trip_details_page.dart';
import 'package:app/pages/User/cubits/trips/search_cubit.dart';
import 'package:app/pages/User/cubits/trips/search_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripSearchPage extends StatelessWidget {
  String? selectedSearchValue;
  TripSearchPage({required this.selectedSearchValue});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripSearchFillterCubit, TripSearchFillterState>(
        builder: (context, state) {
      final trips = TripSearchFillterCubit.get(context).trips;

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
                        BlocProvider.of<TripSearchFillterCubit>(context)
                            .cubitTripSearchFillter(
                          searchController.text,
                          null,
                          null,
                          null,
                          null,
                          null,
                        );
                      } else if (selectedSearchValue == 'location') {
                        BlocProvider.of<TripSearchFillterCubit>(context)
                            .cubitTripSearchFillter(
                          null,
                          null,
                          null,
                          null,
                          null,
                          searchController.text,
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
                if (state is TripSearchFillterLoading)
                  Center(child: CircularProgressIndicator())
                else if (state is TripSearchFillterSuccess)
                  Expanded(
                    child: ListView.separated(
                      itemCount: trips.length,
                      itemBuilder: (context, index) {
                        return CustomTripCard(trip: trips[index]);
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

class CustomTripCard extends StatelessWidget {
  final TripSearchFilterModel trip;

  CustomTripCard({required this.trip});

  String get imgCompleteUrl {
    return '$imgUrl${trip.photo.relativePath}';
  }

  bool get hasOffer {
    if (trip.offers.discountRate == '%0')
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
                      SizedBox(height: 10),
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
                        height: 10,
                      )
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
                int id = trip.id;
                String name = trip.name;
                int rating = trip.finalRating;
                String tripPrice = trip.price.toString();
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
  String? selectedRating;

  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();

  String? SelectedTripType;

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
            Text('Trip Type'),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: SelectedTripType,
              onChanged: (newValue) {
                setState(() {
                  SelectedTripType = newValue!;
                });
              },
              items: [
                DropdownMenuItem(value: 'natural', child: Text('natural')),
                DropdownMenuItem(value: 'Naval', child: Text('Naval')),
                DropdownMenuItem(
                    value: 'archaeological', child: Text('archaeological')),
                DropdownMenuItem(value: 'religious', child: Text('religious')),
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
              controller: maxPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'MaxPrice',
                labelStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: minPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'MinPrice',
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
            final tripType =
                SelectedTripType.toString().isEmpty ? null : SelectedTripType;
            final TripRating =
                selectedRating.toString().isEmpty ? null : selectedRating;
            final maxPrice = maxPriceController.text.isEmpty
                ? null
                : maxPriceController.text;
            final minPrice = minPriceController.text.isEmpty
                ? null
                : minPriceController.text;
            print(
                '===========================================================');
            print('maxPrice: $maxPrice');
            if (selectedSearchValue == 'name') {
              BlocProvider.of<TripSearchFillterCubit>(context)
                  .cubitTripSearchFillter(
                      searchController, // First variable
                      TripRating, // location (second variable)
                      maxPrice, // roomType
                      minPrice, // checkin
                      tripType, // checkout
                      null);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TripFillteringPage()));
            } else if (selectedSearchValue == 'location') {
              BlocProvider.of<TripSearchFillterCubit>(context)
                  .cubitTripSearchFillter(
                null, // name (first variable)
                TripRating, // roomType
                maxPrice, // checkin
                minPrice,
                tripType, // checkout
                searchController,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TripFillteringPage()));
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
