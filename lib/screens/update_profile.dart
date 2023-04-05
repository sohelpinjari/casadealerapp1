import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/loader.dart';
import 'package:casadealerapp/modal_class/new_password_class.dart';
import 'package:casadealerapp/modal_class/profileU.dart';
import 'package:casadealerapp/provider/productprovider.dart';
import 'package:casadealerapp/screens/drawer.dart';
import 'package:casadealerapp/screens/profile_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

class updateProfile extends StatefulWidget {
  String? prfileFullName;
  String? prfilePhone1;
  String? prfilePhone2;
  String? prfileCompanyname;
  String? prfileEmailaddress;
  String? prfileCompanyaddress;
   updateProfile({Key? key,  this.prfileFullName,this.prfilePhone1,this.prfilePhone2,this.prfileEmailaddress,this.prfileCompanyname,this.prfileCompanyaddress}) : super(key: key);

  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {


  changePassword? changepass;
  updateProfile2? upadateP;

  List<String> tabs = ["Profile", "Change Password"];
  int sumindex = 0;




  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _companyname = TextEditingController();
  TextEditingController _companyname1 = TextEditingController();

  TextEditingController _phone = TextEditingController();
  TextEditingController _phone1 = TextEditingController();

  // TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password1 = TextEditingController();
  TextEditingController _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible1 = false;
  bool _passwordVisible = false;

  String? gender = "male";
  bool? check3 = false;
  var select = "i1";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateProapi();

    _firstname.text = widget.prfileFullName.toString();
    _companyname.text = widget.prfileCompanyname.toString();
    _companyname1.text = widget.prfileCompanyaddress.toString();
    _phone.text = widget.prfilePhone1.toString();
    _phone1.text = widget.prfilePhone2.toString();
    // _password.text = widget.prfile.toString();
    // _password1.text = widget.prfileFullName.toString();
    _email.text = widget.prfileEmailaddress.toString();

  }

  Widget build(BuildContext context) {
    return   Scaffold(

          backgroundColor: Color(0xfffFFFFFF),
          drawer: drawer(context),
          key: _scaffoldKey,
          body: Column(
            children: [
              Column(
                children: [




                  //========================================================================
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 11.h,
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 0.h, left: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _scaffoldKey.currentState?.openDrawer();
                                    },
                                    icon: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.3.h,
                                  ),
                                  Container(
                                    // padding: EdgeInsets.only(top: 1.5.h),
                                    // alignment: Alignment.center,
                                    child: Text(
                                      "Profile Update",
                                      style: TextStyle(
                                          fontSize: 2.h, color: Colors.white),
                                    ),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff333389),
                      // borderRadius: BorderRadius.all(
                      //   Radius.circular(10),
                      // ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Color(0xfff9e9ec7))),
                            alignment: Alignment.center,
                            height: 6.5.h,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: tabs.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        sumindex = index;
                                      });
                                    },
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: (sumindex == index)
                                                ? Color(0xfff333389)
                                                : Color(0xfffFFFFFF),
                                          ),

                                          height: 5.h,
                                          width: 44.w,
                                          margin: EdgeInsets.only(right: 0.1.w, top: 0.6.h),

                                          // padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
                                          child: Text(
                                            tabs[index],
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                              color: (sumindex != index)
                                                  ? Colors.grey.shade600
                                                  : Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                        // (selectindex != index)
                                        //     ? Container()
                                        //     : Center(
                                        //         child: Container(
                                        //             height: 7.0,
                                        //             width: 7.0,
                                        //             decoration: BoxDecoration(
                                        //                 shape: BoxShape.circle,
                                        //                 color: Color(0xffb4776e6)
                                        //             )
                                        //         ),
                                        //       ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        (sumindex == 0)
                            ? Column(
                          children: [
                        //     SizedBox(
                        //   height: 2.h,
                        // ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: TextFormField(
                                // upadateP?.updated?.fullName ?? '',
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
                                  // suffixIcon: Icon(
                                  //   Icons.person_outline,
                                  //   color: Color(0xfff9696c1),
                                  //   size: 3.5.h,
                                  // ),
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
                                  // suffixIcon: Icon(
                                  //   Icons.shopping_bag_outlined,
                                  //   color: Color(0xfff9696c1),
                                  //   size: 3.5.h,
                                  // ),
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
                                  // suffixIcon: Icon(
                                  //   Icons.location_on_outlined,
                                  //   color: Color(0xfff9696c1),
                                  //   size: 3.5.h,
                                  // ),
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
                                  // suffixIcon: Icon(
                                  //   Icons.person_outline,
                                  //   color: Color(0xfff9696c1),
                                  //   size: 3.5.h,
                                  // ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(2.h),
                                  hintText: 'Email Address',
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
                                  // suffixIcon: Icon(
                                  //   Icons.phone_outlined,
                                  //   color: Color(0xfff9696c1),
                                  //   size: 3.5.h,
                                  // ),
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
                                // validator: (value) {
                                //   if (value?.length != 10)
                                //     return 'Mobile Number must be of 10 digit';
                                //   else
                                //     return null;
                                // },
                                controller: _phone1,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(2.h),
                                  hintText: 'Phone 2 (optional)',
                                  // suffixIcon: Icon(
                                  //   Icons.phone_outlined,
                                  //   color: Color(0xfff9696c1),
                                  //   size: 3.5.h,
                                  // ),
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
                              height: MediaQuery.of(context).size.height * 0.06,
                              // color: Color(0xfff333389),
                              // padding:
                              //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {

                                    updateProapi();



                                    // Navigator.push(
                                    // context,
                                    // MaterialPageRoute(
                                    // builder: (context) => profileView()));
                                  }
                                },
                                child: Text(
                                  'Update',
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
                            SizedBox(height: 2.h,)
                          ],
                        )
                            : Column(
                          children: [
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
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(2.h),
                                    hintText: 'Create new Password'),
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
                                  }else if (value != _password.text) {
                                    return "Passwords do not match";
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
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(2.h),
                                    hintText: 'Re-Enter Password'),
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.06,
                              // color: Color(0xfff333389),
                              // padding:
                              //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                    print("Validate");
                                    changepass1Proapi();

                                    // Navigator.push(
                                    // context,
                                    // MaterialPageRoute(
                                    // builder: (context) => profileView()));
                                  // }
                                },
                                child: Text(
                                  'Change Password',
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

                          ],

                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

    );
  }

  updateProapi() async {
    final Map<String, String> data = {};
    data['action'] = "update_distributor_data";
    data['d_id'] = (userData?.logindata?.dId).toString();
    data['full_name'] = _firstname.text.trim().toString();
    data['company_name'] = _companyname.text.trim().toString();
    data['phone_one'] = _phone.text.trim().toString();
    data['phone_two'] = _phone1.text.trim().toString();
    data['email_id'] = _email.text.trim().toString();
    data['address'] = _companyname1.text.trim().toString();



    print(data);


    if (_formKey.currentState!.validate()) {
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider().UpdateprofileProvider(data).then((Response response) async {
          print(response.body);

          upadateP = updateProfile2.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && upadateP?.status == "success") {
            // print(upadateP?.status);

            setState(() {

              // viewProapi();
            });
            // SaveDataLocal.saveLogInData(userData!);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => profileView()));
            // Fluttertoast.showToast(
            //   msg: "Logged In Successfully",
            //   textColor: Colors.white,
            //   toastLength: Toast.LENGTH_SHORT,
            //   timeInSecForIosWeb: 1,
            //   gravity: ToastGravity.BOTTOM,
            //   backgroundColor: Colors.indigo,
            // );

            if (kDebugMode) {}


          } else {

            setState(() {


            });

            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return Dialog(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //       backgroundColor: Colors.transparent,
            //       child: Container(
            //         height: 25.h,
            //         width: 80.w,
            //         // padding: EdgeInsets.all(5.w),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(16),
            //         ),
            //         child: Stack(
            //           children: [
            //
            //             Container(
            //               height: 25.h,
            //               width: 80.w,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(16),
            //               ),
            //               // borderRadius: BorderRadius.circular(16),
            //               padding: EdgeInsets.all(3.w),
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //
            //                       Row(
            //                         children: [
            //                           // Icon(Icons.edit,color:Colors.white ,),
            //                           Text(
            //                             "",
            //                             style: TextStyle(
            //                                 decoration: TextDecoration.underline,
            //                                 fontSize: 16.sp,
            //                                 color: Colors.white,
            //                                 fontWeight: FontWeight.bold,
            //                                 fontFamily: "Poppins"),
            //                           ),
            //                         ],
            //                       ),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.of(context).pop();
            //                           },
            //                           icon: Icon(
            //                             Icons.close,
            //                             color: Colors.black,
            //                           ))
            //                     ],
            //                   ),
            //                   Form(
            //
            //                     child: Column(
            //                       children: [
            //                         SizedBox(
            //                           height: 2.h,
            //                         ),
            //                         Text(
            //                           "User already exist",
            //                           style: TextStyle(
            //
            //                               fontSize: 12.sp,
            //                               color: Colors.black,
            //                               fontWeight: FontWeight.bold,
            //                               fontFamily: "Poppins"),
            //                         ),
            //
            //
            //                         // TextFormField(
            //                         //   controller: _title,
            //                         //   keyboardType: TextInputType.text,
            //                         //   validator: (value) {
            //                         //     if (value!.isEmpty) {
            //                         //       return 'Please enter your subject';
            //                         //     }
            //                         //     return null;
            //                         //   },
            //                         //   decoration: InputDecoration(
            //                         //     contentPadding: EdgeInsets.all(2.0),
            //                         //     prefixIcon: Icon(Icons.add,color: Colors.grey,),
            //                         //     filled: true,
            //                         //     hintText: "Subject",
            //                         //     hintStyle: textstyle,
            //                         //     fillColor: Colors.white,
            //                         //     enabledBorder: OutlineInputBorder(
            //                         //         borderSide: BorderSide.none,
            //                         //         borderRadius: BorderRadius.circular(30.0)),
            //                         //     focusedBorder: OutlineInputBorder(
            //                         //         borderSide: BorderSide.none,
            //                         //         borderRadius: BorderRadius.circular(30.0)),
            //                         //   ),
            //                         // ),
            //
            //                         Padding(
            //                           padding: EdgeInsets.all(3.w),
            //                           child: Container(
            //                             width: 40.w,
            //                             decoration: BoxDecoration(
            //                               color: Color(0xff333389),
            //                               borderRadius: BorderRadius.circular(30.0),
            //                               // boxShadow: [
            //                               //   BoxShadow(
            //                               //     color: Color(0xff333389),
            //                               //     offset: Offset(0, 10),
            //                               //     blurRadius: 10,
            //                               //     spreadRadius: -5,
            //                               //   ),
            //                               // ],
            //                               // border: Border.all(color: Colors.white,width: 1.0)
            //                             ),
            //                             height: 40.0,
            //                             child: TextButton(
            //                               style: ButtonStyle(
            //                                 alignment: Alignment.center,
            //                                 // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            //                                 padding: MaterialStateProperty.all(
            //                                   EdgeInsets.symmetric(vertical: 1.h),
            //                                 ),
            //                                 shape:
            //                                 MaterialStateProperty.all<RoundedRectangleBorder>(
            //                                     RoundedRectangleBorder(
            //                                       borderRadius: BorderRadius.circular(20.sp),
            //                                     )),
            //                               ),
            //                               onPressed: () {
            //                                 Navigator.of(context).pop();
            //
            //                               },
            //                               child: Row(
            //                                 mainAxisAlignment: MainAxisAlignment.center,
            //                                 children: [
            //                                   Text(
            //                                     "Oky",
            //                                     style: TextStyle(
            //                                         color: Colors.white,
            //                                         fontSize: 14.sp,
            //                                         fontFamily: "Poppins",
            //                                         fontWeight: FontWeight.bold),
            //                                   ),
            //                                   SizedBox(
            //                                     width: 5.0,
            //                                   ),
            //                                   // Icon(
            //                                   //   Icon,
            //                                   //   color: Colors.grey.shade700,
            //                                   // )
            //
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
          }
        });
      } else {}
    });

  }
}

  changepass1Proapi() async {
    final Map<String, String> data = {};
    data['action'] = "change_password_page";
    data['myNew_password'] = _password.text.trim().toString();
    data['d_id'] =  (userData?.logindata?.dId).toString();
    if (_formKey.currentState!.validate()) {
      checkInternet().then((internet) async {
        if (internet) {
          Productprovider().updatePasswordProvider(data).then((Response response) async {
            print(response.body);

            changepass = changePassword.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && changepass?.status == "success") {
              // print(upadateP?.status);

              setState(() {

                // viewProapi();
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.transparent,
                    child: Container(
                      height: 25.h,
                      width: 80.w,
                      // padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [

                          Container(
                            height: 25.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            // borderRadius: BorderRadius.circular(16),
                            padding: EdgeInsets.all(3.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Row(
                                      children: [
                                        // Icon(Icons.edit,color:Colors.white ,),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Poppins"),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                                Form(

                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        "Password changed successfully",
                                        style: TextStyle(

                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins"),
                                      ),


                                      // TextFormField(
                                      //   controller: _title,
                                      //   keyboardType: TextInputType.text,
                                      //   validator: (value) {
                                      //     if (value!.isEmpty) {
                                      //       return 'Please enter your subject';
                                      //     }
                                      //     return null;
                                      //   },
                                      //   decoration: InputDecoration(
                                      //     contentPadding: EdgeInsets.all(2.0),
                                      //     prefixIcon: Icon(Icons.add,color: Colors.grey,),
                                      //     filled: true,
                                      //     hintText: "Subject",
                                      //     hintStyle: textstyle,
                                      //     fillColor: Colors.white,
                                      //     enabledBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide.none,
                                      //         borderRadius: BorderRadius.circular(30.0)),
                                      //     focusedBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide.none,
                                      //         borderRadius: BorderRadius.circular(30.0)),
                                      //   ),
                                      // ),

                                      Padding(
                                        padding: EdgeInsets.all(3.w),
                                        child: Container(
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff333389),
                                            borderRadius: BorderRadius.circular(30.0),
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     color: Color(0xff333389),
                                            //     offset: Offset(0, 10),
                                            //     blurRadius: 10,
                                            //     spreadRadius: -5,
                                            //   ),
                                            // ],
                                            // border: Border.all(color: Colors.white,width: 1.0)
                                          ),
                                          height: 40.0,
                                          child: TextButton(
                                            style: ButtonStyle(
                                              alignment: Alignment.center,
                                              // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                                              padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(vertical: 1.h),
                                              ),
                                              shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.sp),
                                                  )),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();

                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Oky",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp,
                                                      fontFamily: "Poppins",
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                // Icon(
                                                //   Icon,
                                                //   color: Colors.grey.shade700,
                                                // )

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );




              // SaveDataLocal.saveLogInData(userData!);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => profileView()));
              // Fluttertoast.showToast(
              //   msg: "Logged In Successfully",
              //   textColor: Colors.white,
              //   toastLength: Toast.LENGTH_SHORT,
              //   timeInSecForIosWeb: 1,
              //   gravity: ToastGravity.BOTTOM,
              //   backgroundColor: Colors.indigo,
              // );

              if (kDebugMode) {}


            } else {

              setState(() {


              });


            }
          });
        } else {}
      });

    }
  }



}
