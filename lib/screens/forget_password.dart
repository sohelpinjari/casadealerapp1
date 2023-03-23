import 'dart:convert';

import 'package:casadealerapp/CONST.dart';

import 'package:casadealerapp/modal_class/login_model.dart';
import 'package:casadealerapp/provider/login_authprovider.dart';
import 'package:casadealerapp/provider/productprovider.dart';
import 'package:casadealerapp/screens/getstarted.dart';
import 'package:casadealerapp/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}
TextEditingController _email = TextEditingController();


bool _passwordVisible = false;

class _forgetpasswordState extends State<forgetpassword> {



  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/login2.png',
                fit: BoxFit.fill,
                // height: MediaQuery.of(context).size.height * 0.5,
                // width: MediaQuery.of(context).size.width * 2,
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/get_started_logo.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.07,
                // width: MediaQuery.of(context).size.width * 2,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h
                    ),
                    Padding(
                      padding:  EdgeInsets.all(2.h),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // alignment: Alignment.centerLeft,
                        child: Text("Forgot Password",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff3b3b8e))),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: TextFormField(
                        // validator: (value) {
                        //   String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                        //       "\\@" +
                        //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                        //       "(" +
                        //       "\\." +
                        //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                        //       ")+";
                        //   //Convert string p to a RegE  x
                        //   RegExp regExp = RegExp(p);
                        //
                        //   if (value!.isEmpty) {
                        //     return 'Please enter Your Email';
                        //   } else {
                        //     //If email address matches pattern
                        //     if (regExp.hasMatch(value)) {
                        //       return null;
                        //     } else {
                        //       //If it doesn't match
                        //       return 'Email is not valid';
                        //     }
                        //   }
                        // },
                        controller: _email,
                        decoration: InputDecoration(
                          // suffixIcon: Icon(
                          //   Icons.person_outline,
                          //   color: Color(0xfff9696c1),
                          //   size: 3.5.h,
                          // ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(2.h),
                          hintText: 'Enter your email',
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xfffFBFBFB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),



                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      // color: Color(0xfff333389),
                      // padding:
                      //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Validate");
                            forget_pass();


                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => products_1()));
                        },
                        child: Text(
                          'Send',
                          style: TextStyle(fontSize: 2.h),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfff333389),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),



                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  forget_pass() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['action'] = 'forgot_password';
      data['forgotEmail'] = _email.text.trim().toString();



      checkInternet().then((internet) async {
        if (internet) {
          Productprovider().forgot(data).then((Response response) async {


            userData = usermodal.fromJson(json.decode(response.body));
            print(userData?.status);
            if (response.statusCode == 200 && userData!.status == "Check your mail!" ) {


                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => get_started()));
                // Fluttertoast.showToast(
                //   msg: "Logged In Successfully",
                //   textColor: Colors.white,
                //   toastLength: Toast.LENGTH_SHORT,
                //   timeInSecForIosWeb: 1,
                //   gravity: ToastGravity.BOTTOM,
                //   backgroundColor: Colors.indigo,
                // );

                if (kDebugMode) {}

                _email.text = "";


              // else{
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => loginsuccess()));
              //
              //   print("vfvfdg");
              // }

            } else {

              // Fluttertoast.showToast(
              //   msg: "Enter A Valid Email Address",
              //   textColor: Colors.white,
              //   toastLength: Toast.LENGTH_SHORT,
              //   timeInSecForIosWeb: 1,
              //   gravity: ToastGravity.BOTTOM,
              //   backgroundColor: Colors.indigo,
              // );
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            child: Text(
                              'Invalid Login',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                  );
                },
              );
            }
          });
        } else {}
      });
    }
  }

}

