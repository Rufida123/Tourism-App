import 'package:app/pages/User/cubits/hotels/list_cubit.dart';
import 'package:app/pages/User/cubits/hotels/reservation_page_cubit.dart';
import 'package:flutter/material.dart';

class HotelBottomNavigationBarWidget extends StatelessWidget {
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
              icon: Icons.hotel,
              onPressed: () {
                final hotelListCubit = HotelListCubit.get(context);
                hotelListCubit.cubitHotelList();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/HotelsListPage',
                  (Route<dynamic> route) => false,
                );
              },
            ),
            _buildNavigationButton(
              color: Colors.red,
              icon: Icons.favorite,
              onPressed: () {
                final hotelFavoriteCubit = HotelFavoriteCubit.get(context);
                hotelFavoriteCubit.cubitHotelFavorite();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/FavoritHotelPage',
                  (Route<dynamic> route) => false,
                );
              },
            ),
            _buildNavigationButton(
              color: const Color.fromARGB(255, 225, 134, 134),
              icon: Icons.book_online,
              onPressed: () {
                final hotelReservationPageCubit =
                    HotelReservationPageCubit.get(context);
                hotelReservationPageCubit.cubitHotelReservationPage();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/ReservationHotelPage',
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
