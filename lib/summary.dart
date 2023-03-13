import 'dart:ffi';

import 'package:casadealerapp/block_order.dart';
import 'package:casadealerapp/cart_order.dart';
import 'package:casadealerapp/drawer.dart';
import 'package:casadealerapp/products_1.dart';
import 'package:casadealerapp/summary_b_edit.dart';
import 'package:casadealerapp/your_block_order.dart';
import 'package:casadealerapp/your_order.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class summary extends StatefulWidget {
  const summary({Key? key}) : super(key: key);

  @override
  State<summary> createState() => _summaryState();
}

class _summaryState extends State<summary> {
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffFFFFFF),
      drawer: drawer(context),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 8.h,
              child: Padding(
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
                    SizedBox(
                      width: 14.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 3.h,
                          ),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        IconButton(
                          onPressed: () {
                            // _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 3.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                                SizedBox(height: 1.h),
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
                                          )
                                      ),
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      summary_b_edit()));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 20.5.w,
                                          child: Text(
                                            'Edit',
                                            style:
                                                TextStyle(color: Colors.white,
                                                fontSize: 1.5.h
                                                ),
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
                                        style: TextStyle(  color: Color(0xff848484),)

                                        ),
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '20000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '30000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '12500',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '13000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
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
                                        MainAxisAlignment.spaceAround,
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '20000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '50000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '75000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '10000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
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
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
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
                                  )
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text('Gender'
                                        ,style: TextStyle( color: Color(0xff848484),)
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Women',
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
                                        MainAxisAlignment.spaceAround,
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
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '20000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '30000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '12500',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '13000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
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
                                        MainAxisAlignment.spaceAround,
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 0.1.h,
                                        width: 15.w,
                                        color: Colors.black,
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '20000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '50000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '75000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 3.5.h,
                                        width: 15.w,
                                        child: Text(
                                          '10000',
                                          style: TextStyle(
                                              fontSize: 1.9.h,
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
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
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
                                        EdgeInsets.symmetric(horizontal: 2.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          ' Grand Total :',
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
                                            builder: (context) =>
                                                products_1()));
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
                                        borderRadius: BorderRadius.circular(20),
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
                                            builder: (context) =>
                                                your_block_order()));
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

                                        borderRadius: BorderRadius.circular(20),
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
                                  SizedBox(height: 1.h),
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
                                            )
                                        ),
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        summary_b_edit()));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 3.5.h,
                                            width: 20.5.w,
                                            child: Text(
                                              'Edit',
                                              style:
                                              TextStyle(color: Colors.white,
                                                  fontSize: 1.5.h
                                              ),
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
                                              style: TextStyle(  color: Color(0xff848484),)

                                          ),
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
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 3.h),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
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
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '20000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '30000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '12500',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '13000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
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
                                      MainAxisAlignment.spaceAround,
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
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
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
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '20000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '50000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '75000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '10000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
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
                                                bottomRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
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
                                      )
                                  ),
                                  SizedBox(height: 2.h),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 3.h),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text('Gender'
                                              ,style: TextStyle( color: Color(0xff848484),)
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Women',
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
                                      MainAxisAlignment.spaceAround,
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
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 3.h),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
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
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '20000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '30000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '12500',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '13000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
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
                                      MainAxisAlignment.spaceAround,
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
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 0.1.h,
                                          width: 15.w,
                                          color: Colors.black,
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
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '20000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '50000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '75000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.5.h,
                                          width: 15.w,
                                          child: Text(
                                            '10000',
                                            style: TextStyle(
                                                fontSize: 1.9.h,
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
                                                bottomRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
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
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            ' Grand Total :',
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
                                              builder: (context) =>
                                                  products_1()));
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
                                          borderRadius: BorderRadius.circular(20),
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
                                              builder: (context) =>
                                                  your_order()));
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

                                          borderRadius: BorderRadius.circular(20),
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
                  )
          ],
        ),
      ),
    ));
  }
}
