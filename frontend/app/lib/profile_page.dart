import 'dart:convert';
import 'dart:io';
import 'package:app/constants/constants.dart';
import 'package:app/pages/User/cubits/cubit/account_cubit.dart';
import 'package:app/personal_information.dart';
import 'package:app/settings_page.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback toggleThemeMode;

  ProfilePage({required this.toggleThemeMode});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      // Call the profile method with the selected image
      profile(image!);
    } else {
      print('No image selected.');
    }
  }

  Future profile(File image) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/update/photo'));

      request.files
          .add(await http.MultipartFile.fromPath('image[0]', image.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('Response status code: ${response.statusCode}');
        var responseString = await response.stream.bytesToString();
        print('Response body: $responseString');
        var jsonResponse = jsonDecode(responseString);
        print(jsonResponse);

        if (jsonResponse["0"] == 200) {
          var imagePath = jsonResponse["path"]["url"];
          print('Image uploaded successfully: $imagePath');
        } else {
          print('Failed to upload image: ${jsonResponse}');
        }
      } else {
        print('Failed to upload image: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 8, 145, 125),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: () {
              // if (image == null) {
              //   print('No image selected.');
              //   return;
              // }
              getImage();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 233, 214),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: image != null
                        ? ClipOval(
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            color: Colors.grey.shade300,
                            size: 80.0,
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 253),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Personal Information'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    final accountCubit = AccountCubit.get(context);
                    accountCubit.cubitAccount();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalInformationPage()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log Out'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Add logout functionality here
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPage(
                              toggleThemeMode: widget.toggleThemeMode)),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
