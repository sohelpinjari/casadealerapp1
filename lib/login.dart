import 'package:casadealerapp/register.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

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
                'assets/login-2.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 2,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 20.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(right: 38.h, top: 1.h),
                      child: Container(
                        // alignment: Alignment.centerLeft,
                        child: Text("LogIn",
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
                        validator: (value) {
                          String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                              "\\@" +
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                              "(" +
                              "\\." +
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                              ")+";
                          //Convert string p to a RegE  x
                          RegExp regExp = RegExp(p);

                          if (value!.isEmpty) {
                            return 'Please enter Your Email';
                          } else {
                            //If email address matches pattern
                            if (regExp.hasMatch(value)) {
                              return null;
                            } else {
                              //If it doesn't match
                              return 'Email is not valid';
                            }
                          }
                        },
                        controller: _email,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.person_outline,
                            color: Color(0xfff9696c1),
                            size: 3.5.h,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(2.h),
                          hintText: 'Phone Number or Email',
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
                      decoration: BoxDecoration(
                        color: Color(0xfffFBFBFB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        controller: _password,
                        decoration: InputDecoration(
                            //  prefixIcon: Icon(Icons.login),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.lock_outline
                                    : Icons.lock,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.h),
                            hintText: 'Password'),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 25.h, top: 2.5.h),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffdd2a45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      // color: Color(0xfff333389),
                      // padding:
                      //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Validate");
                            // Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            // builder: (context) => const Dashboard()));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 2.5.h),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfff333389),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 14.h, top: 2.5.h),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "New Here?",
                              style: TextStyle(fontSize: 2.h),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => register()));
                                },
                                child: Text(
                                  "   Register",
                                  style: TextStyle(
                                      color: Color(0xfff494996), fontSize: 2.h),
                                ))
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
