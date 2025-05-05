import 'package:app/pages/User/cubits/flight_cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterDetails extends StatelessWidget {
  TextEditingController departureDateStartController = TextEditingController();
  TextEditingController departureDateEndController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController airlineNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterFlightCubit, FilterFlightState>(
      builder: (context, state) {
        final flights = FilterFlightCubit.get(context).flights;
        return Scaffold(
          appBar: AppBar(
            title: Text('Filter Details'),
            backgroundColor: Color.fromARGB(255, 78, 185, 169),
          ),
          body: state is FilterFlightLoading
              ? Center(child: CircularProgressIndicator())
              : state is FilterFlightSuccess
                  ? flights.isEmpty
                      ? Center(
                          child:
                              Text('No flights found matching the criteria.'),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final flight = flights[index];
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
                                                color: Colors.blue
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Image.asset(
                                            'assets/7xm.xyz667851.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(flight.departureAirport),
                                            Text(flight.arrivalAirport),
                                          ]),
                                      subtitle: Text(flight.companyName),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20.0),
                                itemCount: flights.length,
                              ),
                            ),
                          ],
                        )
                  : SizedBox(),
        );
      },
    );
  }
}
