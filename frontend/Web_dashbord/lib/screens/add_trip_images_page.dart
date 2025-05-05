import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:web_dashbord/assest/widgets/Custom%20appar.dart';
import 'package:web_dashbord/assest/widgets/left_slider.dart';
import 'package:http/http.dart' as http;
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_web.dart';
import 'package:web_dashbord/screens/add_trip_out_details_page.dart';
import 'package:web_dashbord/screens/log_in.dart';
import 'package:web_dashbord/url_api.dart';

class AddTourismTripImagesPage extends StatefulWidget {
  const AddTourismTripImagesPage({super.key});

  @override
  State<AddTourismTripImagesPage> createState() =>
      _AddTourismTripImagesPageState();
}

class _AddTourismTripImagesPageState extends State<AddTourismTripImagesPage> {
  List<int>? selectedFile1;
  Uint8List? byteData1;
  List<int>? selectedFile2;
  Uint8List? byteData2;
  List<int>? selectedFile3;
  Uint8List? byteData3;
  List<int>? selectedFile4;
  Uint8List? byteData4;

  startWebFilePicker1() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) {
        setState(() {
          byteData1 =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          selectedFile1 = byteData1;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  startWebFilePicker2() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) {
        setState(() {
          byteData2 =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          selectedFile2 = byteData2;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  startWebFilePicker3() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) {
        setState(() {
          byteData3 =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          selectedFile3 = byteData3;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  startWebFilePicker4() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) {
        setState(() {
          byteData4 =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          selectedFile4 = byteData4;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  Future uploadImage1() async {
    String TripId1 = id1.getId().toString();
    var url = Uri.parse('$baseUrl/photo/$TripId1');
    var request = http.MultipartRequest("Post", url);
    request.files.add(await http.MultipartFile.fromBytes(
        'image', selectedFile1!,
        contentType: MediaType('image', '*'), filename: "any name.png"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $token';
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("file uploaded successfuly");
      } else {
        print(response.statusCode);
        print('file uploaded failed');
      }
    });
  }

  String TripId2 = id2.getId().toString();

  Future uploadImage2() async {
    var url = Uri.parse('$baseUrl/manyPhoto/$TripId2');
    var request = http.MultipartRequest("Post", url);
    request.files.add(await http.MultipartFile.fromBytes(
        'image', selectedFile2!,
        contentType: MediaType('image', '*'), filename: "any name.png"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $token';
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("file uploaded successfuly");
      } else {
        print(response.statusCode);
        print('file uploaded failed');
      }
    });
  }

  Future uploadImage3() async {
    var url = Uri.parse('$baseUrl/manyPhoto/$TripId2');
    var request = http.MultipartRequest("Post", url);
    request.files.add(await http.MultipartFile.fromBytes(
        'image', selectedFile3!,
        contentType: MediaType('image', '*'), filename: "any name.png"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $token';
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("file uploaded successfuly");
      } else {
        print(response.statusCode);
        print('file uploaded failed');
      }
    });
  }

  Future uploadImage4() async {
    var url = Uri.parse('$baseUrl/manyPhoto/$TripId2');
    var request = http.MultipartRequest("Post", url);
    request.files.add(await http.MultipartFile.fromBytes(
        'image', selectedFile4!,
        contentType: MediaType('image', '*'), filename: "any name.png"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $token';
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("file uploaded successfuly");
      } else {
        print(response.statusCode);
        print('file uploaded failed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: "Trip",
          imageRoute: 'lib/assest/images/icons/ticket.png',
          backBotton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: LeftSlider(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        startWebFilePicker1();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Select Cover Image"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  byteData1 != null
                                      ? Image.memory(
                                          byteData1!,
                                          width: 200,
                                          height: 200,
                                        )
                                      : Container(),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        uploadImage1();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Image Uploaded Successfuly',
                                              style: TextStyle(
                                                color: Color(0xff55D3BD),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            duration: Duration(seconds: 2),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            margin: EdgeInsets.all(10.0),
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Upload Image"),
                                    ),
                                  )
                                ]),
                            SizedBox(
                              height: 100,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        startWebFilePicker2();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Select First Image"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  byteData2 != null
                                      ? Image.memory(
                                          byteData2!,
                                          width: 200,
                                          height: 200,
                                        )
                                      : Container(),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        uploadImage2();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Image Uploaded Successfuly',
                                              style: TextStyle(
                                                color: Color(0xff55D3BD),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            duration: Duration(seconds: 2),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            margin: EdgeInsets.all(10.0),
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Upload Image"),
                                    ),
                                  )
                                ]),
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        startWebFilePicker3();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Select Second Image"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  byteData3 != null
                                      ? Image.memory(
                                          byteData3!,
                                          width: 200,
                                          height: 200,
                                        )
                                      : Container(),
                                  Container(
                                    width: 200,
                                    child: Container(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          uploadImage3();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Image Uploaded Successfuly',
                                                style: TextStyle(
                                                  color: Color(0xff55D3BD),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              backgroundColor: Colors.white,
                                              duration: Duration(seconds: 2),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              margin: EdgeInsets.all(10.0),
                                              padding: EdgeInsets.all(10.0),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff5FCEB6),
                                          foregroundColor: Colors.white,
                                          shadowColor: Colors.black,
                                          minimumSize: Size(double.infinity,
                                              50), // Button size
                                        ),
                                        child: Text("Upload Third Image"),
                                      ),
                                    ),
                                  )
                                ]),
                            SizedBox(
                              height: 100,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        startWebFilePicker4();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Select Fourth Image"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  byteData4 != null
                                      ? Image.memory(
                                          byteData4!,
                                          width: 200,
                                          height: 200,
                                        )
                                      : Container(),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        uploadImage4();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Image Uploaded Successfuly',
                                              style: TextStyle(
                                                color: Color(0xff55D3BD),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            duration: Duration(seconds: 2),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            margin: EdgeInsets.all(10.0),
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff5FCEB6),
                                        foregroundColor: Colors.white,
                                        shadowColor: Colors.black,
                                        minimumSize: Size(
                                            double.infinity, 50), // Button size
                                      ),
                                      child: Text("Upload Image"),
                                    ),
                                  )
                                ]),
                          ]),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddTripOutDetailsPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff5FCEB6),
                                foregroundColor: Colors.white,
                                shadowColor: Colors.black,
                                minimumSize:
                                    Size(double.infinity, 50), // Button size
                              ),
                              child: Text('Done'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
