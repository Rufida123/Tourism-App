import 'package:app/components/custom_snackbar.dart';
import 'package:app/data/web_service/user/flight_rating_web.dart';
import 'package:app/data/web_service/user/trip_rating_web.dart';
import 'package:app/pages/User/cubits/flight_cubit/flight_rate_cubit.dart';
import 'package:app/pages/User/cubits/trips/rating_cubit.dart';
import 'package:flutter/material.dart';

void showRatingDialog(
    BuildContext context, Function(int) onRatingSubmit, int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController addedRatingController = TextEditingController();

      void submitRating() {
        final ratingValue = int.tryParse(addedRatingController.text) ?? 0;
        onRatingSubmit(ratingValue);
        final flightRatingWeb = FlightRatingWeb();
        final flightRatingCubit = FlightRatingCubit(flightRatingWeb);
        flightRatingCubit.cubitFlightRating(id, ratingValue);
        final tripRatingWeb = TripRatingWeb();
        final tripRatingCubit = TripRatingCubit(tripRatingWeb);
        tripRatingCubit.cubitTripRating(id, ratingValue);

        Navigator.of(context).pop();
        showCustomSnackBar(context,
            'Thank you for your rating'); // Close the dialog after submission
      }

      return AlertDialog(
        title: Text('Rate the Flight'),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                final currentRating =
                    int.tryParse(addedRatingController.text) ?? 0;
                return IconButton(
                  icon: Icon(
                    index < currentRating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      addedRatingController.text = (index + 1).toString();
                    });
                  },
                );
              }),
            );
          },
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Submit'),
            onPressed: submitRating, // Call the submitRating function
          ),
        ],
      );
    },
  );
}
