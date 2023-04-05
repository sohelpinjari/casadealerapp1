import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/modal_class/block_orderView.dart';
import 'package:casadealerapp/modal_class/view_order.dart';
import 'package:casadealerapp/provider/productprovider.dart';
import 'package:casadealerapp/screens/drawer.dart';
import 'package:casadealerapp/screens/order_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

class your_block_order extends StatefulWidget {
  const your_block_order({Key? key}) : super(key: key);

  @override
  State<your_block_order> createState() => _your_block_orderState();
}

class _your_block_orderState extends State<your_block_order> {
  viewBlockOrder? blockview2;
  view_orders? view;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blockViewOrderapi();
  }

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
                                "Your blocked Orders",
                                style: TextStyle(
                                    fontSize: 2.h, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 4.h,
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
                ],
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => order_detail_c()));
                  },
                  child: Container(
                    height: 88.h,
                    child: ListView.builder(
                      // padding: EdgeInsets.all(0),
                      // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                      // horizontalTitleGap: 0.0,

                      itemCount: blockview2?.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // padding: EdgeInsets.all(0),
                          // alignment: Alignment.center,
                          height: 11.h,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color(0xfffafafa),
                            border: Border.all(color: Color(0xffe8e8e8)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child:
                                    CachedNetworkImage(
                                        height: 11.h,
                                        width: 20.w,
                                        fit: BoxFit.cover,
                                        imageUrl:blockview2
                                            ?.data?[index]
                                            .imageOne ??
                                            "",
                                        progressIndicatorBuilder: (context,
                                            url, downloadProgress) =>
                                            CircularProgressIndicator(
                                                value: downloadProgress
                                                    .progress),
                                        errorWidget: (context, url, error) =>
                                            Image.asset( "assets/default_product_image.png",
                                                height: 11.h,
                                                  width: 20.w,
                                                  fit: BoxFit.cover,

                                            )
                                    ),



                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Order ID # ' + (blockview2?.data?[index]?.id ?? "N/A"),
                                              // +  (view?.data?[index].productNumberOrder).toString() ?? "" ,

                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 2.h),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(height: 1.5.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'No of Products : ',
                                              style: TextStyle(
                                                color: Color(0xff5a5858585),
                                              ),
                                            ),
                                            Text(
                                              // (view?.data?[index].productNumberOrder).toString() ?? "" ,

                                               // (blockview2?.data?[index]?.productNumberOrder ?? ""),
                                              '550',
                                              style: TextStyle(
                                                color: Color(0xff5a5a9f),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.4.h,
                                          width: 18.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color:
                                                  (view?.data?[index].status ==
                                                          "1")
                                                      ? Color(0xfffaede7)
                                                      : (view?.data?[index]
                                                                  .status ==
                                                              "2")
                                                          ? Color(0xffe1f5e2)
                                                          : Color(0xfffae7e7)),
                                          child: Text(
                                            (blockview2?.data?[index].status == "1")
                                                ? "Placed"
                                                : (blockview2?.data?[index].status ==
                                                        "2")
                                                    ? "Confirmed"
                                                    : "Cancle",
                                            // 'Placed',
                                            style: TextStyle(
                                                color: (blockview2?.data?[index]
                                                            .status ==
                                                        "1")
                                                    ? Color(0xfff98b54)
                                                    : (blockview2?.data?[index]
                                                                .status ==
                                                            "2")
                                                        ? Color(0xff48d34d)
                                                        : Color(0xfff97070),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 1.3.w),
                              Row(
                                children: [
                                  Text(
                                    '₹' + (blockview2?.data?[index].price).toString() ?? "" ,
                                    // '₹5,925',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 2.2.h,
                                        color: Color(0xff3b3b8d)),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 3.9.w),
                                      decoration: BoxDecoration(
                                        color: Color(0xffe2e2ed),

                                        // border: Border.all(
                                        //   // color:  Color(0xff5a5a9f),
                                        // ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 5.h,
                                      width: 10.w,
                                      child: PopupMenuButton(
                                        onSelected: (value) {
                                          // your logic
                                        },
                                        itemBuilder: (BuildContext bc) {
                                          return [
                                            PopupMenuItem(
                                              // padding: EdgeInsets.only(left: 50.w),

                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              order_detail_c()));
                                                },
                                                child: Text("Edit",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff333389))),
                                              ),
                                              value: '/hello',
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            order_detail_c()
                                                    )
                                                );
                                              },
                                              child: Text("Convert to order",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)
                                              ),
                                              value: '/about',
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            order_detail_c()
                                                    )
                                                );
                                              },
                                              child: Text("Unblock order",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              value: '/contact',
                                            )
                                          ];
                                        },
                                      )
                                      // Icon(
                                      //   Icons.more_vert,
                                      //   color: Color(0xff5a5a9f),
                                      // ),
                                      ),
                                ],
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
    );
  }

  blockViewOrderapi() async {
    final Map<String, String> data = {};
    data['action'] = "view_order_block";
    data['d_id'] = "36";

        // (userData?.logindata?.dId).toString();




    print(data);



      checkInternet().then((internet) async {
        if (internet) {
          Productprovider().blockViewProvider(data).then((Response response) async {
            print(response.body);

            blockview2 = viewBlockOrder.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && blockview2?.status == "success") {

              print("===================" + (blockview2?.status).toString());

              setState(() {

                // viewProapi();
              });
              // SaveDataLocal.saveLogInData(userData!);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => order_detail_c()));
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
