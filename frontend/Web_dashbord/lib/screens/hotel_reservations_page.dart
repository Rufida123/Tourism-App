import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_hotel_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/reservations/reservation_cubit.dart';
import 'package:web_dashbord/cubits/reservations/reservations_state.dart';

class HotelReservationsPage extends StatefulWidget {
  const HotelReservationsPage({super.key});

  @override
  State<HotelReservationsPage> createState() => _HotelReservationsPageState();
}

class _HotelReservationsPageState extends State<HotelReservationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Trip",
        imageRoute: 'lib/assest/images/icons/hotel.png',
        backBotton: false,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            child: BlocBuilder<ReservationHotelCubit, ReservationsState>(
              builder: (context, state) {
                final hotel = ReservationHotelCubit.get(context).HRlist;

                if (state is ReservationHotelSuccess) {
                  return ListView.builder(
                    itemCount: hotel.length,
                    itemBuilder: (context, index) {
                      return ReservationHotelListItem(hotel: hotel[index]);
                    },
                  );
                } else if (state is ReservationHotelLoading) {
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

class ReservationHotelListItem extends StatelessWidget {
  final ReservationHotelModel hotel;

  ReservationHotelListItem({required this.hotel});

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
                  '${hotel.firstName}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Color(0xff5FCEB6)),
                SizedBox(width: 6),
                Text(
                  'Number Of Days: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${hotel.numberOfDay}',
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
                  '${hotel.status}',
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
                  '${hotel.payment}',
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
