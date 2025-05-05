import 'package:app/pages/User/Flight/flight_display.dart';
import 'package:app/pages/User/cubits/flight_cubit/search_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightSearchPage extends StatelessWidget {
  TextEditingController searchQueryController = TextEditingController();
  TextEditingController departureDateStartController = TextEditingController();
  TextEditingController departureDateEndController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController airlineNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFlightCubit, SearchFlightState>(
        builder: (context, state) {
      final flightsearch = SearchFlightCubit.get(context).flightsearch;

      return Scaffold(
        appBar: AppBar(
          title: Text('Search for a Flight'),
          backgroundColor: Color(0xff5FCEB6),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: searchQueryController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Enter your search query',
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
                      return 'Please enter search query';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<SearchFlightCubit>(context)
                          .cubitFlightSearch(searchQueryController.text);
                    }
                  },
                  child: Text('Search',
                      style:
                          TextStyle(color: Color.fromARGB(255, 8, 145, 125))),
                ),
                SizedBox(height: 20),
                if (state is SearchFlightLoading)
                  Center(child: CircularProgressIndicator())
                else if (state is SearchFlightSuccess)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final flightsear = flightsearch[index];
                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/7xm.xyz667851.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(flightsear.arrivalDate),
                                Text(flightsear.arrivalAirport),
                              ],
                            ),
                            subtitle: Text(flightsear.companyName),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlightDetailsPage(
                                    id: flightsear.id,
                                    // تمرير الـ ID للرحلة
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                      itemCount: flightsearch.length,
                    ),
                  ),
              ],
            ),
          ),
        ),
        //else if (state is SearchFlightFailure)
        //Center(child: Text(state.errorMessage)),
      );
    });
  }
}
          
      
      
    
  

//   Widget buildSearchResults(List<FlightSearchModel> searchResults) { 
//     if (searchResults == null|| searchResults.isEmpty) { 
//       return Center(child: Text('No results found'));
//     } else {
//       return ListView.builder(
//         itemCount: searchResults.length,
//         itemBuilder: (context, index) {
//           final flight = searchResults[index];
//           return ListTile(
//             title: Text('Airline Name : ${flight['airline']}'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Departure Time: ${flight['departureTime']}'),
//                 Text('Arrival Time: ${flight['arrivalTime']}'),
//                 Text('Price: \$${flight['price ']}'),
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }

