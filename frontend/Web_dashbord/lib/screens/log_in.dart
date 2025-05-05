import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web_dashbord/assest/widgets/get_main_page_data.dart';
import 'package:web_dashbord/crud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_dashbord/screens/main_page.dart';
import 'package:web_dashbord/url_api.dart';
import 'package:flutter/services.dart';

String? token;

class Log_in extends StatefulWidget {
  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  //double width_screen = MediaQuery.of(context).size.width;
  @override
  String? email;
  String? password;

  Widget build(BuildContext context) {
    Crud crud = Crud();
    GetMainPageDate getMainPageDate = GetMainPageDate();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController forgetPasswordEmail = TextEditingController();
    TextEditingController newPasswordController1 = TextEditingController();
    TextEditingController newPasswordController2 = TextEditingController();
    List<TextEditingController> codec = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          //left image
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 1.94,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFEFEFE),
                            Color(0xFEFEFE).withOpacity(0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                      image: AssetImage('lib/assest/images/Palmyra.png'),
                      fit: BoxFit.cover)),
              Container(
                width: 700,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0x00A487).withOpacity(0.9),
                      Color(0xFEFEFE).withOpacity(0)
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 34,
                    bottom: MediaQuery.of(context).size.width / 9),
                child: Text("Welcom to visit syria",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 45,
                        fontWeight: FontWeight.w300)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 34,
                    bottom: MediaQuery.of(context).size.height / 27.2),
                child: Text("Dashboard",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 13.6,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //logo and name
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    children: [
                      Container(
                          width: 75,
                          height: 75,
                          child: Image(
                            image: AssetImage('lib/assest/images/logo.png'),
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('visit syria',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                //Log in
                Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 35,
                ),
                //E-mail
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
                //Email text form field
                Container(
                  width: 400,
                  child: TextFormField(
                    // inputFormatters: [LengthLimitingTextInputFormatter(100) ,
                    // ],
                    // controller: emailController,
                    onChanged: (value) {
                      email = value;
                      superAdmainEmail.setEmail(email.toString());
                      print(password);
                    },

                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          weight: 0.1,
                        ),
                        hintText: 'admin@gmail',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Password
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
                //Password text form field
                Container(
                  width: 400,
                  child: TextFormField(
                    // controller: passwordController,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          weight: 0.1,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //forget password
                TextButton(
                    onPressed: () {
                      //أدخل إيميلك لإرسال الكود
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter your email"),
                              content: Text(
                                  "We will send a confirmation code to your account"),
                              actionsAlignment: MainAxisAlignment.start,
                              actions: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Color(0xFF3FB5A3),
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF3FB5A3)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    hintText: "enter your email",
                                  ),
                                  controller: forgetPasswordEmail,
                                  onChanged: (value) {
                                    forgetPasswordEmail.text = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //أزرار send و cancel لكتابة الإيميل عند إرسال كود التفعيل
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "cancel",
                                        style:
                                            TextStyle(color: Color(0xFF3FB5A3)),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        var responsef = await crud.postrequest(
                                            forgetPasswordEmailUrl, {
                                          "email": forgetPasswordEmail.text,
                                        });
                                        if (responsef["message"] ==
                                            "code.sent") {
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Enter the verification code"),
                                                  actionsAlignment:
                                                      MainAxisAlignment.end,
                                                  actions: [
                                                    Form(
                                                      child: Row(
                                                        children: [
                                                          //مربعات كود التفعيل
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF3FB5A3),
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black38,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    1),
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                codec[0].text =
                                                                    value;
                                                                if (value
                                                                        .length ==
                                                                    1) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .nextFocus();
                                                                }
                                                                if (value
                                                                        .length ==
                                                                    0) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .previousFocus();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF3FB5A3),
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black38,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    1),
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                codec[1].text =
                                                                    value;
                                                                if (value
                                                                        .length ==
                                                                    1) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .nextFocus();
                                                                }
                                                                if (value
                                                                        .length ==
                                                                    0) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .previousFocus();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF3FB5A3),
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black38,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    1),
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                codec[2].text =
                                                                    value;
                                                                if (value
                                                                        .length ==
                                                                    1) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .nextFocus();
                                                                }
                                                                if (value
                                                                        .length ==
                                                                    0) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .previousFocus();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF3FB5A3),
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black38,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    1),
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                codec[3].text =
                                                                    value;
                                                                if (value
                                                                        .length ==
                                                                    1) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .nextFocus();
                                                                }
                                                                if (value
                                                                        .length ==
                                                                    0) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .previousFocus();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF3FB5A3),
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black38,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    1),
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                codec[4].text =
                                                                    value;
                                                                if (value
                                                                        .length ==
                                                                    1) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .nextFocus();
                                                                }
                                                                if (value
                                                                        .length ==
                                                                    0) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .previousFocus();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF3FB5A3),
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black38,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(
                                                                    1),
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                codec[5].text =
                                                                    value;
                                                                if (value
                                                                        .length ==
                                                                    1) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .nextFocus();
                                                                }
                                                                if (value
                                                                        .length ==
                                                                    0) {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .previousFocus();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: () async {
                                                            String code = codec
                                                                .map((codec) =>
                                                                    codec.text)
                                                                .join();
                                                            print(code);
                                                            var responsec =
                                                                await crud
                                                                    .postrequest(
                                                                        checkCodeUrl,
                                                                        {
                                                                  "code": code,
                                                                });
                                                            if (responsec[
                                                                    'message'] ==
                                                                "password.code.is_vaild") {
                                                              Navigator.pop(
                                                                  context);
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          Text(
                                                                        "change password",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                      //إدخال كلمة المرور الجديدة
                                                                      actions: [
                                                                        Text(
                                                                          "Enter new Password",
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                5),
                                                                        TextFormField(
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF3FB5A3),
                                                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF3FB5A3)), borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                          ),
                                                                          controller:
                                                                              newPasswordController1,
                                                                          onChanged:
                                                                              (value) {
                                                                            newPasswordController1.text =
                                                                                value;
                                                                          },
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                20),
                                                                        Text(
                                                                          "Enter new Password again",
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                5),
                                                                        TextFormField(
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF3FB5A3),
                                                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF3FB5A3)), borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                          ),
                                                                          controller:
                                                                              newPasswordController2,
                                                                          onChanged:
                                                                              (value) {
                                                                            newPasswordController2.text =
                                                                                value;
                                                                          },
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                20),
                                                                        Row(
                                                                          children: [
                                                                            MaterialButton(
                                                                              onPressed: () async {
                                                                                print(code);
                                                                                var responsep = await crud.postrequest(newpasswordurl, {
                                                                                  "code": code,
                                                                                  "password": newPasswordController1.text,
                                                                                  "password confirmation": newPasswordController2.text,
                                                                                });
                                                                                print(responsep);

                                                                                if (responsep["message"] == "password has been sucessfuly reset") {
                                                                                  Navigator.pop(context);
                                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                    content: Text(
                                                                                      responsep["message"],
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    margin: EdgeInsets.only(left: 300, right: 300, bottom: 50),
                                                                                    behavior: SnackBarBehavior.floating,
                                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                                    backgroundColor: Color(0xFF3FB5A3),
                                                                                  ));
                                                                                }
                                                                              },
                                                                              child: Text("confirm", style: TextStyle(color: Colors.white)),
                                                                              color: Color(0xFF3FB5A3),
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                              height: 40,
                                                                            ),
                                                                          ],
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  });
                                                            } else if (responsef[
                                                                    "message"] ==
                                                                "The selected email is invalid.") {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: Text(
                                                                  responsef[
                                                                      "message"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            300,
                                                                        right:
                                                                            300,
                                                                        bottom:
                                                                            50),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF3FB5A3),
                                                              ));
                                                            }
                                                            ;
                                                          },
                                                          child: Text("send",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          color:
                                                              Color(0xFF3FB5A3),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          height: 40,
                                                        ),
                                                      ],
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              responsef["message"],
                                              textAlign: TextAlign.center,
                                            ),
                                            margin: EdgeInsets.only(
                                                left: 300,
                                                right: 300,
                                                bottom: 50),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            backgroundColor: Color(0xFF3FB5A3),
                                          ));
                                        }
                                        ;
                                      },
                                      child: Text("send",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: Color(0xFF3FB5A3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("forget password?")),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 120,
                    child: MaterialButton(
                        height: 60,
                        color: Color(0xFF3FB5A3).withOpacity(1),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          var response1 = await crud.postrequest(login, {
                            "email": email,
                            "password": password,
                          });

                          if (response1["message"] == "welcome !!!") {
                            token = response1['data'];
                            var anasresponse = await crud.anas(usersCountUrl);
                            countUser = anasresponse['data'];

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPageScreen(),
                              ),
                            );
                            //var response = http.get(Uri.parse('http://127.0.0.1:8000/api/getUsersCount'), headers: { });
                            // var response =  crud.getrequest(usersCountUrl);
                            //countUser= response["data"];

                            //countUser = getMainPageDate.getUserNumber();
                          } else if (response1["message"] ==
                                  " Password is Wrong !." ||
                              response1["message"] ==
                                  "The selected email is invalid.") {
                            print(
                                "false response ============================================");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                response1["message"],
                                textAlign: TextAlign.center,
                              ),
                              margin: EdgeInsets.only(
                                  left: 300, right: 300, bottom: 50),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor: Color(0xFF3FB5A3),
                            ));
                          } else {
                            print('sssssssssssssssss');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'mail is false',
                                textAlign: TextAlign.center,
                              ),
                              margin: EdgeInsets.only(
                                  left: 300, right: 300, bottom: 50),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor: Color(0xFF3FB5A3),
                            ));
                          }
                          ;
                        }
                        //   onPressed: (){
                        //     print(emailController.text);
                        //     print(passwordController.text);
                        //   },
                        ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class SuperAdmainEmail {
  String? _email;

  void setEmail(String email) {
    _email = email;
  }

  String? getEmail() {
    return _email;
  }
}

final superAdmainEmail = SuperAdmainEmail();
