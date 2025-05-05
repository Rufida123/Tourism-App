import 'package:app/pages/User/cubits/cubit/account_cubit.dart';
import 'package:app/pages/User/cubits/cubit/profile_cubit.dart';
import 'package:app/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInformationPage extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Information profile'),
        backgroundColor: Color.fromARGB(255, 103, 194, 180),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name Input
              buildTextField(
                  'First Name', firstNameController, TextInputType.text),
              SizedBox(height: 20),
              // Last Name Input
              buildTextField(
                  'Last Name', lastNameController, TextInputType.text),
              SizedBox(height: 20),
              // Phone Number Input

              // Submit Button
              Center(
                child: BlocListener<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    final profile = ProfileCubit.get(context).profileModel;
                    if (state is ProfileUpSuccess) {
                      // Trigger the AccountCubit to refresh data
                      AccountCubit.get(context).refreshAccount();
                      // Navigate back to PersonalInformationPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInformationPage()),
                      );
                    } else if (state is ProfileUpFailure) {
                      // Show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Failed to update profile: ${state.error}')),
                      );
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final profileCubit = ProfileCubit.get(context);
                        profileCubit.cubitProfile(
                          firstNameController.text,
                          lastNameController.text,
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                      style:
                          TextStyle(color: Color.fromARGB(255, 103, 194, 180)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 8, 145, 125),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 8, 145, 125),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}
