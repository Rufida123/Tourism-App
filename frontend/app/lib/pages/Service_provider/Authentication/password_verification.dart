import 'package:app/components/shared_state_manager.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/password_verification_cubit.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/password_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderPassVerification extends StatelessWidget {
  ProviderPassVerification({Key? key}) : super(key: key);
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProviderPassVerifiCubit, ProviderPassVerifiState>(
      listener: (context, state) {
        if (state is ProviderPassVerifiLoading) {
          isLoading = true;
        } else if (state is ProviderPassVerifiSuccess) {
          Navigator.pushNamed(context, '/ProviderResetPassword');
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(''),
            duration: Duration(seconds: 2),
          ));
        } else if (state is ProviderPassVerifiFailure) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: Duration(seconds: 2),
            ),
          );
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
                        final email = providerSharedEmail.getEmail();
                        if (email != null) {
                          providerSharedCode.setCode(getCompleteCode());
                          BlocProvider.of<ProviderPassVerifiCubit>(context)
                              .cubitProviderPassVerifi(
                                  getCompleteCode(), email);
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
