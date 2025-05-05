import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_trip_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/reservations/reservation_cubit.dart';
import 'package:web_dashbord/cubits/reservations/reservations_state.dart';

class TripReservationsPage extends StatefulWidget {
  const TripReservationsPage({super.key});

  @override
  State<TripReservationsPage> createState() => _TripReservationsPageState();
}

class _TripReservationsPageState extends State<TripReservationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Trip",
        imageRoute: 'lib/assest/images/icons/ticket.png',
        backBotton: false,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            child: BlocBuilder<ReservationTripCubit, ReservationsState>(
              builder: (context, state) {
                final trip = ReservationTripCubit.get(context).TRlist;

                if (state is ReservationTripSuccess) {
                  if (trip.isEmpty) {
                    return Center(child: Text('No reservations found.'));
                  }
                  return ListView.builder(
                    itemCount: trip.length,
                    itemBuilder: (context, index) {
                      return ReservationTripListItem(trip: trip[index]);
                    },
                  );
                } else if (state is ReservationTripLoading) {
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

class ReservationTripListItem extends StatelessWidget {
  final ReservationTripModel trip;

  ReservationTripListItem({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(maxHeight: 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Name: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${trip.firstName}',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 20),
                Text(
                  'Last Name: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${trip.lastName}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.account_circle_outlined, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Number Of People: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${trip.numberPeople}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.book, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Reservation Statuse: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${trip.status}',
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
                  'Hotel Price: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${trip.payment}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
