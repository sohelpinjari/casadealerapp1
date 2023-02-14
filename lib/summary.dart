import 'dart:ffi';

import 'package:casadealerapp/drawer.dart';
import 'package:casadealerapp/your_order.dart';

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
                            style: TextStyle(fontSize: 2.h, color: Colors.white),
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
                              width: 40.w,
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
                        height: 68.h,
                        child: ListView.builder(
                          // padding: EdgeInsets.all(0),
                          // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                          // horizontalTitleGap: 0.0,

                          itemCount: checkbox.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // padding: EdgeInsets.all(0),
                              // alignment: Alignment.center,
                              height: 15.h,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Color(0xfffafafa),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'assets/product_1_img2.png',
                                      height: 15.h,
                                      width: 25.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.45,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Street Wear',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 2.3.h),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    '₹125',
                                                    style: TextStyle(
                                                        color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 1.5.h),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Color : Red   Size : M',
                                                    style: TextStyle(
                                                        color: Color(0xff5a5a9f)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2.h),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Qty :',
                                                    style: TextStyle(
                                                        color: Color(0xffb9b9b9)),
                                                  ),
                                                  SizedBox(width: 2.h),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 4.h,
                                                    width: 25.w,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color(0xff5a5a9f),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(8),
                                                    ),
                                                    child: Text(
                                                      "1000",
                                                      style: TextStyle(
                                                          color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 1.3.w),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(0.2.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 5.h,
                                          width: 18.w,
                                          child: Checkbox(
                                            // checkColor: Color(0xff333389),
                                            activeColor: Color(0xff333389),

                                            value: checkbox[index],
                                            onChanged: (value) {
                                              setState(() {
                                                checkbox[index] = value!;
                                              });

                                              // Handle checkbox value change
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        Container(
                                          margin: EdgeInsets.only(left: 3.9.w),
                                          decoration: BoxDecoration(
                                            color: Color(0xffe2e2ed),

                                            // border: Border.all(
                                            //   // color:  Color(0xff5a5a9f),
                                            // ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: 5.h,
                                          width: 10.w,
                                          child: Icon(
                                            Icons.more_vert,
                                            color: Color(0xff5a5a9f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 8.3.h,
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cart = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 5.5.h,
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
                                            builder: (context) => your_order()));
                                    setState(() {
                                      cart = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 5.5.h,
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
                          height: 68.h,
                          child: ListView.builder(
                            // padding: EdgeInsets.all(0),
                            // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                            // horizontalTitleGap: 0.0,

                            itemCount: checkbox.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                // padding: EdgeInsets.all(0),
                                // alignment: Alignment.center,
                                height: 15.h,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xfffafafa),
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/product_1_img2.png',
                                        height: 15.h,
                                        width: 25.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.45,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(1.h),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Street Wear',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 2.3.h),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      '₹125',
                                                      style: TextStyle(
                                                          color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 1.5.h),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Color : Red   Size : M',
                                                      style: TextStyle(
                                                          color: Color(0xff5a5a9f)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 2.h),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Qty :',
                                                      style: TextStyle(
                                                          color: Color(0xffb9b9b9)),
                                                    ),
                                                    SizedBox(width: 2.h),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      height: 4.h,
                                                      width: 25.w,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Color(0xff5a5a9f),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      child: Text(
                                                        "1000",
                                                        style: TextStyle(
                                                            color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 1.3.w),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(0.2.h),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 18.w,
                                            child: Checkbox(
                                              // checkColor: Color(0xff333389),
                                              activeColor: Color(0xff333389),

                                              value: checkbox[index],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox[index] = value!;
                                                });

                                                // Handle checkbox value change
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 3.h),
                                          Container(
                                            margin: EdgeInsets.only(left: 3.9.w),
                                            decoration: BoxDecoration(
                                              color: Color(0xffe2e2ed),

                                              // border: Border.all(
                                              //   // color:  Color(0xff5a5a9f),
                                              // ),
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            height: 5.h,
                                            width: 10.w,
                                            child: Icon(
                                              Icons.more_vert,
                                              color: Color(0xff5a5a9f),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 8.3.h,
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cart = 1;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(0.1.h),
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 5.5.h,
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
                                      setState(() {
                                        cart = 0;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(0.1.h),
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 5.5.h,
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
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}
