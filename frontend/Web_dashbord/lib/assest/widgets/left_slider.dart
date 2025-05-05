import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_list_cubit.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_return_list_cubit.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_cubit.dart';
import 'package:web_dashbord/cubits/log%20Out/log_out_cubit.dart';
import 'package:web_dashbord/cubits/reservations/reservation_cubit.dart';
import 'package:web_dashbord/cubits/trip/trip_cubit.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_cubit.dart';
import 'package:web_dashbord/screens/add_flight_page.dart';
import 'package:web_dashbord/screens/add_hotel_page.dart';
import 'package:web_dashbord/screens/add_trip_out_details_page.dart';
import 'package:web_dashbord/screens/flight_return_screen.dart';
import 'package:web_dashbord/screens/flight_screen.dart';
import 'package:web_dashbord/screens/hotel_reservations_page.dart';
import 'package:web_dashbord/screens/hotel_screen.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/screens/main_page.dart';
import 'package:web_dashbord/screens/flight_reservations_page.dart';
import 'package:web_dashbord/screens/offer_list_screen.dart';
import 'package:web_dashbord/screens/trip_reservations_page.dart';
import 'package:web_dashbord/screens/trip_screen.dart';
import 'package:web_dashbord/screens/users_details_screen.dart';

class LeftSlider extends StatefulWidget {
  @override
  State<LeftSlider> createState() => _LeftSliderState();
}

class _LeftSliderState extends State<LeftSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 20)
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            // Homepage
            ListTile(
              horizontalTitleGap: 15,
              leading: Container(
                padding: EdgeInsets.all(2),
                height: 22,
                width: 22,
                child: Image(
                    image: AssetImage('lib/assest/images/icons/home (1).png')),
              ),
              title: Text(
                "Homepage",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPageScreen()));
              },
            ),
            // Users/details
            ListTile(
              horizontalTitleGap: 15,
              leading: Container(
                padding: EdgeInsets.all(2),
                height: 22,
                width: 22,
                child: Image(
                    image: AssetImage('lib/assest/images/icons/user.png')),
              ),
              title: Text(
                "Users/details",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UsersDetailsPage()));
                final usersDetailsCubit = UsersDetailsCubit.get(context);
                usersDetailsCubit.cubitUsersDetails();
              },
            ),
            // Reservations
            ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) {
                final reservationsState =
                    Provider.of<DropDownReservationsState>(context,
                        listen: false);
                reservationsState.toggleExpanded();
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      horizontalTitleGap: 15,
                      leading: Container(
                        padding: EdgeInsets.all(2),
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage(
                                'lib/assest/images/icons/luggage.png')),
                      ),
                      title: Text(
                        'Reservation',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      // Hotels option
                      ListTile(
                        title: Text(
                          'Hotels',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HotelReservationsPage()));
                          final reservationHotelCubit =
                              ReservationHotelCubit.get(context);
                          reservationHotelCubit.cubitReservationHotelList();
                        },
                      ),
                      // Flights option
                      ListTile(
                        title: Text(
                          'Flights',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FlightReservationsPage()));
                          final reservationFlightCubit =
                              ReservationFlightCubit.get(context);
                          reservationFlightCubit.cubitReservationFlightList();
                        },
                      ),
                      // Trips option
                      ListTile(
                        title: Text(
                          'Trips',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TripReservationsPage()));
                          final reservationTripCubit =
                              ReservationTripCubit.get(context);
                          reservationTripCubit.cubitReservationTripList();
                        },
                      ),
                    ],
                  ),
                  isExpanded: Provider.of<DropDownReservationsState>(context)
                      .isExpanded,
                ),
              ],
            ),
            // Handle the tap
            //Flight
            ListTile(
              horizontalTitleGap: 15,
              leading: Container(
                padding: EdgeInsets.all(1),
                height: 22,
                width: 22,
                child: Image(
                    image: AssetImage('lib/assest/images/icons/plane (2).png')),
              ),
              title: Text(
                "Flight Departure",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlightListPage()));
                final flightListCubit = FlightListCubit.get(context);
                flightListCubit.cubitFlightList();
              },
            ),
            ListTile(
              horizontalTitleGap: 15,
              leading: Container(
                padding: EdgeInsets.all(1),
                height: 22,
                width: 22,
                child: Image(
                    image: AssetImage('lib/assest/images/icons/plane (2).png')),
              ),
              title: Text(
                "Flight Return",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlightReturnListPage()));
                final flightReturnListCubit =
                    FlightReturnListCubit.get(context);
                flightReturnListCubit.cubitFlightReturnList();
              },
            ),
            //hotels
            ListTile(
              horizontalTitleGap: 15,
              leading: Container(
                padding: EdgeInsets.all(1),
                height: 22,
                width: 22,
                child: Image(
                    image: AssetImage('lib/assest/images/icons/hotel.png')),
              ),
              title: Text(
                "Hotels",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelListPage()));
                final hoteListCubit = HotelListCubit.get(context);
                hoteListCubit.cubitHotelList();
              },
            ),
            //tourist trip
            ListTile(
              horizontalTitleGap: 15,
              leading: Container(
                padding: EdgeInsets.all(1),
                height: 22,
                width: 22,
                child: Image(
                    image: AssetImage('lib/assest/images/icons/luggage.png')),
              ),
              title: Text(
                "Tourist trip",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripListPage()));
                final tripListCubit = TripListCubit.get(context);
                tripListCubit.cubitTripList();
              },
            ),
            ListTile(
              horizontalTitleGap: 15,
              leading: Icon(
                Icons.discount,
              ),
              title: Text(
                "Offers List", // Customize the title as needed
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OfferListPage()));
              },
            ),
            //statistics
            // ListTile(
            //   horizontalTitleGap: 15,
            //   leading: Container(
            //     padding: EdgeInsets.all(1),
            //     height: 22,
            //     width: 22,
            //     child: Image(
            //         image: AssetImage('lib/assest/images/icons/pie-chart.png')),
            //   ),
            //   title: Text(
            //     "Statistics",
            //     style: TextStyle(
            //       fontSize: 14,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MainPageScreen()));
            //   },
            // ),
            ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) {
                final serviceState = Provider.of<DropDownAddServiceState>(
                    context,
                    listen: false);
                serviceState.toggleExpanded();
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      horizontalTitleGap: 15,
                      leading: Container(
                        padding: EdgeInsets.all(2),
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage(
                                'lib/assest/images/icons/luggage.png')),
                      ),
                      title: Text(
                        'Add Service',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      // Hotels option
                      ListTile(
                        title: Text(
                          'Hotels',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddHotelPage()));
                        },
                      ),
                      // Flights option
                      ListTile(
                        title: Text(
                          'Flights',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddFlightPage()));
                        },
                      ),
                      // Trips option
                      ListTile(
                        title: Text(
                          'Trips',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddTripOutDetailsPage()));
                        },
                      ),
                    ],
                  ),
                  isExpanded:
                      Provider.of<DropDownAddServiceState>(context).isExpanded,
                ),
              ],
            ),
            ListTile(
              horizontalTitleGap: 15,
              leading: Icon(
                Icons.admin_panel_settings,
              ),
              title: Text(
                'Add Admin',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTripOutDetailsPage()));
              },
            ),
            ListTile(
              horizontalTitleGap: 15,
              leading: Icon(
                Icons.logout,
              ),
              title: Text(
                "Log Out", // Customize the title as needed
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Log Out'),
                      content: Text('Are you sure you want to Log Out'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Dismiss the dialog
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            final tripCancelReservationCubit =
                                LogOutCubit.get(context);
                            tripCancelReservationCubit
                                .cubitDeleteTripOutDetails();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Log_in()));
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownReservationsState extends ChangeNotifier {
  bool isExpanded = false;

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}

class DropDownAddServiceState extends ChangeNotifier {
  bool isExpanded = false;

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
