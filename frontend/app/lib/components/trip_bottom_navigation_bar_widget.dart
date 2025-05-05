import 'package:app/pages/User/cubits/trips/list_cubit.dart';
import 'package:app/pages/User/cubits/trips/reservation_page_cubit.dart';
import 'package:flutter/material.dart';

class TripBottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 232),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavigationButton(
              color: Colors.blue,
              icon: Icons.train,
              onPressed: () {
                final tripListCubit = TripListCubit.get(context);
                tripListCubit.cubitTripList();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/TripsListPage',
                  (Route<dynamic> route) => false,
                );
              },
            ),
            _buildNavigationButton(
              color: Colors.red,
              icon: Icons.favorite,
              onPressed: () {
                final tripFavoriteCubit = TripFavoriteCubit.get(context);
                tripFavoriteCubit.cubitTripFavorite();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/FavoritTripPage',
                  (Route<dynamic> route) => false,
                );
              },
            ),
            _buildNavigationButton(
              color: const Color.fromARGB(255, 225, 134, 134),
              icon: Icons.book_online,
              onPressed: () {
                final tripReservationPageCubit =
                    TripReservationPageCubit.get(context);
                tripReservationPageCubit.cubitTripReservationPage();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/ReservationTripPage',
                  (Route<dynamic> route) => false,
                );
              },
            ),
            _buildNavigationButton(
              color: Colors.green,
              icon: Icons.home,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/HomePage',
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
      {required IconData icon,
      required VoidCallback onPressed,
      required Color color}) {
    return InkWell(
      child: ClipOval(
        child: Container(
          color: color, // Customize the color
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
