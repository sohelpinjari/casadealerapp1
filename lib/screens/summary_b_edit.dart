import 'dart:convert';

import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/build_dialog.dart';
import 'package:casadealerapp/main.dart';
import 'package:casadealerapp/modal_class/summarEditBlock.dart';
import 'package:casadealerapp/modal_class/summaryEditCart.dart';
import 'package:casadealerapp/provider/productprovider.dart';
import 'package:casadealerapp/screens/drawer.dart';
import 'package:casadealerapp/screens/summary.dart';
import 'package:casadealerapp/screens/your_block_order.dart';
import 'package:casadealerapp/screens/your_order.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

class summary_b_edit extends StatefulWidget {
  const summary_b_edit({Key? key}) : super(key: key);

  @override
  State<summary_b_edit> createState() => _summary_b_editState();
}

class _summary_b_editState extends State<summary_b_edit> {

  RegExp regex = RegExp(r'^\d+$');
  // Mumbai contriller
  TextEditingController _search = TextEditingController();
  TextEditingController _xs = TextEditingController();
  TextEditingController _m = TextEditingController();
  TextEditingController _s = TextEditingController();
  TextEditingController _l = TextEditingController();
  TextEditingController _xl = TextEditingController();
  TextEditingController _xxl = TextEditingController();
  TextEditingController _3xl = TextEditingController();
  TextEditingController _4xl = TextEditingController();
  TextEditingController _5xl = TextEditingController();

  //Tripur controller

  TextEditingController _txs = TextEditingController();
  TextEditingController _tm = TextEditingController();
  TextEditingController _ts = TextEditingController();
  TextEditingController _tl = TextEditingController();
  TextEditingController _txl = TextEditingController();
  TextEditingController _txxl = TextEditingController();
  TextEditingController _t3xl = TextEditingController();
  TextEditingController _t4xl = TextEditingController();
  TextEditingController _t5xl = TextEditingController();

  //TOTAL CONTROLLLER
  TextEditingController _totalms = TextEditingController();
  TextEditingController _totalxs = TextEditingController();
  TextEditingController _totalmm = TextEditingController();
  TextEditingController _total_ll = TextEditingController();
  TextEditingController _total_xl = TextEditingController();
  TextEditingController _total_xxl = TextEditingController();
  TextEditingController _total_3xl = TextEditingController();
  TextEditingController _total_4xl = TextEditingController();
  TextEditingController _total_5xl = TextEditingController();
  summryEditBlockProduct? summeryeditblock;
  summryEditCartProduct? summaryeditcart;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool? check = false;
  int sum = 0;
  int sumindex = 0;
  List<String> tabs = ["Blocked", "Cart"];
  List<bool> checkbox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int cart = 0;
  int i = 1000;
  int i2 = 1000;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffFFFFFF),
      drawer: drawer(context),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
                                "Summary",
                                style:
                                    TextStyle(fontSize: 2.h, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 14.h,
                        // ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {
                        //         // _scaffoldKey.currentState?.openDrawer();
                        //       },
                        //       icon: Icon(
                        //         Icons.search,
                        //         color: Colors.white,
                        //         size: 3.h,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 1.h,
                        //     ),
                        //     IconButton(
                        //       onPressed: () {
                        //         // _scaffoldKey.currentState?.openDrawer();
                        //       },
                        //       icon: Icon(
                        //         Icons.shopping_bag_outlined,
                        //         color: Colors.white,
                        //         size: 3.h,
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                              margin:
                                  EdgeInsets.only(right: 0.1.w, top: 0.6.h),

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
                      Container(
                        height: 70.h,
                        child: ListView.builder(
                          // padding: EdgeInsets.all(0),
                          // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                          // horizontalTitleGap: 0.0,

                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Product Name',
                                          style: TextStyle(
                                            color: Color(0xff848484),
                                            fontSize: 1.5.h,
                                          )),
                                      Text('Color',
                                          style: TextStyle(
                                            color: Color(0xff848484),
                                            fontSize: 1.5.h,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Ruffty Tipping',
                                          style: TextStyle(
                                              color: Color(0xff35358a),
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold)),
                                      Text('Bottle Green',
                                          style: TextStyle(
                                            color: Color(0xff35358a),
                                            fontSize: 2.h,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Price',
                                      style:
                                          TextStyle(color: Color(0xff848484)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.h,
                                        child: Row(
                                          children: [
                                            Text('XS - 3XL :',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(' ₹250',
                                                style: TextStyle(
                                                    color: Color(0xff35358a),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              '4XL- 5XL :',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              ' ₹280',
                                              style: TextStyle(
                                                color: Color(0xff35358a),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             summary_b_edit()));

                                          editBlock();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 20.5.w,
                                          child: Text(
                                            'Update',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 1.5.h),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xff333389),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Divider(
                                    height: 3.h,
                                    thickness: 0.3.w,
                                    color: Color(0xff50509a),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('Gender',
                                            style: TextStyle(
                                              color: Color(0xff848484),
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Male',
                                          style: TextStyle(
                                              fontSize: 2.3.h,
                                              color: Color(0xff35358a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('State',
                                            style: TextStyle(
                                              color: Color(0xff848484),
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Mumbai',
                                          style: TextStyle(
                                              fontSize: 2.3.h,
                                              color: Color(0xff35358a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        // color: Colors.red,
                                        child: Text(
                                          'XS',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'M',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'L',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //   EdgeInsets.symmetric(horizontal: 2.h),
                                //   // child: Row(
                                //   //   crossAxisAlignment:
                                //   //       CrossAxisAlignment.center,
                                //   //   mainAxisAlignment:
                                //   //       MainAxisAlignment.spaceAround,
                                //   //   children: [
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //   ],
                                //   // ),
                                // ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                         // ( summeryeditblock?.status).toString(),
                                          controller: _xs,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _s,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _m,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _l,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '2XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '3XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '4XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '5XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          'TOTAL',
                                          style: TextStyle(
                                              fontSize: 1.5.h,
                                              color: Color(0XFF50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _xxl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _3xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _4xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _5xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10),
                                              bottomLeft:
                                                  Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          '8888',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Color(0Xff50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.h),
                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      lineLength: double.infinity,
                                      lineThickness: 1.0,
                                      dashLength: 5.0,
                                      dashColor: Color(0xff8d8d8d),
                                      // dashGradient: [Colors.red, Colors.blue],
                                      dashRadius: 0.0,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                      // dashGapGradient: [Colors.red, Colors.blue],
                                      dashGapRadius: 0.0,
                                    )),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('State',
                                            style: TextStyle(
                                              color: Color(0xff848484),
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Tripur',
                                          style: TextStyle(
                                              fontSize: 2.3.h,
                                              color: Color(0xff35358a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'XS',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'M',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'L',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //   EdgeInsets.symmetric(horizontal: 2.h),
                                //   // child: Row(
                                //   //   crossAxisAlignment:
                                //   //       CrossAxisAlignment.center,
                                //   //   mainAxisAlignment:
                                //   //       MainAxisAlignment.spaceAround,
                                //   //   children: [
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //   ],
                                //   // ),
                                // ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _txs,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _ts,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _tm,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _tl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _txl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '2XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '3XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '4XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '5XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          'TOTAL',
                                          style: TextStyle(
                                              fontSize: 1.5.h,
                                              color: Color(0XFF50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _txxl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _t3xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _t4xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _t5xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10),
                                              bottomLeft:
                                                  Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          '8888',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Color(0Xff50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 6.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfffeaeaf3),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          ' Grand Total:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 2.h),
                                        ),
                                        Text(
                                          '   ₹99,99,999 + GST',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 2.h,
                                              color: Color(0xff333389)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                              ],
                            );
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 1.3.h,
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 9.h,
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => summary()));
                                    setState(() {
                                      cart = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: (cart == 0)
                                            ? Colors.white
                                            : Color(0xfff333389),
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Text(
                                      'Exit',
                                      style: TextStyle(
                                          color: (cart == 0)
                                              ? Color(0xff333389)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.2.h),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => your_block_order()));
                                    setState(() {
                                      cart = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: (cart == 1)
                                            ? Colors.white
                                            : Color(0xfff333389),
                                        // color:_selectedColor,

                                        borderRadius:
                                            BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          color: (cart == 1)
                                              ? Color(0xff333389)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.2.h),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(10),
                          // ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(
                    child: Column(
                    children: [
                      Container(
                        height: 70.h,
                        child: ListView.builder(
                          // padding: EdgeInsets.all(0),
                          // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                          // horizontalTitleGap: 0.0,

                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Product Name',
                                          style: TextStyle(
                                            color: Color(0xff848484),
                                            fontSize: 1.5.h,
                                          )),
                                      Text('Color',
                                          style: TextStyle(
                                            color: Color(0xff848484),
                                            fontSize: 1.5.h,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Ruffty Tipping',
                                          style: TextStyle(
                                              color: Color(0xff35358a),
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold)),
                                      Text('Bottle Green',
                                          style: TextStyle(
                                            color: Color(0xff35358a),
                                            fontSize: 2.h,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Price',
                                      style:
                                          TextStyle(color: Color(0xff848484)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.h,
                                        child: Row(
                                          children: [
                                            Text('XS - 3XL :',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(' ₹250',
                                                style: TextStyle(
                                                    color: Color(0xff35358a),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              '4XL- 5XL :',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              ' ₹280',
                                              style: TextStyle(
                                                color: Color(0xff35358a),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             summary_b_edit()));
                                          editCart();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 20.5.w,
                                          child: Text(
                                            'Update',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 1.5.h),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xff333389),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Divider(
                                    height: 3.h,
                                    thickness: 0.3.w,
                                    color: Color(0xff50509a),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('Gender',
                                            style: TextStyle(
                                              color: Color(0xff848484),
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Male',
                                          style: TextStyle(
                                              fontSize: 2.3.h,
                                              color: Color(0xff35358a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('State',
                                            style: TextStyle(
                                              color: Color(0xff848484),
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Mumbai',
                                          style: TextStyle(
                                              fontSize: 2.3.h,
                                              color: Color(0xff35358a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        // color: Colors.red,
                                        child: Text(
                                          'XS',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'M',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'L',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //   EdgeInsets.symmetric(horizontal: 2.h),
                                //   // child: Row(
                                //   //   crossAxisAlignment:
                                //   //       CrossAxisAlignment.center,
                                //   //   mainAxisAlignment:
                                //   //       MainAxisAlignment.spaceAround,
                                //   //   children: [
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //   ],
                                //   // ),
                                // ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _xs,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _s,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _m,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                            controller: _l,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(

                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '2XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '3XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '4XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '5XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          'TOTAL',
                                          style: TextStyle(
                                              fontSize: 1.5.h,
                                              color: Color(0XFF50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _xxl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _3xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _4xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _5xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10),
                                              bottomLeft:
                                                  Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          '8888',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Color(0Xff50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.h),
                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      lineLength: double.infinity,
                                      lineThickness: 1.0,
                                      dashLength: 5.0,
                                      dashColor: Color(0xff8d8d8d),
                                      // dashGradient: [Colors.red, Colors.blue],
                                      dashRadius: 0.0,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                      // dashGapGradient: [Colors.red, Colors.blue],
                                      dashGapRadius: 0.0,
                                    )),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('State',
                                            style: TextStyle(
                                              color: Color(0xff848484),
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Tripur',
                                          style: TextStyle(
                                              fontSize: 2.3.h,
                                              color: Color(0xff35358a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'XS',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'M',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'L',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          'XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //   EdgeInsets.symmetric(horizontal: 2.h),
                                //   // child: Row(
                                //   //   crossAxisAlignment:
                                //   //       CrossAxisAlignment.center,
                                //   //   mainAxisAlignment:
                                //   //       MainAxisAlignment.spaceAround,
                                //   //   children: [
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //     Container(
                                //   //       height: 0.1.h,
                                //   //       width: 15.w,
                                //   //       color: Colors.black,
                                //   //     ),
                                //   //   ],
                                //   // ),
                                // ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _txs,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _ts,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _tm,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _tl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _txl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '2XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '3XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '4XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '5XL',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          'TOTAL',
                                          style: TextStyle(
                                              fontSize: 1.5.h,
                                              color: Color(0XFF50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        // color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _txxl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _t3xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _t4xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.4.h,
                                        width: 16.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(color: Colors.black),
                                            border: Border.all()),
                                        child: TextField(
                                          controller: _t5xl,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10),
                                              bottomLeft:
                                                  Radius.circular(10)),
                                          color: Color(0Xffeaeaf3),
                                        ),
                                        child: Text(
                                          '8888',
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              color: Color(0Xff50509a),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 6.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfffeaeaf3),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          ' Grand Total:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 2.h),
                                        ),
                                        Text(
                                          '   ₹99,99,999 + GST',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 2.h,
                                              color: Color(0xff333389)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                              ],
                            );
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 1.3.h,
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 9.h,
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => summary()));
                                    setState(() {
                                      cart = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: (cart == 0)
                                            ? Colors.white
                                            : Color(0xfff333389),
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Text(
                                      'Exit',
                                      style: TextStyle(
                                          color: (cart == 0)
                                              ? Color(0xff333389)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.2.h),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => your_order()));
                                    setState(() {
                                      cart = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: (cart == 1)
                                            ? Colors.white
                                            : Color(0xfff333389),
                                        // color:_selectedColor,

                                        borderRadius:
                                            BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          color: (cart == 1)
                                              ? Color(0xff333389)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.2.h),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(10),
                          // ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
          ],
        ),
      ),
    );
  }



  editBlock() async {
    final Map<String, String> data = {};
    data['action'] = 'edit_block_single_product';
    data['t_ap_id'] = '2';
    data['t_apd_id'] ='2';
    data['m_ap_id'] = '1';
    data['m_apd_id'] = '1';
    data['d_id'] = (userData?.logindata?.dId).toString();
    data['gender_type'] =gen == 0 ? "MEN" : "WOMEN";
    //Mumbai Data
    data['m_xs'] =
    _xs.text.trim().toString() == "" ? "0" : _xs.text.trim().toString();

    data['m_s'] =
    _s.text.trim().toString() == "" ? "0" : _s.text.trim().toString();
    data['m_m'] =
    _m.text.trim().toString() == "" ? "0" : _m.text.trim().toString();
    data['m_l'] =
    _l.text.trim().toString() == "" ? "0" : _l.text.trim().toString();
    data['m_xl'] =
    _xl.text.trim().toString() == "" ? "0" : _xl.text.trim().toString();
    data['m_xxl'] =
    _xxl.text.trim().toString() == "" ? "0" : _xxl.text.trim().toString();
    data['m_3xl'] =
    _3xl.text.trim().toString() == "" ? "0" : _3xl.text.trim().toString();
    data['m_4xl'] =
    _4xl.text.trim().toString() == "" ? "0" : _4xl.text.trim().toString();
    data['m_5xl'] =
    _5xl.text.trim().toString() == "" ? "0" : _5xl.text.trim().toString();

    //Tripur  Data

    data['t_xs'] =
    _txs.text.trim().toString() == "" ? "0" : _txs.text.trim().toString();
    data['t_s'] =
    _ts.text.trim().toString() == "" ? "0" : _ts.text.trim().toString();
    data['t_m'] =
    _tm.text.trim().toString() == "" ? "0" : _tm.text.trim().toString();
    data['t_l'] =
    _tl.text.trim().toString() == "" ? "0" : _tl.text.trim().toString();
    data['t_xl'] =
    _txl.text.trim().toString() == "" ? "0" : _txl.text.trim().toString();
    data['t_xxl'] =
    _txxl.text.trim().toString() == "" ? "0" : _txxl.text.trim().toString();
    data['t_3xl'] =
    _t3xl.text.trim().toString() == "" ? "0" : _t3xl.text.trim().toString();
    data['t_4xl'] =
    _t4xl.text.trim().toString() == "" ? "0" : _t4xl.text.trim().toString();
    data['t_5xl'] =
    _t5xl.text.trim().toString() == "" ? "0" : _t5xl.text.trim().toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider()
            .summeryEditBlockProvider(data)
            .then((Response response) async {
          summeryeditblock = summryEditBlockProduct.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && summeryeditblock?.status == "success") {

            // Navigator.of(this.context).push(MaterialPageRoute(builder: (context)=>summary(pronamenevigatior: widget.pronamenevigatior,
            //     coloridnevigator:  product2color
            //         ?.data?[
            //     selectbtn]
            //         .colorName ,gender: gen == 0 ? "MEN" : "WOMEN")));
            // // _s.text = "";
            // _ts.text = "";
            // _totalms.text = "";
            //
            // _xs.text = "";
            // _txs.text = "";
            // _totalxs.text = "";
            //
            // _m.text = "";
            // _tm.text = "";
            // _totalmm.text = "";
            //
            // _l.text = "";
            // _tl.text = "";
            // _total_ll.text = "";
            //
            // _xl.text = "";
            // _txl.text = "";
            // _total_xl.text = "";
            //
            // _xxl.text = "";
            // _txxl.text = "";
            // _total_xxl.text = "";
            //
            // _3xl.text = "";
            // _t3xl.text = "";
            // _total_3xl.text = "";
            //
            // _4xl.text = "";
            // _t4xl.text = "";
            // _total_4xl.text = "";
            //
            // _5xl.text = "";
            // _t5xl.text = "";
            // _total_5xl.text = "";
            if (kDebugMode) {}
          } else {
            buildErrorDialog1(this.context, "",  'Already product added to cart');


          }
        });
      } else {



      }
    });
  }

  editCart() async {
    final Map<String, String> data = {};
    data['action'] = 'edit_add_to_cart_single_product';
    data['t_ap_id'] = '2';
    data['t_apd_id'] ='2';
    data['m_ap_id'] = '1';
    data['m_apd_id'] = '1';
    data['d_id'] = (userData?.logindata?.dId).toString();
    data['gender_type'] =gen == 0 ? "MEN" : "WOMEN";
    //Mumbai Data
    data['m_xs'] =
    _xs.text.trim().toString() == "" ? "0" : _xs.text.trim().toString();

    data['m_s'] =
    _s.text.trim().toString() == "" ? "0" : _s.text.trim().toString();
    data['m_m'] =
    _m.text.trim().toString() == "" ? "0" : _m.text.trim().toString();
    data['m_l'] =
    _l.text.trim().toString() == "" ? "0" : _l.text.trim().toString();
    data['m_xl'] =
    _xl.text.trim().toString() == "" ? "0" : _xl.text.trim().toString();
    data['m_xxl'] =
    _xxl.text.trim().toString() == "" ? "0" : _xxl.text.trim().toString();
    data['m_3xl'] =
    _3xl.text.trim().toString() == "" ? "0" : _3xl.text.trim().toString();
    data['m_4xl'] =
    _4xl.text.trim().toString() == "" ? "0" : _4xl.text.trim().toString();
    data['m_5xl'] =
    _5xl.text.trim().toString() == "" ? "0" : _5xl.text.trim().toString();

    //Tripur  Data

    data['t_xs'] =
    _txs.text.trim().toString() == "" ? "0" : _txs.text.trim().toString();
    data['t_s'] =
    _ts.text.trim().toString() == "" ? "0" : _ts.text.trim().toString();
    data['t_m'] =
    _tm.text.trim().toString() == "" ? "0" : _tm.text.trim().toString();
    data['t_l'] =
    _tl.text.trim().toString() == "" ? "0" : _tl.text.trim().toString();
    data['t_xl'] =
    _txl.text.trim().toString() == "" ? "0" : _txl.text.trim().toString();
    data['t_xxl'] =
    _txxl.text.trim().toString() == "" ? "0" : _txxl.text.trim().toString();
    data['t_3xl'] =
    _t3xl.text.trim().toString() == "" ? "0" : _t3xl.text.trim().toString();
    data['t_4xl'] =
    _t4xl.text.trim().toString() == "" ? "0" : _t4xl.text.trim().toString();
    data['t_5xl'] =
    _t5xl.text.trim().toString() == "" ? "0" : _t5xl.text.trim().toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider()
            .summeryEditCartProvider(data)
            .then((Response response) async {
          summaryeditcart = summryEditCartProduct.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && summaryeditcart?.status == "success") {

            // Navigator.of(this.context).push(MaterialPageRoute(builder: (context)=>summary(pronamenevigatior: widget.pronamenevigatior,
            //     coloridnevigator:  product2color
            //         ?.data?[
            //     selectbtn]
            //         .colorName ,gender: gen == 0 ? "MEN" : "WOMEN")));
            // // _s.text = "";
            // _ts.text = "";
            // _totalms.text = "";
            //
            // _xs.text = "";
            // _txs.text = "";
            // _totalxs.text = "";
            //
            // _m.text = "";
            // _tm.text = "";
            // _totalmm.text = "";
            //
            // _l.text = "";
            // _tl.text = "";
            // _total_ll.text = "";
            //
            // _xl.text = "";
            // _txl.text = "";
            // _total_xl.text = "";
            //
            // _xxl.text = "";
            // _txxl.text = "";
            // _total_xxl.text = "";
            //
            // _3xl.text = "";
            // _t3xl.text = "";
            // _total_3xl.text = "";
            //
            // _4xl.text = "";
            // _t4xl.text = "";
            // _total_4xl.text = "";
            //
            // _5xl.text = "";
            // _t5xl.text = "";
            // _total_5xl.text = "";
            if (kDebugMode) {}
          } else {
            buildErrorDialog1(this.context, "",  'Already product added to cart');


          }
        });
      } else {



      }
    });
  }

}
