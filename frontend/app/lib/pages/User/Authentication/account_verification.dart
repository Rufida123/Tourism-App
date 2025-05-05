import 'package:app/components/custom_snackbar.dart';
import 'package:app/components/shared_state_manager.dart';
import 'package:app/pages/User/cubits/account_verification_cubit/account_verification_cubit.dart';
import 'package:app/pages/User/cubits/account_verification_cubit/account_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAccVerification extends StatelessWidget {
  UserAccVerification({Key? key}) : super(key: key);

  TextEditingController codeController1 = TextEditingController();
  TextEditingController codeController2 = TextEditingController();
  TextEditingController codeController3 = TextEditingController();
  TextEditingController codeController4 = TextEditingController();
  TextEditingController codeController5 = TextEditingController();
  TextEditingController codeController6 = TextEditingController();

  String getCompleteCode() {
    return codeController1.text +
        codeController2.text +
        codeController3.text +
        codeController4.text +
        codeController5.text +
        codeController6.text;
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAccVerifiCubit, UserAccVerificationState>(
      listener: (context, state) {
        if (state is UserAccVerifiLoading) {
          isLoading = true;
        } else if (state is UserAccVerifiSuccess) {
          Navigator.pushNamed(context, '/UserLogin');
          isLoading = false;
          showCustomSnackBar(
              context, 'the account was verefied successfuly , Please Login');
        } else if (state is UserAccVerifiFailure) {
          isLoading = false;
          showCustomSnackBar(context, 'the code is incorrect');
        }
      },
      builder: (context, state) {
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 8, 145, 125),
              title: Text('Check your Email'),
            ),
            body: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 153, 165, 164),
                image: DecorationImage(
                  image: AssetImage("assets/check.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(255, 8, 145, 125).withOpacity(0.2),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: codeController1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: codeController2,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: codeController3,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: codeController4,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: codeController5,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          controller: codeController6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final email = userSharedEmail.getEmail();
                        if (email != null) {
                          BlocProvider.of<UserAccVerifiCubit>(context)
                              .cubitUserAccVerifi(getCompleteCode(), email);
                        } else {
                          print("something went wrong,sign up again");
                        }
                      },
                      child: Text(
                        'Verification',
                        style:
                            TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
