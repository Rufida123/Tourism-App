import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_flight_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/reservations/reservation_cubit.dart';
import 'package:web_dashbord/cubits/reservations/reservations_state.dart';

class FlightReservationsPage extends StatefulWidget {
  const FlightReservationsPage({super.key});

  @override
  State<FlightReservationsPage> createState() => _FlightReservationsPageState();
}

class _FlightReservationsPageState extends State<FlightReservationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Trip",
        imageRoute: 'lib/assest/images/icons/plane (2).png',
        backBotton: false,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            child: BlocBuilder<ReservationFlightCubit, ReservationsState>(
              builder: (context, state) {
                final flight = ReservationFlightCubit.get(context).FRlist;

                if (state is ReservationFlightSuccess) {
                  return ListView.builder(
                    itemCount: flight.length,
                    itemBuilder: (context, index) {
                      return ReservationFlightListItem(flight: flight[index]);
                    },
                  );
                } else if (state is ReservationFlightLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Text('No data Available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationFlightListItem extends StatelessWidget {
  final ReservationFlightModel flight;

  ReservationFlightListItem({required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(maxHeight: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Number Of Adults: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${flight.numOfAdult}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.child_care, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Number Of Children: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${flight.numOfChild}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.book, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Reservation Statuse: ${flight.status}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${flight.status}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.attach_money, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Flight Price: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${flight.totalPrice}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone, color: Color(0xff5FCEB6)),
                SizedBox(width: 4),
                Text(
                  'Phone Number: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${flight.phone}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
