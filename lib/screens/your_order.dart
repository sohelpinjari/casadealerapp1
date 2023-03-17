import 'package:casadealerapp/screens/drawer.dart';
import 'package:casadealerapp/screens/order_id.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class your_order extends StatefulWidget {
  const your_order({Key? key}) : super(key: key);

  @override
  State<your_order> createState() => _your_orderState();
}

class _your_orderState extends State<your_order> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  //
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
                            "Your Orders",
                            style:
                                TextStyle(fontSize: 2.h, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: 11.h,
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
              decoration: BoxDecoration(
                color: Color(0xfff333389),
                // borderRadius: BorderRadius.all(
                //   Radius.circular(10),
                // ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 88.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => order_id()));
                    },
                    child: ListView.builder(
                      // padding: EdgeInsets.all(0),
                      // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                      // horizontalTitleGap: 0.0,

                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // padding: EdgeInsets.all(0),
                          // alignment: Alignment.center,
                          height: 10.h,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color(0xfffafafa),
                            border: Border.all(color: Color(0xffe8e8e8)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/product_1_img2.png',
                                  height: 10.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // SizedBox(width: 5.w,),

                              Padding(
                                padding: EdgeInsets.all(1.5.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Order ID #1234',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 2.2.h),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.5.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'No of Products :',
                                          style: TextStyle(
                                              color: Color(0xff5a5858585),
                                              fontSize: 1.7.h),
                                        ),
                                        Text(
                                          '550',
                                          style: TextStyle(
                                              color: Color(0xff5a5a9f),
                                              fontSize: 1.7.h),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 1.3.w),

                              SizedBox(width: 9.w),
                              Text(
                                '₹5,925',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.2.h,
                                    color: Color(0xff3b3b8d)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width ,
                //   height: 8.3.h,
                //
                //   child: Padding(
                //     padding: EdgeInsets.all(2.h),
                //     child: Container(
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 cart = 1;
                //               });
                //             },
                //             child: Container(
                //               padding: EdgeInsets.all(0.1.h),
                //               alignment: Alignment.center,
                //               width: 40.w,
                //               height: 5.5.h,
                //               decoration: BoxDecoration(
                //                   color: (cart == 0)
                //                       ? Colors.white
                //                       : Color(0xfff333389),
                //                   borderRadius: BorderRadius.circular(20),
                //                   border: Border.all(color: Colors.white)),
                //               child: Text(
                //                 'Exit',
                //                 style: TextStyle(
                //                     color: (cart == 0)
                //                         ? Color(0xff333389)
                //                         : Colors.white ,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 2.2.h),
                //               ),
                //             ),
                //           ),
                //           SizedBox(
                //             width: 2.w,
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 cart = 0;
                //               });
                //             },
                //             child: Container(
                //               padding: EdgeInsets.all(0.1.h),
                //               alignment: Alignment.center,
                //               width: 40.w,
                //               height: 5.5.h,
                //               decoration: BoxDecoration(
                //                   color: (cart == 1)
                //                       ? Colors.white
                //                       : Color(0xfff333389),
                //                   // color:_selectedColor,
                //
                //                   borderRadius: BorderRadius.circular(20),
                //                   border: Border.all(color: Colors.white)),
                //               child: Text(
                //                 'Confirm',
                //                 style: TextStyle(
                //                     color: (cart == 1)
                //                         ? Color(0xff333389)
                //                         : Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 2.2.h),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                //
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     // borderRadius: BorderRadius.all(
                //     //   Radius.circular(10),
                //     // ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
