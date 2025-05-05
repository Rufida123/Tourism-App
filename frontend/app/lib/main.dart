import 'package:app/components/navigation_service.dart';
import 'package:app/data/web_service/service_provider/account_verification_web.dart';
import 'package:app/data/web_service/service_provider/forgot_password_web.dart';
import 'package:app/data/web_service/service_provider/login_web.dart';
import 'package:app/data/web_service/service_provider/passwor_verification_web.dart';
import 'package:app/data/web_service/service_provider/password_reset_web.dart';
import 'package:app/data/web_service/service_provider/signUp_web.dart';
import 'package:app/data/web_service/user/account_verification_web.dart';
import 'package:app/data/web_service/user/account_web.dart';
import 'package:app/data/web_service/user/flight_booking_web.dart';
import 'package:app/data/web_service/user/favorite_flight_list_web.dart';
import 'package:app/data/web_service/user/filter_flight_web.dart';
import 'package:app/data/web_service/user/filter_return_flight_web.dart';
import 'package:app/data/web_service/user/flight_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/flight_cancel_reservation_web.dart';
import 'package:app/data/web_service/user/flight_confirm_booking_web.dart';
import 'package:app/data/web_service/user/flight_details_web.dart';
import 'package:app/data/web_service/user/flight_edit_reservation_web.dart';
import 'package:app/data/web_service/user/flight_list_web.dart';
import 'package:app/data/web_service/user/flight_offer_web.dart';
import 'package:app/data/web_service/user/flight_rating_web.dart';
import 'package:app/data/web_service/user/flight_remove_from_favorite_wev.dart';
import 'package:app/data/web_service/user/flight_reservation_page_web.dart';
import 'package:app/data/web_service/user/flight_return_list_web.dart';
import 'package:app/data/web_service/user/hotel_favorite_list_web.dart';
import 'package:app/data/web_service/user/forgot_password_web.dart';
import 'package:app/data/web_service/user/hote_offer_web.dart';
import 'package:app/data/web_service/user/hote_search_web.dart';
import 'package:app/data/web_service/user/hotel_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/hotel_booking_web.dart';
import 'package:app/data/web_service/user/hotel_cancel_reservation_web.dart';
import 'package:app/data/web_service/user/hotel_edit_reservation_web.dart';
import 'package:app/data/web_service/user/hotel_list_web.dart';
import 'package:app/data/web_service/user/hotel_rating_web.dart';
import 'package:app/data/web_service/user/hotel_remove_from_favorite_web.dart';
import 'package:app/data/web_service/user/hotel_reservation_page_web.dart';
import 'package:app/data/web_service/user/hotel_confirm_reservation_web.dart';
import 'package:app/data/web_service/user/hotel_room_details_web.dart';
import 'package:app/data/web_service/user/login_web.dart';
import 'package:app/data/web_service/user/password_reset_web.dart';
import 'package:app/data/web_service/user/password_verification_web.dart';
import 'package:app/data/web_service/user/profile_update_web.dart';
import 'package:app/data/web_service/user/search_flight_web.dart';
import 'package:app/data/web_service/user/signUp_web.dart';
import 'package:app/data/web_service/user/trip_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/trip_booking_web.dart';
import 'package:app/data/web_service/user/trip_cancel_reservation_web.dart';
import 'package:app/data/web_service/user/trip_confirm_reservation_web.dart';
import 'package:app/data/web_service/user/trip_details_web.dart';
import 'package:app/data/web_service/user/trip_edit_reservation_web.dart';
import 'package:app/data/web_service/user/trip_favorite_list_page_web.dart';
import 'package:app/data/web_service/user/trip_list_web.dart';
import 'package:app/data/web_service/user/trip_offer_web.dart';
import 'package:app/data/web_service/user/trip_rating_web.dart';
import 'package:app/data/web_service/user/trip_remove_from_favorite_web.dart';
import 'package:app/data/web_service/user/trip_reservation_page_web.dart';
import 'package:app/data/web_service/user/trip_search_web%20.dart';
import 'package:app/pages/Service_provider/Authentication/account_verification.dart';
import 'package:app/pages/Service_provider/Authentication/forgot_password.dart';
import 'package:app/pages/Service_provider/Authentication/login_page.dart';
import 'package:app/pages/Service_provider/Authentication/password_verification.dart';
import 'package:app/pages/Service_provider/Authentication/reset_password.dart';
import 'package:app/pages/Service_provider/Authentication/sign_up_page.dart';
import 'package:app/pages/Service_provider/cubits/account_verification_cubits/account_verification_cubit.dart';
import 'package:app/pages/Service_provider/cubits/login_cubit/login_cubit.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/forgot_password_cubit.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/password_reset_cubit.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/password_verification_cubit.dart';
import 'package:app/pages/Service_provider/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:app/pages/Service_provider/service_providing.dart';
import 'package:app/pages/User/Authentication/account_verification.dart';
import 'package:app/pages/User/Authentication/forgot_Password.dart';
import 'package:app/pages/User/Authentication/login_page.dart';
import 'package:app/pages/User/Authentication/password_verfication.dart';
import 'package:app/pages/User/Authentication/reset_password.dart';
import 'package:app/pages/User/Authentication/sign_up_page.dart';
import 'package:app/pages/User/Hotels/favorite_page.dart';
import 'package:app/pages/User/Hotels/hotels_list_page.dart';
import 'package:app/pages/User/Hotels/reservation_page.dart';
import 'package:app/pages/User/Trips/favorite_page.dart';
import 'package:app/pages/User/Trips/reservation_page.dart';
import 'package:app/pages/User/Trips/trip_list.dart';
import 'package:app/pages/User/cubits/account_verification_cubit/account_verification_cubit.dart';
import 'package:app/pages/User/cubits/cubit/account_cubit.dart';
import 'package:app/pages/User/cubits/cubit/profile_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/booking_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/confirm_booking_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/edit_reservation_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/filter_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/filter_return_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_details_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_offer_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_rate_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/reservation_page_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/search_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_cubit.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_return_cubit.dart';
import 'package:app/pages/User/cubits/hotels/booking%20_cubit.dart';
import 'package:app/pages/User/cubits/hotels/edit_reservation_cubit.dart';
import 'package:app/pages/User/cubits/hotels/list_cubit.dart';
import 'package:app/pages/User/cubits/hotels/offer_cubit.dart';
import 'package:app/pages/User/cubits/hotels/rating_cubit.dart';
import 'package:app/pages/User/cubits/hotels/confirm_reservation_cubit.dart';
import 'package:app/pages/User/cubits/hotels/reservation_page_cubit.dart';
import 'package:app/pages/User/cubits/hotels/room_details_cubit.dart';
import 'package:app/pages/User/cubits/hotels/search_cubit.dart';
import 'package:app/pages/User/cubits/login_cubit/login_cubit.dart';
import 'package:app/pages/User/cubits/password_cubit/forgot_password_cubit.dart';
import 'package:app/pages/User/cubits/password_cubit/password_reset_cubit.dart';
import 'package:app/pages/User/cubits/password_cubit/password_verification_cubit.dart';
import 'package:app/pages/User/cubits/signup_cubit/cubit/signup_cubit.dart';
import 'package:app/pages/User/cubits/trips/booking_cubit.dart';
import 'package:app/pages/User/cubits/trips/confirm_reservaton_cubit.dart';
import 'package:app/pages/User/cubits/trips/edit_reservation_cubit.dart';
import 'package:app/pages/User/cubits/trips/list_cubit.dart';
import 'package:app/pages/User/cubits/trips/offer_cubit.dart';
import 'package:app/pages/User/cubits/trips/rating_cubit.dart';
import 'package:app/pages/User/cubits/trips/reservation_page_cubit.dart';
import 'package:app/pages/User/cubits/trips/search_cubit.dart';
import 'package:app/pages/User/cubits/trips/trip_details_cubit.dart';
import 'package:app/home_page.dart';
import 'package:app/profile_page.dart';
import 'package:app/welcome_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getLoginState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await getLoginState();
  runApp(MyApp(isLoggedIn: isLoggedIn));
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey:
  //         "AIzaSyBc0MrldMA0revi1AToxLCurFfI-OpOdQU", // paste your api key here
  //     appId:
  //         "1:870058027368:android:450e23c43861dfb8c3cedd", //paste your app id here
  //     messagingSenderId: "870058027368", //paste your messagingSenderId here
  //     projectId: "flutter-noti-dfadd", //paste your project id here
  //   ),
  // );
  // await FirebaseMessaging.instance.getInitialMessage();
  // initializeApp();
  // runApp(const MyApp());
}

getToken() async {
  String? myToken = await FirebaseMessaging.instance.getToken();
  print("==================================");
  print(myToken);
}

void initializeApp() {
  getToken();
}

class MyApp extends StatefulWidget {
  // const MyApp({super.key});
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  void _toggleThemeMode() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('============================');
    print(widget.isLoggedIn);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginUserCubit>(
            create: (context) => LoginUserCubit(LoginUserWeb())),
        BlocProvider<SignUpUserCubit>(
          create: (context) => SignUpUserCubit(SignUpUserWeb()),
        ),
        BlocProvider<LoginProviderCubit>(
            create: (context) => LoginProviderCubit(LoginProviderWeb())),
        BlocProvider<SignUpProviderCubit>(
          create: (context) => SignUpProviderCubit(SignUpProviderWeb()),
        ),
        BlocProvider<UserAccVerifiCubit>(
          create: (context) => UserAccVerifiCubit(AccVerifiUserWeb()),
        ),
        BlocProvider<ProviderAccVerifiCubit>(
          create: (context) => ProviderAccVerifiCubit(AccVerifiProviderWeb()),
        ),
        BlocProvider<UserForgotPasswordCubit>(
          create: (context) => UserForgotPasswordCubit(UserForgotPassWeb()),
        ),
        BlocProvider<ProviderForgotPasswordCubit>(
          create: (context) =>
              ProviderForgotPasswordCubit(ProviderForgotPassWeb()),
        ),
        BlocProvider<ProviderPassVerifiCubit>(
          create: (context) => ProviderPassVerifiCubit(ProviderPassVerifiWeb()),
        ),
        BlocProvider<UserPassVerifiCubit>(
          create: (context) => UserPassVerifiCubit(UserPassVerifiWeb()),
        ),
        BlocProvider<UserPassResetCubit>(
          create: (context) => UserPassResetCubit(UserPassResetWeb()),
        ),
        BlocProvider<ProviderPassResetCubit>(
          create: (context) => ProviderPassResetCubit(ProviderPassResetWeb()),
        ),
        BlocProvider<HotelListCubit>(
          create: (context) => HotelListCubit(HotelListWeb()),
        ),
        BlocProvider<RoomDetailsCubit>(
          create: (context) => RoomDetailsCubit(RoomDetailsWeb()),
        ),
        BlocProvider<HotelAddToFavoriteCubit>(
          create: (context) => HotelAddToFavoriteCubit(HotelAddToFavoriteWeb()),
        ),
        BlocProvider<HotelFavoriteCubit>(
          create: (context) => HotelFavoriteCubit(HotelFavoriteWeb()),
        ),
        BlocProvider<HotelRemoveFromFavoriteCubit>(
          create: (context) =>
              HotelRemoveFromFavoriteCubit(HotelRemoveFromFavoriteWeb()),
        ),
        BlocProvider<HotelOfferCubit>(
          create: (context) => HotelOfferCubit(HotelOfferWeb()),
        ),
        BlocProvider<HotelRatingCubit>(
          create: (context) => HotelRatingCubit(HotelRatingWeb()),
        ),
        BlocProvider<HotelSearchFillterCubit>(
          create: (context) => HotelSearchFillterCubit(HotelSearchFillterWeb()),
        ),
        BlocProvider<TripListCubit>(
          create: (context) => TripListCubit(TripListWeb()),
        ),
        BlocProvider<TripSearchFillterCubit>(
          create: (context) => TripSearchFillterCubit(TripSearchFillterWeb()),
        ),
        BlocProvider<TripDetailsCubit>(
          create: (context) => TripDetailsCubit(TripDetailsWeb()),
        ),
        BlocProvider<HotelBookingCubit>(
          create: (context) => HotelBookingCubit(HotelBookingWeb()),
        ),
        BlocProvider<HotelReservationPageCubit>(
          create: (context) =>
              HotelReservationPageCubit(HotelReservationPageWeb()),
        ),
        BlocProvider<HotelReservationCubit>(
          create: (context) => HotelReservationCubit(HotelReservationWeb()),
        ),
        BlocProvider<HotelEditReservationCubit>(
          create: (context) =>
              HotelEditReservationCubit(HotelEditReservationWeb()),
        ),
        BlocProvider<HotelCancelReservationCubit>(
          create: (context) =>
              HotelCancelReservationCubit(HotelCancelReservationWeb()),
        ),
        BlocProvider<TripOfferCubit>(
          create: (context) => TripOfferCubit(TripOfferWeb()),
        ),
        BlocProvider<TripRatingCubit>(
          create: (context) => TripRatingCubit(TripRatingWeb()),
        ),
        BlocProvider<TripAddToFavoriteCubit>(
          create: (context) => TripAddToFavoriteCubit(TripAddToFavoriteWeb()),
        ),
        BlocProvider<TripFavoriteCubit>(
          create: (context) => TripFavoriteCubit(TripFavoriteWeb()),
        ),
        BlocProvider<TripRemoveFromFavoriteCubit>(
          create: (context) =>
              TripRemoveFromFavoriteCubit(TripRemoveFromFavoriteWeb()),
        ),
        BlocProvider<TripBookingCubit>(
          create: (context) => TripBookingCubit(TripBookingWeb()),
        ),
        BlocProvider<TripReservationPageCubit>(
          create: (context) =>
              TripReservationPageCubit(TripReservationPageWeb()),
        ),
        BlocProvider<TripReservationCubit>(
          create: (context) => TripReservationCubit(TripReservationWeb()),
        ),
        BlocProvider<TripEditReservationCubit>(
          create: (context) =>
              TripEditReservationCubit(TripEditReservationWeb()),
        ),
        BlocProvider<TripCancelReservationCubit>(
          create: (context) =>
              TripCancelReservationCubit(TripCancelReservationWeb()),
        ),
        BlocProvider<SearchFlightCubit>(
            create: (context) => SearchFlightCubit(SearchFlightWeb())),
        BlocProvider<FlightListCubit>(
            create: (context) => FlightListCubit(FlightListWeb())),
        BlocProvider<FlightReturnListCubit>(
            create: (context) => FlightReturnListCubit(FlightReturnListWeb())),
        BlocProvider<FlightAddToFavoriteCubit>(
            create: (context) =>
                FlightAddToFavoriteCubit(FlightAddToFavoriteWeb())),
        BlocProvider<FlightFavoriteCubit>(
            create: (context) => FlightFavoriteCubit(FlightFavoriteWeb())),
        BlocProvider<FilterFlightCubit>(
            create: (context) => FilterFlightCubit(FilterFlightWeb())),
        BlocProvider<FilterReturnFlightCubit>(
            create: (context) =>
                FilterReturnFlightCubit(FilterReturnFlightWeb())),
        BlocProvider<FlightRatingCubit>(
            create: (context) => FlightRatingCubit(FlightRatingWeb())),
        BlocProvider<FlightDetailsCubit>(
            create: (context) => FlightDetailsCubit(FlightDetailsWeb())),
        BlocProvider<BookingFlightCubit>(
            create: (context) => BookingFlightCubit(BookingFlightWeb())),
        BlocProvider<TripListCubit>(
            create: (context) => TripListCubit(TripListWeb())),
        BlocProvider<TripRatingCubit>(
            create: (context) => TripRatingCubit(TripRatingWeb())),
        BlocProvider<TripAddToFavoriteCubit>(
            create: (context) =>
                TripAddToFavoriteCubit(TripAddToFavoriteWeb())),
        BlocProvider<TripFavoriteCubit>(
            create: (context) => TripFavoriteCubit(TripFavoriteWeb())),
        BlocProvider<AccountCubit>(
            create: (context) => AccountCubit(AccountWeb())),
        BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(ProfileWeb())),
        BlocProvider<FlightOfferCubit>(
            create: (context) => FlightOfferCubit(FlightOfferWeb())),
        BlocProvider<FlightReservationCubit>(
          create: (context) => FlightReservationCubit(FlightReservationWeb()),
        ),
        BlocProvider<FlightEditReservationCubit>(
          create: (context) =>
              FlightEditReservationCubit(FlightEditReservationWeb()),
        ),
        BlocProvider<FlightCancelReservationCubit>(
          create: (context) =>
              FlightCancelReservationCubit(FlightCancelReservationWeb()),
        ),
        BlocProvider<FlightReservationPageCubit>(
          create: (context) =>
              FlightReservationPageCubit(FlightReservationPageWeb()),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'login',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 206, 235, 231),
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          primaryColor: Color.fromARGB(255, 30, 30, 30),
          brightness: Brightness.dark,
        ),
        themeMode: _themeMode,
        home: widget.isLoggedIn
            ? HomePage(
                toggleThemeMode: _toggleThemeMode,
              )
            : UserLoginPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/UserSignUp': (context) => UserSignUpPage(),
          '/ProviderSignUp': (context) => ProviderSignUpPage(),
          '/ServiceProviding': (context) => ServiceProviding(),
          '/UserLogin': (context) => UserLoginPage(),
          '/ProviderLogin': (context) => ProviderLoginPage(),
          '/UserForgotPassword': (context) => UserForgotPassword(),
          '/ProviderForgotPassword': (context) => ProviderForgotPassword(),
          '/UserAccVerification': (context) => UserAccVerification(),
          '/ProviderAccVerification': (context) => ProviderAccVerification(),
          '/ProviderPassVerification': (context) => ProviderPassVerification(),
          '/UserPassVerification': (context) => UserPassVerification(),
          '/ProviderResetPassword': (context) => ProviderResetPassword(),
          '/UserResetPassword': (context) => UserResetPassword(),
          '/HomePage': (context) => HomePage(toggleThemeMode: _toggleThemeMode),
          '/HotelsListPage': (context) => HotelsListPage(),
          '/FavoritHotelPage': (context) => HotelFavoritePage(),
          '/ReservationHotelPage': (context) => ReservationHotelPage(),
          '/TripsListPage': (context) => TripsListPage(),
          '/FavoritTripPage': (context) => TripFavoritePage(),
          '/ReservationTripPage': (context) => ReservationTripPage(),
          '/profile': (context) =>
              ProfilePage(toggleThemeMode: _toggleThemeMode),
        },
      ),
    );
  }
}
