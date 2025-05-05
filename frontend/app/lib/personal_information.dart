import 'package:app/pages/User/cubits/cubit/account_cubit.dart';
import 'package:app/edit_information_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        final account = AccountCubit.get(context).account;

        return Scaffold(
          appBar: AppBar(
            title: Text('Personal Information'),
            backgroundColor: Color.fromARGB(255, 78, 185, 169),
          ),
          body: state is AccountSuccess && account != null
              ? Center(
                  child: FractionallySizedBox(
                    widthFactor:
                        0.9, // Slightly increase the width factor for a better look
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height *
                            0.6, // Adjust the height
                      ),
                      child: Container(
                        // Background container with gradient
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF00C9FF),
                              Color(0xFF92FE9D)
                            ], // Customize the gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius:
                              BorderRadius.circular(15.0), // Rounded corners
                        ),

                        child: Card(
                          elevation: 5.0, // Add shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15.0), // Rounded corners
                          ),
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                20.0), // Padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name: ${account.firstName}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold, // Bold font
                                    color: Colors
                                        .black87, // Slightly lighter color
                                  ),
                                ),
                                SizedBox(height: 10), // Increased spacing
                                Text(
                                  'Last Name: ${account.lastName}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold, // Bold font
                                    color: Colors
                                        .black87, // Slightly lighter color
                                  ),
                                ),
                                SizedBox(height: 10), // Increased spacing
                                Text(
                                  'Email: ${account.email}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black54, // Lighter color for email
                                  ),
                                ),
                                // Uncomment and use if you have phone number
                                // SizedBox(height: 10), // Spacing
                                // Text(
                                //   'Phone: ${account.phone}',
                                //   style: TextStyle(
                                //     fontSize: 18.0,
                                //     color: Colors.black54,
                                //   ),
                                // ),
                                SizedBox(
                                    height:
                                        20), // Add spacing before the button
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to the edit profile page or show edit form
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditInformationPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                        255, 78, 185, 169), // Button color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Button shape
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12), // Button padding
                                  ),
                                  child: Text(
                                    'Edit Information',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child:
                      CircularProgressIndicator()), // Show a loader if data is not loaded
        );
      },
    );
  }
}
