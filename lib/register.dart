import 'package:casadealerapp/getstarted.dart';
import 'package:casadealerapp/loginsuccess.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _companyname = TextEditingController();
  TextEditingController _companyname1 = TextEditingController();

  TextEditingController _phone = TextEditingController();
  TextEditingController _phone1 = TextEditingController();

  // TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password1 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible1 = false;
  bool _passwordVisible = false;

  String? gender = "male";
  bool? check3 = false;
  var select = "i1";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffFFFFFF),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/download.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 2,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.h),
                        child: Container(
                          child: Text("Register",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff3b3b8e))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                          controller: _firstname,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.h),
                            hintText: 'Full Name',
                            suffixIcon: Icon(
                              Icons.person_outline,
                              color: Color(0xfff9696c1),
                              size: 3.5.h,
                            ),
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
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your company name";
                            }
                            return null;
                          },
                          controller: _companyname,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.h),
                            hintText: 'Company Name',
                            suffixIcon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Color(0xfff9696c1),
                              size: 3.5.h,
                            ),
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
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your company address";
                            }
                            return null;
                          },
                          controller: _companyname1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.h),
                            hintText: 'Company Address',
                            suffixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xfff9696c1),
                              size: 3.5.h,
                            ),
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
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value?.length != 10)
                              return 'Mobile Number must be of 10 digit';
                            else
                              return null;
                          },
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.h),
                            hintText: 'Phone No. 1',
                            suffixIcon: Icon(
                              Icons.phone_outlined,
                              color: Color(0xfff9696c1),
                              size: 3.5.h,
                            ),
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
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value?.length != 10)
                              return 'Mobile Number must be of 10 digit';
                            else
                              return null;
                          },
                          controller: _phone1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.h),
                            hintText: 'Phone No. 2',
                            suffixIcon: Icon(
                              Icons.phone_outlined,
                              color: Color(0xfff9696c1),
                              size: 3.5.h,
                            ),
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
                        height: 20,
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
                                  color: Color(0xfff9696c1),

                                  _passwordVisible
                                      ? Icons.lock_outline
                                      : Icons.lock,
                                ),
                              ),

                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(2.h),
                              hintText: 'Create Password'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          obscureText: !_passwordVisible1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Re-Enter password";
                            }
                            return null;
                          },
                          controller: _password1,
                          decoration: InputDecoration(
                              //  prefixIcon: Icon(Icons.login),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible1 = !_passwordVisible1;
                                  });
                                },
                                icon: Icon(
                                  color: Color(0xfff9696c1),

                                  _passwordVisible1
                                      ? Icons.lock_outline
                                      : Icons.lock,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(2.h),
                              hintText: 'Re-Enter Password'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => loginsuccess()));
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
                        padding: EdgeInsets.only(left: 9.h, top: 2.5.h),
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 2.h),
                              ),
                              GestureDetector(
                                  onTap: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => register(),
                                        ),
                                      );

                                  },
                                  child: Text(
                                    "   Login",
                                    style: TextStyle(
                                        color: Color(0xfff494996),
                                        fontSize: 2.h),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
