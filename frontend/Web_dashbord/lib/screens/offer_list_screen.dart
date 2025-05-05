import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/assest/data%20and%20model/offer_list_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/offer_list/offer_list_cubit.dart';

class OfferListPage extends StatefulWidget {
  const OfferListPage({super.key});

  @override
  State<OfferListPage> createState() => _OfferListPageState();
}

class _OfferListPageState extends State<OfferListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Show Offer",
        backBotton: false,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LeftSlider(),
          ),
          Expanded(
            child: BlocBuilder<OfferListCubit, OfferListState>(
              builder: (context, state) {
                final offer = OfferListCubit.get(context).offers;

                if (state is OfferListSuccess) {
                  return ListView.builder(
                    itemCount: offer.length,
                    itemBuilder: (context, index) {
                      return OfferListItem(offer: offer[index]);
                    },
                  );
                } else if (state is OfferListLoading) {
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

class OfferListItem extends StatelessWidget {
  final OfferListModel offer;

  OfferListItem({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(maxHeight: 160),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.title, color: Color(0xff5FCEB6)),
                    SizedBox(width: 6),
                    Text(
                      'title: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${offer.title}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.description, color: Color(0xff5FCEB6)),
                    SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description: ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${offer.description}',
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.date_range, color: Color(0xff5FCEB6)),
                    SizedBox(width: 6),
                    Text(
                      'Start Date: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${offer.startDate}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.date_range, color: Color(0xff5FCEB6)),
                    SizedBox(width: 6),
                    Text(
                      'End Date: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${offer.endDate}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  'Offer ${offer.discountRate}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
