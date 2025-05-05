import 'package:app/pages/User/Flight/flight_booking_page.dart';
import 'package:app/pages/User/Flight/flight_favorite.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_cubit.dart';
import 'package:flutter/material.dart';

class FlightBottomNavigationBarWidget extends StatelessWidget {
  const FlightBottomNavigationBarWidget({Key? key}) : super(key: key);

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
            InkWell(
              onTap: () {
                // Handle the onTap action for the first button
              },
              child: ClipOval(
                child: Container(
                  color: Colors.blue,
                  child: IconButton(
                    icon: Icon(Icons.flight, color: Colors.white),
                    onPressed: () {
                      // Handle the onPressed action for the first button
                    },
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigate to favorite page
              },
              child: ClipOval(
                child: Container(
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {
                      final flightFavoriteCubit =
                          FlightFavoriteCubit.get(context);
                      flightFavoriteCubit.cubitFlightFavorite();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightFavoritePage()),
                      );
                    },
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ClipOval(
                child: Container(
                  color: Colors.green,
                  child: IconButton(
                    icon: Icon(Icons.airplane_ticket, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservationFlightPage()),
                      );
                    },
                  ),
                ),
              ),
            ),

            ClipOval(
              child: Container(
                color: Colors.yellow,
                child: IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    // Navigator.push(
                    //      context,
                    //    MaterialPageRoute(builder: (context) => HomePage()),
                    //    );
                  },
                ),
              ),
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}
