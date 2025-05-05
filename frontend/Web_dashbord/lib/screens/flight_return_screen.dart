import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/assest/data%20and%20model/flight_return_list_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_return_list_cubit.dart';

class FlightReturnListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Return Flights",
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
            child: BlocBuilder<FlightReturnListCubit, FlightReturnListState>(
              builder: (context, state) {
                final flight = FlightReturnListCubit.get(context).flights;

                if (state is FlightReturnListLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FlightReturnListSuccess && flight != null) {
                  return Center(
                    // لضمان أن الـ Card يتمركز في الوسط
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0), // تقليل الهوامش
                      child: Padding(
                        padding:
                            const EdgeInsets.all(12.0), // تقليل الحواف الداخلية
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // هذا يجعل الكارد يأخذ حجم أصغر ممكن بناءً على محتواه
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'lib/assest/images/flight_plane.jpg', // استبدل بمسار صورة الشعار الفعلي
                                    width: 80, // تصغير عرض الصورة
                                    height: 80, // تصغير ارتفاع الصورة
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      flight.departureTime,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      flight.arrivalTime,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.airplanemode_active,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          flight.companyName,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 8), // لإضافة بعض المساحة بين المحتويات
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${flight.priceOfTickets}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to flight details
                                  },
                                  child: Text(
                                    'Show Details',
                                    style: TextStyle(color: Color(0xff5FCEB6)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text('Error fetching return flights'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildStarRating(int rating) {
  int fullStars = rating.floor();
  bool hasHalfStar = (rating - fullStars) >= 0.5;
  int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
  double starSize = 20.0;

  List<Widget> stars = List.generate(
    fullStars,
    (index) => Icon(
      Icons.star,
      color: Colors.yellow,
      size: starSize,
    ),
  );

  if (hasHalfStar) {
    stars.add(
      Icon(
        Icons.star_half,
        color: Colors.yellow,
        size: starSize,
      ),
    );
  }

  stars.addAll(
    List.generate(
      emptyStars,
      (index) => Icon(
        Icons.star_border,
        color: Colors.yellow,
        size: starSize,
      ),
    ),
  );

  return Row(children: stars);
}
