import 'package:casadealerapp/drawer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class order_id extends StatefulWidget {
  const order_id({Key? key}) : super(key: key);

  @override
  State<order_id> createState() => _order_idState();
}

class _order_idState extends State<order_id> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // bool? check = false;
  // int sum = 0;
  // int sumindex = 0;
  // List<String> tabs = ["Blocked", "Cart"];
  // List<bool> checkbox = [
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false
  // ];
  //
  // int cart = 0;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffFFFFFF),
      drawer: drawer(context),
      key: _scaffoldKey,
      body: Column(
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
                      //
                      SizedBox(
                        width: 2.3.h,
                      ),
                      Container(
                        // padding: EdgeInsets.only(top: 1.5.h),
                        // alignment: Alignment.center,
                        child: Text(
                          "Your Order",
                          style: TextStyle(fontSize: 2.h, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 11.h,
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
// SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.all(2.h),
            child: Container(
              alignment: Alignment.center,
              height: 7.h,
              width: 95.w,
              decoration: BoxDecoration(
                color: Color(0xffeaeaf3),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text('Order ID#1234',
                  style: TextStyle(fontSize: 2.h, color: Color(0xff333389))),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 1.h, left: 1.h),
            child: Column(
              children: [
                Container(
                  height: 69.h,
                  child: ListView.builder(
                    // padding: EdgeInsets.all(0),
                    // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                    // horizontalTitleGap: 0.0,

                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // padding: EdgeInsets.all(0),
                        // alignment: Alignment.center,
                        height: 13.h,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xfffafafa),
                          border: Border.all(color: Color(0xffe8e8e8)),
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
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Street Wear',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 2.3.h),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Color : Red   Size : M',
                                        style:
                                            TextStyle(color: Color(0xff5a5a9f)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '₹125',
                                        style: TextStyle(
                                            color: Color(0xff5a5a9f),
                                            fontSize: 2.2.h,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        'Qty :',
                                        style: TextStyle(
                                            color: Color(0xffb9b9b9),
                                            fontSize: 2.2.h,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 1.h),
                                      Text(
                                        "1000",
                                        style: TextStyle(
                                            color: Color(0xff5a5a9f),
                                            fontSize: 2.2.h,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
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
                Padding(
                  padding: EdgeInsets.only(right: 2.h, left: 2.h),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Color(0xff333389),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     blurRadius: 10.0,
                      //   ),
                      //
                      // ],
                    ),
                    child: Text(
                      'Cancle Request',
                      style: TextStyle(fontSize: 2.h, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )

          //
        ],
      ),
    ));
  }
}
