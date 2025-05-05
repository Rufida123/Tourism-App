import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delet_hotel_cubit.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_flght_web.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_flight_cubit.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_hotel_web.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_trip_cubit.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_trip_state.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_trip_web.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Flight%20Services/edit_flight_cubit.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Flight%20Services/edit_flight_web.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Trips%20Services/edit_trip_cubit.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Trips%20Services/edut_trip_web.dart';
import 'package:web_dashbord/cubits/Edit%20Services/hotel%20services/edit_hotel_cubit.dart';
import 'package:web_dashbord/cubits/Edit%20Services/hotel%20services/edit_hotel_web.dart';
import 'package:web_dashbord/cubits/Edit%20Services/rooms%20services/edit_room_cubit.dart';
import 'package:web_dashbord/cubits/Edit%20Services/rooms%20services/edit_room_web.dart';
import 'package:web_dashbord/cubits/add_services/add_flight/add_fight_web.dart';
import 'package:web_dashbord/cubits/add_services/add_flight/add_flight_cubit.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_hotel_cubit.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_hotel_web.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_room_cubit.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_room_web.dart';
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_cubit.dart';
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_web.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_list_cubit.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_list_web.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_return_list_cubit.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_return_list_web.dart';
import 'package:web_dashbord/cubits/home%20page%20bloc/home_page_bloc.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_cubit.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_web.dart';
import 'package:web_dashbord/cubits/log%20Out/log_out_cubit.dart';
import 'package:web_dashbord/cubits/log%20Out/log_out_web.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_cubit.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_web.dart';
import 'package:web_dashbord/cubits/offer_list/offer_list_cubit.dart';
import 'package:web_dashbord/cubits/offer_list/offer_list_web.dart';

import 'package:web_dashbord/cubits/reservations/reservation_cubit.dart';
import 'package:web_dashbord/cubits/reservations/reservations_web.dart';
import 'package:web_dashbord/cubits/reservations/status_cubit.dart';
import 'package:web_dashbord/cubits/reservations/statuse_web.dart';
import 'package:web_dashbord/cubits/trip/trip_web.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_cubit.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_web.dart';

import '../cubits/trip/trip_cubit.dart';
import 'log_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatusCubit(StatusWeb()),
      child: BlocProvider(
        create: (context) => LogOutCubit(LogOutWeb()),
        child: BlocProvider(
          create: (context) =>
              DeleteFlightOutDetailsCubit(DeleteFlightOutDetailsWeb()),
          child: BlocProvider(
            create: (context) =>
                DeleteHotelOutDetailsCubit(DeleteHotelOutDetailsWeb()),
            child: BlocProvider(
              create: (context) =>
                  DeleteTripOutDetailsCubit(DeleteTripOutDetailsWeb()),
              child: BlocProvider(
                create: (context) => EditFlightCubit(EditFlightWeb()),
                child: BlocProvider(
                  create: (context) => EditTripActivityDetailsCubit(
                      EditTripActivityDetailsWeb()),
                  child: BlocProvider(
                    create: (context) =>
                        EditTripOutDetailsCubit(EditTripOutDetailsWeb()),
                    child: BlocProvider(
                      create: (context) =>
                          EditTripOutDetailsCubit(EditTripOutDetailsWeb()),
                      child: BlocProvider(
                        create: (context) =>
                            EditRoomFeaturesCubit(EditRoomFeaturesWeb()),
                        child: BlocProvider(
                          create: (context) =>
                              EditRoomTypeCubit(EditRoomTypeWeb()),
                          child: BlocProvider(
                            create: (context) => EditRoomCubit(EditRoomWeb()),
                            child: BlocProvider(
                              create: (context) =>
                                  EditHotelCubit(EditHotelWeb()),
                              child: BlocProvider(
                                create: (context) =>
                                    AddOfferCubit(AddOfferWeb()),
                                child: BlocProvider(
                                  create: (context) => AddRoomFeaturesCubit(
                                      AddRoomFeaturesWeb()),
                                  child: BlocProvider(
                                    create: (context) =>
                                        AddRoomTypeCubit(AddRoomTypeWeb()),
                                    child: BlocProvider(
                                      create: (context) =>
                                          AddRoomCubit(AddRoomWeb()),
                                      child: BlocProvider(
                                        create: (context) =>
                                            AddHotelCubit(AddHotelWeb()),
                                        child: BlocProvider(
                                          create: (context) =>
                                              AddFlightCubit(AddFlightWeb()),
                                          child: BlocProvider(
                                            create: (context) =>
                                                OfferListCubit(OfferListWeb()),
                                            child: BlocProvider(
                                                create: (context) =>
                                                    TripListCubit(
                                                        TripListWeb()),
                                                child: BlocProvider(
                                                    create: (context) =>
                                                        FlightListCubit(
                                                            FlightListWeb()),
                                                    child: BlocProvider(
                                                      create: (context) =>
                                                          FlightReturnListCubit(
                                                              FlightReturnListWeb()),
                                                      child: BlocProvider(
                                                        create: (BuildContext
                                                                context) =>
                                                            HotelListCubit(
                                                                HotelListWeb()),
                                                        child: BlocProvider(
                                                          create: (context) =>
                                                              AddTripActivityDetailsCubit(
                                                                  AddTripActivityDetailsWeb()),
                                                          child: BlocProvider(
                                                            create: (context) =>
                                                                AddTripInDetailsCubit(
                                                                    AddTripInDetailsWeb()),
                                                            child: BlocProvider(
                                                              create: (context) =>
                                                                  AddTripOutDetailsCubit(
                                                                      AddTripOutDetailsWeb()),
                                                              child:
                                                                  BlocProvider(
                                                                create: (context) =>
                                                                    ReservationTripCubit(
                                                                        ReservationsTripWeb()),
                                                                child:
                                                                    BlocProvider(
                                                                  create: (context) =>
                                                                      ReservationHotelCubit(
                                                                          ReservationsHotelWeb()),
                                                                  child:
                                                                      BlocProvider(
                                                                    create: (context) =>
                                                                        ReservationFlightCubit(
                                                                            ReservationsFlightWeb()),
                                                                    child:
                                                                        BlocProvider(
                                                                      create: (context) =>
                                                                          UsersAddCashCubit(
                                                                              UserAddCashWeb()),
                                                                      child:
                                                                          BlocProvider(
                                                                        create: (context) =>
                                                                            UsersDetailsCubit(UsersDetailsWeb()),
                                                                        child:
                                                                            BlocProvider(
                                                                          create: (context) =>
                                                                              TripListCubit(TripListWeb()),
                                                                          child: BlocProvider(
                                                                              create: (BuildContext context) => HomePageBloc(),
                                                                              child: MultiProvider(
                                                                                  providers: [
                                                                                    // Add your ChangeNotifierProviders here
                                                                                    ChangeNotifierProvider<DropDownReservationsState>(
                                                                                      create: (_) => DropDownReservationsState(),
                                                                                    ),
                                                                                    ChangeNotifierProvider<DropDownAddServiceState>(
                                                                                      create: (_) => DropDownAddServiceState(),
                                                                                    ),
                                                                                    // ... Add other ChangeNotifierProviders as needed
                                                                                  ],
                                                                                  child: MaterialApp(
                                                                                    debugShowCheckedModeBanner: false,
                                                                                    theme: ThemeData(
                                                                                      fontFamily: "Alexandria",
                                                                                    ),
                                                                                    home: Log_in(),
                                                                                  ))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
