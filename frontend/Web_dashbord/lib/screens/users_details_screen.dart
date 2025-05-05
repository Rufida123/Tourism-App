import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web_dashbord/assest/data%20and%20model/users_model.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_cubit.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_state.dart';

class UsersDetailsPage extends StatefulWidget {
  const UsersDetailsPage({super.key});

  @override
  State<UsersDetailsPage> createState() => _UsersDetailsPageState();
}

class _UsersDetailsPageState extends State<UsersDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Users Details",
        imageRoute: 'lib/assest/images/icons/user.png',
        backBotton: false,
      ),
      body: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: LeftSlider(),
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<UsersDetailsCubit, UsersDetailsState>(
            builder: (context, state) {
              if (state is UsersDetailsSuccess) {
                final user = UsersDetailsCubit.get(context).list;
                print(user.isEmpty);
                print('working');
                print('User list length: ${user.length}');
                return ListView.builder(
                  shrinkWrap: true, // Allow dynamic height
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return UserDetailsItem(userModel: user[index]);
                  },
                );
              } else if (state is UsersDetailsFailure) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              } else if (state is UsersDetailsLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text('Failure'));
              }
            },
          ),
        )
      ]),
    );
  }
}

class UserDetailsItem extends StatelessWidget {
  final UsersModel userModel;

  const UserDetailsItem({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.grey, width: 1.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, // Set your desired background color
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                'First Name: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${userModel.firstName}',
                style: TextStyle(fontSize: 16),
              ),
            ]),
            SizedBox(height: 8),
            Row(children: [
              Text(
                'Last Name: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${userModel.lastName}',
                style: TextStyle(fontSize: 16),
              ),
            ]),
            SizedBox(height: 8),
            Row(children: [
              Text(
                'Wallet: ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                '${userModel.wallet}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 60),
              FloatingActionButton(
                onPressed: () {
                  // Show the dialog when the button is pressed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      TextEditingController amountController =
                          TextEditingController();
                      return AlertDialog(
                        title: Text('Add Money'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Enter the amount:'),
                            TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: 'Amount'),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              final usersAddCashCubit =
                                  UsersAddCashCubit.get(context);
                              usersAddCashCubit.cubitUserAddCash(
                                  userModel.id.toString(),
                                  amountController.text);
                              Navigator.of(context).pop();
                              final usersDetailsCubit =
                                  UsersDetailsCubit.get(context);
                              usersDetailsCubit.cubitUsersDetails();
                            },
                            child: Text('Add'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.add),
              ),
            ])
            // Add more user details as needed
          ],
        ),
      ),
    );
  }
}
