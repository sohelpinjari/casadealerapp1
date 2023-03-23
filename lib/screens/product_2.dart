import 'dart:convert';

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/modal_class/block_product_modal.dart';
import 'package:casadealerapp/modal_class/category_wise_display.dart';
import 'package:casadealerapp/modal_class/color_display_all_class.dart';
import 'package:casadealerapp/modal_class/color_modal.dart';
import 'package:casadealerapp/modal_class/product2_image_modal.dart';
import 'package:casadealerapp/modal_class/select_image_class.dart';
import 'package:casadealerapp/provider/login_authprovider.dart';
import 'package:casadealerapp/modal_class/productapiclass.dart';
import 'package:casadealerapp/provider/productprovider.dart';
import 'package:casadealerapp/shared_preference.dart';
import 'package:casadealerapp/modal_class/singlepro_class.dart';
import 'package:casadealerapp/screens/summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'drawer.dart';
// import 'package:path/path.dart' as path;
// import 'package:http/http.dart' as http;

class product_2 extends StatefulWidget {
  String? imagenevigator;
  String? pronamenevigatior;
  String? coloridnevigator;

  product_2(
      {Key? key,
      this.imagenevigator,
      this.pronamenevigatior,
      this.coloridnevigator})
      : super(key: key);

  @override
  State<product_2> createState() => _product_2State();
}

class products {
  String? image;
  String? Brand_Name;
  String? Street_Wear;
  String? Artist_Name;
  String? Price;

  products(this.image, this.Brand_Name, this.Street_Wear, this.Artist_Name,
      this.Price);
}

class _product_2State extends State<product_2> {
  TextEditingController _search = TextEditingController();

  TextEditingController _m = TextEditingController();
  TextEditingController _s = TextEditingController();
  TextEditingController _l = TextEditingController();
  TextEditingController _xl = TextEditingController();
  TextEditingController _xxl = TextEditingController();
  TextEditingController _3xl = TextEditingController();
  TextEditingController _4xl = TextEditingController();
  TextEditingController _5xl = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  color? colorData;
  bool _customTileExpanded = false;

  int selectindex = 0;
  int btn = 0;
  int gen = 0;
  int cart = 0;
  int sumindex = 0;
  int selectbtn = 0;
  int selectgender = 0;
  int def = 0;
  int? totals = 0;
  int? totalm = 0;
  int? totall = 0;
  int? totalxl = 0;
  int? total2xl = 0;
  int? total3xl = 0;
  int? total4xl = 0;
  int? total5xl = 0;

  final PageController controller = PageController(initialPage: 0);
  List<products> images = [
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
  ];

  List<String> tabs = ["Tripur", "Munbai"];

  List<Color> tripur = [
    Color(0xff57492e),
    Color(0xffb7e5f1),
    Color(0xffb9bdbe),
    Color(0xffd3c9b5),
    Color(0xffbcaae6),
    Color(0xff00b9e9),
    Color(0xff005f77),
    Color(0xff775d29),
    Color(0xff333532),
    Color(0xff9e0303),
    Color(0xff4d0de2),
    Color(0xff18772e),
    Color(0xffe121b4),
    Color(0xffd7ff00),
    Color(0xff00f2ea),
    Color(0xfff62e78),
    Color(0xff89ff4e),
    Color(0xff610047),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
  ];
  List<String> image = [];
  productapi? productData;
  bool se_icon = false;
  categorywisedisplay? allcatogaryproperty;
  colorClass? product2color;
  product2Imageclass? imageDisplay;
  selectColorImageClass? selectimage;

  colorDisplayClass? displayallcolor;
  blockProductClass? block;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

    // clrnameapi();

    // tripur= [
    // widget.coloridnevigator.()
    //
    // ];
    // image = [
    //   imageDisplay?.imageData.toString(),
    //   widget.imagenevigator.toString(),
    //   widget.imagenevigator.toString(),
    // ];
  }

  getdata() async {
    await imageapi();
    await colorapi();
    await selectimageapi();
    await displaycolor();
    await blockapi();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffFFFFFF),

        drawer: drawer(context),
        key: _scaffoldKey,
        // appBar: AppBar(
        //   toolbarHeight: 15.h, // Set this height
        //
        //   title: Text("Products"),
        //   backgroundColor: Color(0xfff333389),
        //
        // ),
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
                        SizedBox(
                          width: 2.3.h,
                        ),
                        Container(
                          // padding: EdgeInsets.only(top: 1.5.h),
                          // alignment: Alignment.center,
                          child: Text(
                            "Products",
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
                            setState(() {
                              se_icon = !se_icon;
                            });
                            // _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 3.5.h,
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
            SizedBox(
              height: 2.h,
            ),
            (!se_icon)
                ? Container()
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.h),
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "";
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        print(value);
                        if (value.isNotEmpty) {
                          // searchapi(value);
                        } else if (value.isEmpty) {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => products_1()));
                        } else {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RestaurantsScreen()));
                        }
                      },
                      controller: _search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(3.h),
                        hintText: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0xfff333389),
                          size: 3.h,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      color: Color(0xfff3faff),
                      // image: DecorationImage(
                      //     image: AssetImage("assets/product_1_img.png"),
                      //     fit: BoxFit.fitWidth)
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                        // ),
                      ),
                    ),
                  ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 55.h,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.red,
                        ),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              // color: Colors.green,
                            ),
                            height: 55.h,
                            width: MediaQuery.of(context).size.width,
                            child:
                            // displayallcolor?.mumbaiStock?[0].menImageArray != null?
                            // CarouselSlider(
                            //   items: (displayallcolor?.mumbaiStock?[0].menImageArray ?? []).map((e) {
                            //     return ClipRRect(
                            //         borderRadius: BorderRadius.circular(28),
                            //         child: Stack(
                            //           children: [
                            //             Container(
                            //               decoration: BoxDecoration(
                            //                 borderRadius:
                            //                     BorderRadius.circular(28),
                            //               ),
                            //               height: 54.h,
                            //               width:
                            //                   MediaQuery.of(context).size.width,
                            //               margin: EdgeInsets.symmetric(
                            //                   horizontal: 5.w),
                            //               child: ClipRRect(
                            //                 borderRadius:
                            //                     BorderRadius.circular(28),
                            //                 child: Image.network(
                            //                   e,
                            //
                            //                   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            //                     return Image.asset("assets/product_1_img.png",
                            //                       // width: MediaQuery.of(context)
                            //                       //     .size
                            //                       //     .width *
                            //                       //     0.6,
                            //                       // height: MediaQuery.of(context)
                            //                       //     .size
                            //                       //     .height *
                            //                       //     0.3,
                            //                       // fit: BoxFit.cover,
                            //                     );
                            //                   },
                            //                   fit: BoxFit.cover,
                            //                   height: 53.h,
                            //                   // width: MediaQuery.of(context)
                            //                   //     .size
                            //                   //     .width,
                            //                 ),
                            //               ),
                            //             ),
                            //             Opacity(
                            //               opacity: 0.8,
                            //               child: Padding(
                            //                 padding: EdgeInsets.symmetric(
                            //                     horizontal: 5.w),
                            //                 child: Align(
                            //                   alignment: Alignment.bottomCenter,
                            //                   child: Container(
                            //                     decoration: BoxDecoration(
                            //                       gradient: LinearGradient(
                            //                           begin: Alignment.topRight,
                            //                           colors: [
                            //                             Colors.transparent,
                            //                             Colors.black
                            //                           ]),
                            //                       borderRadius:
                            //                           BorderRadius.only(
                            //                         bottomRight:
                            //                             Radius.circular(28),
                            //                         bottomLeft:
                            //                             Radius.circular(28),
                            //                         topRight:
                            //                             Radius.circular(28),
                            //                         topLeft:
                            //                             Radius.circular(28),
                            //                       ),
                            //                     ),
                            //                     height: 23.h,
                            //                     width: MediaQuery.of(context)
                            //                         .size
                            //                         .width,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Positioned(
                            //               top: 30.h,
                            //               left: 8.w,
                            //               right: 8.w,
                            //               child: Container(
                            //                 // height: 10.h,
                            //                 width: MediaQuery.of(context)
                            //                     .size
                            //                     .width,
                            //                 // color:Colors.red,
                            //                 child: Column(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       width: MediaQuery.of(context)
                            //                           .size
                            //                           .width,
                            //                       child: Row(
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment
                            //                                 .spaceBetween,
                            //                         children: [
                            //                           Column(
                            //                             crossAxisAlignment:
                            //                                 CrossAxisAlignment
                            //                                     .start,
                            //                             children: [
                            //                               Container(
                            //                                 alignment: Alignment
                            //                                     .center,
                            //                                 width: MediaQuery.of(
                            //                                             context)
                            //                                         .size
                            //                                         .width *
                            //                                     0.2,
                            //                                 height: MediaQuery.of(
                            //                                             context)
                            //                                         .size
                            //                                         .height *
                            //                                     0.03,
                            //                                 decoration:
                            //                                     BoxDecoration(
                            //                                   color: Color(
                            //                                       0xfff7c7773),
                            //                                   borderRadius:
                            //                                       BorderRadius
                            //                                           .all(
                            //                                     Radius.circular(
                            //                                         8),
                            //                                   ),
                            //                                 ),
                            //                                 child: Padding(
                            //                                   padding:
                            //                                       EdgeInsets
                            //                                           .all(0.5
                            //                                               .h),
                            //                                   child: Text(
                            //                                     "Brand Name",
                            //                                     style:
                            //                                         TextStyle(
                            //                                       fontSize:
                            //                                           1.3.h,
                            //                                       color: Colors
                            //                                           .white,
                            //                                     ),
                            //                                   ),
                            //                                 ),
                            //                               ),
                            //                               SizedBox(
                            //                                 height: 1.h,
                            //                               ),
                            //                               Container(
                            //                                 child: Text(
                            //                                   imageDisplay
                            //                                           ?.productData?[
                            //                                               0]
                            //                                           .apName ??
                            //                                       '',
                            //                                   // widget
                            //                                   //     .pronamenevigatior
                            //                                   //     .toString(),
                            //                                   // widget
                            //                                   //     .pronamenevigatior
                            //                                   //     .toString(),
                            //                                   style: TextStyle(
                            //                                       fontSize: 3.h,
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .bold,
                            //                                       color: Colors
                            //                                           .white),
                            //                                 ),
                            //                               ),
                            //                               Container(
                            //                                 child: Text(
                            //                                   "Artist Name",
                            //                                   style: TextStyle(
                            //                                       fontSize:
                            //                                           1.9.h,
                            //                                       // fontWeight:
                            //                                       //     FontWeight
                            //                                       //         .bold,
                            //                                       color: Colors
                            //                                           .grey
                            //                                           .shade300),
                            //                                 ),
                            //                               ),
                            //                             ],
                            //                           ),
                            //
                            //                           // SizedBox(
                            //                           //   width: 20.w,
                            //                           // ),
                            //
                            //                           Row(
                            //                             children: [
                            //                               // Container(
                            //                               //   alignment:
                            //                               //       Alignment.center,
                            //                               //   height: 4.h,
                            //                               //   width: 9.w,
                            //                               //   decoration: BoxDecoration(
                            //                               //       borderRadius:
                            //                               //           BorderRadius
                            //                               //               .circular(
                            //                               //                   25),
                            //                               //       color:
                            //                               //           Colors.white),
                            //                               //   child: IconButton(
                            //                               //     icon: Icon(
                            //                               //       Icons
                            //                               //           .favorite_border,
                            //                               //       color: Colors.red,
                            //                               //       size: 2.h,
                            //                               //     ),
                            //                               //     onPressed: () {},
                            //                               //   ),
                            //                               // ),
                            //                               SizedBox(width: 3.w),
                            //                               Container(
                            //                                 alignment: Alignment
                            //                                     .center,
                            //                                 height: 4.h,
                            //                                 width: 9.w,
                            //                                 decoration: BoxDecoration(
                            //                                     borderRadius:
                            //                                         BorderRadius
                            //                                             .circular(
                            //                                                 25),
                            //                                     color: Colors
                            //                                         .white),
                            //                                 child: IconButton(
                            //                                   icon: Icon(
                            //                                     Icons.share,
                            //                                     color:
                            //                                         Colors.grey,
                            //                                     size: 2.h,
                            //                                   ),
                            //                                   onPressed: () {},
                            //                                 ),
                            //                               ),
                            //                             ],
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                     // SizedBox()
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ));
                            //   }).toList(),
                            //   options: CarouselOptions(
                            //     height: 45.h,
                            //     enlargeCenterPage: false,
                            //     autoPlay: true,
                            //     aspectRatio: 16 / 9,
                            //     autoPlayCurve: Curves.fastOutSlowIn,
                            //     enableInfiniteScroll: true,
                            //     autoPlayAnimationDuration:
                            //         Duration(milliseconds: 800),
                            //     viewportFraction: 1,
                            //   ),
                            // ):displayallcolor?.tripurStock?[0].menImageArray != null?
                            CarouselSlider(
                              items: (displayallcolor?.mumbaiStock?[0].menImageArray ?? []).map((e) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(28),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(28),
                                          ),
                                          height: 54.h,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(28),
                                            child: Image.network(
                                              e,

                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return Image.asset("assets/product_1_img.png",
                                                  // width: MediaQuery.of(context)
                                                  //     .size
                                                  //     .width *
                                                  //     0.6,
                                                  // height: MediaQuery.of(context)
                                                  //     .size
                                                  //     .height *
                                                  //     0.3,
                                                  // fit: BoxFit.cover,
                                                );
                                              },
                                              fit: BoxFit.cover,
                                              height: 53.h,
                                              // width: MediaQuery.of(context)
                                              //     .size
                                              //     .width,
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.8,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topRight,
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.black
                                                      ]),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomRight:
                                                    Radius.circular(28),
                                                    bottomLeft:
                                                    Radius.circular(28),
                                                    topRight:
                                                    Radius.circular(28),
                                                    topLeft:
                                                    Radius.circular(28),
                                                  ),
                                                ),
                                                height: 23.h,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 30.h,
                                          left: 8.w,
                                          right: 8.w,
                                          child: Container(
                                            // height: 10.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // color:Colors.red,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .width *
                                                                0.2,
                                                            height: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .height *
                                                                0.03,
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Color(
                                                                  0xfff7c7773),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                                Radius.circular(
                                                                    8),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets
                                                                  .all(0.5
                                                                  .h),
                                                              child: Text(
                                                                "Brand Name",
                                                                style:
                                                                TextStyle(
                                                                  fontSize:
                                                                  1.3.h,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              imageDisplay
                                                                  ?.productData?[
                                                              0]
                                                                  .apName ??
                                                                  '',
                                                              // widget
                                                              //     .pronamenevigatior
                                                              //     .toString(),
                                                              // widget
                                                              //     .pronamenevigatior
                                                              //     .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 3.h,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Artist Name",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  1.9.h,
                                                                  // fontWeight:
                                                                  //     FontWeight
                                                                  //         .bold,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      // SizedBox(
                                                      //   width: 20.w,
                                                      // ),

                                                      Row(
                                                        children: [
                                                          // Container(
                                                          //   alignment:
                                                          //       Alignment.center,
                                                          //   height: 4.h,
                                                          //   width: 9.w,
                                                          //   decoration: BoxDecoration(
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   25),
                                                          //       color:
                                                          //           Colors.white),
                                                          //   child: IconButton(
                                                          //     icon: Icon(
                                                          //       Icons
                                                          //           .favorite_border,
                                                          //       color: Colors.red,
                                                          //       size: 2.h,
                                                          //     ),
                                                          //     onPressed: () {},
                                                          //   ),
                                                          // ),
                                                          SizedBox(width: 3.w),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 4.h,
                                                            width: 9.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    25),
                                                                color: Colors
                                                                    .white),
                                                            child: IconButton(
                                                              icon: Icon(
                                                                Icons.share,
                                                                color:
                                                                Colors.grey,
                                                                size: 2.h,
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                              }).toList(),
                              options: CarouselOptions(
                                height: 45.h,
                                enlargeCenterPage: false,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                                viewportFraction: 1,
                              ),
                            )
                                  // :Image.asset("assets/product_1_img.png")
                          ),
                        ),
                        Positioned(
                          top: 48.5.h,
                          left: 41.w,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.025,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade200,),
                              color: Color(0xff333389),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: SmoothPageIndicator(
                              controller: controller,
                              // count: (imageDisplay?.imageData ?? []).length,
                              count: 3,
                              axisDirection: Axis.horizontal,
                              effect: SlideEffect(
                                  spacing: 8.0,
                                  radius: 15.0,
                                  dotWidth: 7.0,
                                  dotHeight: 8.0,
                                  paintStyle: PaintingStyle.fill,
                                  strokeWidth: 1.5,
                                  dotColor: Colors.grey.shade300,
                                  activeDotColor: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(25),
                      //       border: Border.all(color: Color(0xfff9e9ec7))),
                      //   alignment: Alignment.center,
                      //   height: 6.h,
                      //   width: MediaQuery.of(context).size.width,
                      //   padding: EdgeInsets.symmetric(horizontal: 1.w),
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       physics: BouncingScrollPhysics(),
                      //       shrinkWrap: true,
                      //       itemCount: tabs.length,
                      //       itemBuilder: (context, index) {
                      //         return GestureDetector(
                      //           onTap: () {
                      //             setState(() {
                      //               selectindex = index;
                      //             });
                      //           },
                      //           child: Column(
                      //             // crossAxisAlignment: CrossAxisAlignment.center,
                      //             // mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Container(
                      //                 alignment: Alignment.center,
                      //
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(20),
                      //                   color: (selectindex == index)
                      //                       ? Color(0xfff333389)
                      //                       : Color(0xfffFFFFFF),
                      //                 ),
                      //
                      //                 height: 4.6.h,
                      //                 width: 44.w,
                      //                 margin: EdgeInsets.only(
                      //                     right: 0.1.w, top: 0.6.h),
                      //
                      //                 // padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
                      //                 child: Text(
                      //                   tabs[index],
                      //                   style: TextStyle(
                      //                     fontFamily: "Poppins",
                      //                     fontWeight: FontWeight.bold,
                      //                     color: (selectindex != index)
                      //                         ? Colors.grey.shade600
                      //                         : Color(0xffffffff),
                      //                   ),
                      //                 ),
                      //               ),
                      //               // (selectindex != index)
                      //               //     ? Container()
                      //               //     : Center(
                      //               //         child: Container(
                      //               //             height: 7.0,
                      //               //             width: 7.0,
                      //               //             decoration: BoxDecoration(
                      //               //                 shape: BoxShape.circle,
                      //               //                 color: Color(0xffb4776e6)
                      //               //             )
                      //               //         ),
                      //               //       ),
                      //             ],
                      //           ),
                      //         );
                      //       }),
                      // ),
                    ),
                    (selectindex == 0)
                        ? Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top: 1.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select Color",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 2.4.h,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 4.5.h,
                                                width: 9.w,
                                                child: CircleAvatar(
                                                  // radius: 7.w,
                                                  child: ClipOval(
                                                    child: Image.network(
                                                      product2color
                                                              ?.data?[selectbtn]
                                                              .colorImage ??
                                                          '',

                                                      // 'assets/Red_Color.jpg',
                                                      width: 12.w,
                                                      height: 13.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    // child: Image.network(
                                                    //   (viewmodel?.data?.profileImg).toString(),
                                                    //   fit: BoxFit.cover,
                                                    //   width: 16.w,
                                                    //   height: 16.w,
                                                    // ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xffbababa))),
                                              ),
                                              SizedBox(width: 4.w),
                                              Container(
                                                width: 40.w,
                                                child: Text(
                                                    product2color
                                                            ?.data?[selectbtn]
                                                            .colorName ??
                                                        '',
                                                    maxLines: 2,
                                                    // 'Red',
                                                    style: TextStyle(
                                                      fontSize: 2.5.h,
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 2.h, right: 2.h),
                                  child: Divider(color: Colors.grey.shade400),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Container(
                                      height: 18.18.h,
                                      width: 90.w,
                                      padding: EdgeInsets.all(9.0),
                                      child: GridView.builder(
                                        itemCount: product2color?.data?.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 7,
                                                crossAxisSpacing: 12.0,
                                                childAspectRatio: 3 / 3,
                                                mainAxisSpacing: 6.0),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                              onTap: () {
                                                print("object");
                                                setState(() {
                                                  widget.coloridnevigator
                                                      .toString();
                                                  colorapi();
                                                  btn = index;
                                                  selectbtn = index;


                                                });

                                                selectimageapi();
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 10.h,
                                                    width: 20.w,
                                                    child: CircleAvatar(
                                                      // radius: 7.w,
                                                      child: ClipOval(
                                                        child: Image.network(
                                                          product2color
                                                                  ?.data?[index]
                                                                  .colorImage ??
                                                              "",

                                                          // 'assets/Red_Color.jpg',
                                                          width: 10.w,
                                                          height: 13.w,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        // child: Image.network(
                                                        //   (viewmodel?.data?.profileImg).toString(),
                                                        //   fit: BoxFit.cover,
                                                        //   width: 16.w,
                                                        //   height: 16.w,
                                                        // ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: tripur[index],
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffbababa))),
                                                  ),
                                                  (btn == index)
                                                      ? Container(
                                                          height: 10.h,
                                                          width: 20.w,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .transparent),
                                                          child: Icon(
                                                            Icons.check,
                                                            color: Colors.white,
                                                            size: 15.sp,
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              ));
                                        },
                                      )),
                                ),

                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Select Gender",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.4.h,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Divider(color: Colors.grey.shade400),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              gen = 0;



                                            }

                                            );
                                            displaycolor();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(0.1.h),
                                            alignment: Alignment.center,
                                            width: 10.h,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                                color: (gen == 1)
                                                    ? Colors.white
                                                    : Color(0xfff333389),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color(0xff333389))),
                                            child: Text(
                                              'Men',
                                              style: TextStyle(
                                                  color: (gen == 1)
                                                      ? Color(0xff333389)
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 2.h),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.6.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              gen = 1;
                                              displaycolor();

                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(0.1.h),
                                            alignment: Alignment.center,
                                            width: 14.h,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                                color: (gen == 0)
                                                    ? Colors.white
                                                    : Color(0xfff333389),
                                                // color:_selectedColor,

                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color(0xff333389))),
                                            child: Text(
                                              'Women',
                                              style: TextStyle(
                                                  color: (gen == 0)
                                                      ? Color(0xff333389)
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 2.h),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Container(
                                    alignment: Alignment.center,
                                    height: 10.h,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color(0xfffeaeaf3),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.h),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 2.h),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 30.w,
                                                child: Text(
                                                  "Color :",
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 30.w,
                                                child: Text(
                                                  "S - XL :",
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   width: 6.h,
                                              // ),

                                              Container(
                                                width: 30.w,
                                                child: Text(
                                                  " 2XL - 3XL :",
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 30.w,
                                                child: Text(
                                                  // "Red",
                                                      product2color
                                                        ?.data?[selectbtn]
                                                        .colorName ?? '',
                                                  style: TextStyle(
                                                      fontSize: 2.h,

                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xfff333389)),
                                                    maxLines: 2,
                                                ),
                                              ),
                                              Container(
                                                width: 30.w,
                                                child:    displayallcolor?.priceArray?[0].minPrice == 0||  displayallcolor?.priceArray?[0].minPrice ==  null
                                                    ? Text(
                                                  "N/A",
                                                  style: TextStyle(
                                                      fontSize: 2.6.h,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Color(0xfff333389)),

                                                )
                                                    :Text(
                                                  '₹' +( displayallcolor?.priceArray?[0].minPrice).toString(),
                                                  // "₹125",
                                                  style: TextStyle(
                                                      fontSize: 2.6.h,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xfff333389)),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   width: 6.h,
                                              // ),

                                              Container(
                                                width: 30.w,
                                                child:  displayallcolor?.priceArray?[0].minPrice == 0||  displayallcolor?.priceArray?[0].minPrice ==  null
                                                    ? Text(
                                                  "N/A",
                                                  style: TextStyle(
                                                      fontSize: 2.6.h,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Color(0xfff333389)),

                                                )
                                                    :Text(
                                                  '₹' + (displayallcolor?.priceArray?[0].maxPrice).toString(),
                                                  // " ₹150",
                                                  style: TextStyle(
                                                      fontSize: 2.6.h,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xfff333389)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 3.5.h,
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 7.w, left: 3.w, bottom: 2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Size",
                                          style: TextStyle(fontSize: 2.h),
                                        ),
                                        // SizedBox(width: 1.8.h),
                                        Text("Mumbai",
                                            style: TextStyle(fontSize: 2.h)),
                                        // SizedBox(width: 1.8.h),
                                        Text("Tirpur",
                                            style: TextStyle(fontSize: 2.h)),
                                        // SizedBox(width: 1.8.h),
                                        Text("Total",
                                            style: TextStyle(fontSize: 2.h)),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.all(8.0),
                                //   child:
                                //       Divider(color: Colors.grey.shade400),
                                // ),

                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "S ",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              displayallcolor?.mumbaiStock?[0].s ?? ''
                                              ,
                                               // '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller:  _s,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,

                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // contentPadding: EdgeInsets.only(top: 0.1.w),

                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              displayallcolor?.tripurStock?[0].s ?? ''  ,
                                              // '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',

                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              totals.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "M ",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              displayallcolor?.mumbaiStock?[0].m ?? ''  ,
                                              // '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  controller: _m,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].m ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                totalm.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "L ",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.mumbaiStock?[0].l ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller: _l,

                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].l ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              totall.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "XL",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.mumbaiStock?[0].xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller: _xl,

                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                totalxl.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "2XL",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.mumbaiStock?[0].xxl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller: _xxl,

                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].xxl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                total2xl.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "3XL",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.mumbaiStock?[0].s3xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller: _3xl,

                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].s3xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                total3xl.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "4XL",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.mumbaiStock?[0].s4xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller: _4xl,

                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].s4xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                total4xl.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "5XL",
                                          style: TextStyle(
                                              fontSize: 3.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.mumbaiStock?[0].s5xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                    controller: _5xl,

                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // '432',
                                              displayallcolor?.tripurStock?[0].s5xl ?? ''  ,
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                total5xl.toString(),
                                              // "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Padding(
                                //   padding: EdgeInsets.all(2.h),
                                //   child: Container(
                                //     child: Row(
                                //       crossAxisAlignment: CrossAxisAlignment.center,
                                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //       children: [
                                //         Text(
                                //           "Available Qty",
                                //           style: TextStyle(
                                //               fontSize: 2.5.h,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //         // SizedBox(width: 5.w),
                                //         Container(
                                //           width: 20.w,
                                //           child: Divider(
                                //               thickness: 2,
                                //               color: Color(0xfff333389)),
                                //         ),
                                //         // SizedBox(width: 5.w),
                                //         Container(
                                //             alignment: Alignment.center,
                                //             width: 11.8.h,
                                //             height: 5.8.h,
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                         15),
                                //                 border: Border.all(
                                //                     color: Color(
                                //                         0xfff333389))),
                                //             child: Text("550",
                                //                 style: TextStyle(
                                //                     fontSize: 2.5.h,
                                //                     color:
                                //                         Color(0xfff333389),
                                //                     fontWeight:
                                //                         FontWeight.bold))),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.all(2.h),
                                //   child: Container(
                                //     child: Row(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //       children: [
                                //         Text(
                                //           "Enter Quantity",
                                //           style: TextStyle(
                                //               fontSize: 2.5.h,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //         // SizedBox(width: 5.w),
                                //         // Container(
                                //         //   width: 20.w,
                                //         //   child: Divider(
                                //         //       thickness: 2,
                                //         //       color: Color(0xfff333389)),
                                //         // ),
                                //         // SizedBox(width: 5.w),
                                //         Container(
                                //             alignment: Alignment.center,
                                //             width: 45.w,
                                //             height: 5.8.h,
                                //             decoration: BoxDecoration(
                                //                 color: Color(0xfff333389),
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                         10),
                                //                 border: Border.all(
                                //                     color: Color(
                                //                         0xfff333389))),
                                //             child: Text("550",
                                //                 style: TextStyle(
                                //                     fontSize: 2.h,
                                //                     color: Colors.white,
                                //                     fontWeight:
                                //                         FontWeight.bold))),
                                //       ],
                                //     ),
                                //   ),
                                // ),

                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.circular(12)

                                        // boxShadow: [
                                        //   // BoxShadow(
                                        //   //   // color: Colors.grey.withOpacity(0.5), // color of the shadow
                                        //   //   spreadRadius: 5, // spread radius
                                        //   //   // blurRadius: 7, // blur radius
                                        //   //   offset: Offset(0, 3), // changes position of shadow
                                        //   // ),
                                        // ],

                                        ),
                                    child: ExpansionTile(
                                      title: Text('Size Chart'),
                                      children: <Widget>[
                                        SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            // height: 100.h,
                                            child: ListTile(
                                                title: Column(
                                              children: [
                                                Text(
                                                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                  style: TextStyle(
                                                      fontSize: 2.h,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text("Size Chart",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                SizedBox(height: 1.h),
                                                Divider(
                                                    color:
                                                        Colors.grey.shade400),
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    'assets/product_2_img2.png',
                                                    fit: BoxFit.cover,
                                                    height: 33.5.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Image.network(
                                                    displayallcolor?.mumbaiStock?[0].sizeChart ?? '',
                                                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                      return Image.asset('assets/size_chart.png',
                                                        fit: BoxFit.cover,
                                                        height: 40.h,
                                                        width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                      );
                                                    },
                                                    // 'assets/size_chart.png',
                                                    fit: BoxFit.cover,
                                                    height: 40.h,
                                                  ),
                                                ),

                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('Label')),
                                                //       Container(
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('Brust')),
                                                //       Container(
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child:
                                                //               Text('Length')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 1.h),
                                                // Divider(
                                                //     color:
                                                //         Colors.grey.shade400),
                                                // SizedBox(height: 1.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('2XS')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('30')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('21')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('XS')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('32')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('22')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('S')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('34')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('23')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('M')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('38')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('24')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('L')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('40')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('25')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('XL')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('42')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('26')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('2XL')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('44')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('27')),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 2.h),
                                                // Padding(
                                                //   padding: EdgeInsets.symmetric(
                                                //       horizontal: 4.h),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('3XL')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('46')),
                                                //       Container(
                                                //           width: 10.w,
                                                //           alignment:
                                                //               Alignment.center,
                                                //           child: Text('28')),
                                                //     ],
                                                //   ),
                                                // ),
                                                SizedBox(height: 4.h),
                                                Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Available Downloads')),
                                                SizedBox(height: 3.h),
                                                Container(
                                                  alignment: Alignment.center,

                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.09,
                                                  // color: Color(0xfff333389),
                                                  // padding:
                                                  //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          displayallcolor?.mumbaiStock?[0].sizeChart.toString() ?? '';
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder: (context) => products_1()));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              Size(40.w, 6.h),
                                                          backgroundColor:
                                                              Color(
                                                                  0xfff333389),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Image',
                                                          style: TextStyle(
                                                              fontSize: 2.h),
                                                        ),
                                                      ),
                                                      // SizedBox(
                                                      //   width: 3.w,
                                                      // ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          displayallcolor?.mumbaiStock?[0].videoSpecification.toString() ?? '';
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder: (context) => products_1()));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              Size(40.w, 6.h),
                                                          backgroundColor:
                                                              Color(
                                                                  0xfff333389),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Video',
                                                          style: TextStyle(
                                                              fontSize: 2.h),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.065,
                                                  // color: Color(0xfff333389),
                                                  // padding:
                                                  //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                                                  child: ElevatedButton(
                                                    onPressed: ()  {
                                                      displayallcolor?.mumbaiStock?[0].catalogue.toString() ?? '';


                                                    //   var response = await http.get(Uri.parse(( displayallcolor?.mumbaiStock?[0].catalogue.?? '')));
                                                    //
                                                    //
                                                    //
                                                    // await getDownloadsDirectory();
                                                    //   String directoryPath = storageDirectory!.path;
                                                    //
                                                    //   File file = File('$directoryPath/$fileName');
                                                    //   // Directory directory = await getApplicationDocumentsDirectory();
                                                    //   await file.writeAsBytes(response.bodyBytes);
                                                    //   String filePath = '${storageDirectory.path}/$fileName';
                                                    //
                                                    //   try {
                                                    //     final result = await OpenFile.open(filePath);
                                                    //   } catch (e) {
                                                    //     print(e.toString());
                                                    //   }
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) => products_1()));
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color(0xfff333389),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Download Catalogue',
                                                          style: TextStyle(
                                                              fontSize: 2.h),
                                                        ),
                                                        // Icon(
                                                        //   Icons.arrow_forward,
                                                        //   color: Colors.white,
                                                        //   size: 24.0,
                                                        //   semanticLabel:
                                                        //   'Text to announce in accessibility modes',
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top: 1.h),
                                      child: Text(
                                        "Select Color",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.4.h,
                                        ),
                                      )),
                                ),
                                // SizedBox(
                                //   height: 1.4.h,
                                // ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 2.h, right: 2.h),
                                  child: Divider(color: Colors.grey.shade400),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Container(
                                      height: 18.18.h,
                                      width: 90.w,
                                      padding: EdgeInsets.all(9.0),
                                      child: GridView.builder(
                                        itemCount: tripur.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 7,
                                                crossAxisSpacing: 12.0,
                                                childAspectRatio: 3 / 3,
                                                mainAxisSpacing: 6.0),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  colorapi();
                                                  btn = index;
                                                });
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 10.h,
                                                    width: 20.w,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: tripur[index]),
                                                  ),
                                                  (btn == index)
                                                      ? Container(
                                                          height: 10.h,
                                                          width: 20.w,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .transparent),
                                                          child: Icon(
                                                            Icons.check,
                                                            color: Colors.white,
                                                            size: 15.sp,
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              )
                                          );
                                        },
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Select Gender",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.4.h,
                                        ),
                                      )),
                                ),
                                // SizedBox(
                                //   height: 2.h,
                                // ),
                                Divider(color: Colors.grey.shade400),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              gen = 1;
                                            }
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(0.1.h),
                                            alignment: Alignment.center,
                                            width: 10.h,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                                color: (gen == 0)
                                                    ? Colors.white
                                                    : Color(0xfff333389),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color(0xff333389))),
                                            child: Text(
                                              'Men',
                                              style: TextStyle(
                                                  color: (gen == 0)
                                                      ? Color(0xff333389)
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 2.h),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.6.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              gen = 0;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(0.1.h),
                                            alignment: Alignment.center,
                                            width: 14.h,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                                color: (gen == 1)
                                                    ? Colors.white
                                                    : Color(0xfff333389),
                                                // color:_selectedColor,

                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color(0xff333389))),
                                            child: Text(
                                              'Women',
                                              style: TextStyle(
                                                  color: (gen == 1)
                                                      ? Color(0xff333389)
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 2.h),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Container(
                                    alignment: Alignment.center,
                                    height: 6.h,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color(0xfffeaeaf3),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Color:",
                                            style: TextStyle(
                                              fontSize: 2.5.h,
                                            ),
                                          ),
                                          Text(
                                            " Red",
                                            style: TextStyle(
                                                fontSize: 2.5.h,
                                                color: Color(0xfff333389)),
                                          ),
                                          // SizedBox(
                                          //   width: 6.h,
                                          // ),
                                          Text(
                                            "|",
                                            style: TextStyle(
                                                fontSize: 2.5.h,
                                                color: Color(0xfff333389)),
                                          ),
                                          // SizedBox(
                                          //   width: 7.h,
                                          // ),
                                          Text(
                                            "Price:",
                                            style: TextStyle(
                                              fontSize: 2.5.h,
                                            ),
                                          ),
                                          Text(
                                            " ₹125",
                                            style: TextStyle(
                                                fontSize: 2.5.h,
                                                color: Color(0xfff333389)),
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 4.h,
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 18.w, left: 3.w, bottom: 2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Size",
                                          style: TextStyle(fontSize: 2.h),
                                        ),
                                        // SizedBox(width: 1.8.h),
                                        Text("Mumbai",
                                            style: TextStyle(fontSize: 2.h)),
                                        // SizedBox(width: 1.8.h),
                                        Text("Tirpur",
                                            style: TextStyle(fontSize: 2.h)),
                                        // SizedBox(width: 1.8.h),
                                        Text("Total",
                                            style: TextStyle(fontSize: 2.h)),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.all(8.0),
                                //   child:
                                //       Divider(color: Colors.grey.shade400),
                                // ),

                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "S ",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "M ",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "L ",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "XL",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "2XL",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "3XL",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "4XL",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xfff9f9f9),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "5XL",
                                          style: TextStyle(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 12.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '432',
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                        // SizedBox(width: 5.w),
                                        //
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "432",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 10.h,
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: '',
                                                    // suffixIcon: Column(
                                                    //
                                                    //   children: [
                                                    //     Icon(Icons.arrow_drop_up),
                                                    //     Icon(Icons.arrow_drop_down),
                                                    //   ],
                                                    // )
                                                  ),
                                                  // child: Text(
                                                  //   "1000",
                                                  //   style: TextStyle(
                                                  //       color: Color(0xff5a5a9f), fontWeight: FontWeight.bold),
                                                  // ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Padding(
                                //   padding: EdgeInsets.all(2.h),
                                //   child: Container(
                                //     child: Row(
                                //       crossAxisAlignment: CrossAxisAlignment.center,
                                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //       children: [
                                //         Text(
                                //           "Available Qty",
                                //           style: TextStyle(
                                //               fontSize: 2.5.h,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //         // SizedBox(width: 5.w),
                                //         Container(
                                //           width: 20.w,
                                //           child: Divider(
                                //               thickness: 2,
                                //               color: Color(0xfff333389)),
                                //         ),
                                //         // SizedBox(width: 5.w),
                                //         Container(
                                //             alignment: Alignment.center,
                                //             width: 11.8.h,
                                //             height: 5.8.h,
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                         15),
                                //                 border: Border.all(
                                //                     color: Color(
                                //                         0xfff333389))),
                                //             child: Text("550",
                                //                 style: TextStyle(
                                //                     fontSize: 2.5.h,
                                //                     color:
                                //                         Color(0xfff333389),
                                //                     fontWeight:
                                //                         FontWeight.bold))),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.all(2.h),
                                //   child: Container(
                                //     child: Row(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //       children: [
                                //         Text(
                                //           "Enter Quantity",
                                //           style: TextStyle(
                                //               fontSize: 2.5.h,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //         // SizedBox(width: 5.w),
                                //         // Container(
                                //         //   width: 20.w,
                                //         //   child: Divider(
                                //         //       thickness: 2,
                                //         //       color: Color(0xfff333389)),
                                //         // ),
                                //         // SizedBox(width: 5.w),
                                //         Container(
                                //             alignment: Alignment.center,
                                //             width: 45.w,
                                //             height: 5.8.h,
                                //             decoration: BoxDecoration(
                                //                 color: Color(0xfff333389),
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                         10),
                                //                 border: Border.all(
                                //                     color: Color(
                                //                         0xfff333389))),
                                //             child: Text("550",
                                //                 style: TextStyle(
                                //                     fontSize: 2.h,
                                //                     color: Colors.white,
                                //                     fontWeight:
                                //                         FontWeight.bold))),
                                //       ],
                                //     ),
                                //   ),
                                // ),

                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: ExpansionTile(
                                    title: Text('Size Chart'),
                                    children: <Widget>[
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          height: 100.h,
                                          child: ListTile(
                                              title: Column(
                                            children: [
                                              Text(
                                                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                style: TextStyle(
                                                    fontSize: 2.h,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text("Size Chart",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SizedBox(height: 1.h),
                                              Divider(
                                                  color: Colors.grey.shade400),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  'assets/product_2_img2.png',
                                                  fit: BoxFit.cover,
                                                  height: 40.h,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                ),
                                              ),
                                              Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  color: Colors.red,
                                                  child: Text('djvvdv')),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07,
                                                // color: Color(0xfff333389),
                                                // padding:
                                                //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) => products_1()));
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xfff333389),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Image',
                                                        style: TextStyle(
                                                            fontSize: 2.h),
                                                      ),
                                                      // Icon(
                                                      //   Icons.arrow_forward,
                                                      //   color: Colors.white,
                                                      //   size: 24.0,
                                                      //   semanticLabel:
                                                      //   'Text to announce in accessibility modes',
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 1.h),
                                              Container(
                                                alignment: Alignment.center,

                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                // color: Color(0xfff333389),
                                                // padding:
                                                //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => products_1()));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            Size(40.w, 6.5.h),
                                                        backgroundColor:
                                                            Color(0xfff333389),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Catalog',
                                                        style: TextStyle(
                                                            fontSize: 2.h),
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 3.w,
                                                    // ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => products_1()));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            Size(40.w, 6.5.h),
                                                        backgroundColor:
                                                            Color(0xfff333389),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Video',
                                                        style: TextStyle(
                                                            fontSize: 2.h),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
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
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
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
                            blockapi();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(0.1.h),
                          alignment: Alignment.center,
                          width: 44.w,
                          height: 5.5.h,
                          decoration: BoxDecoration(
                              color: (cart == 0)
                                  ? Color(0xfff333389)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white)),
                          child: Text(
                            'Block',
                            style: TextStyle(
                                color: (cart == 0)
                                    ? Colors.white
                                    : Color(0xff333389),
                                fontWeight: FontWeight.bold,
                                fontSize: 2.5.h),
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
                                  builder: (context) => summary(
                                      // pronamenevigatior:   widget.pronamenevigatior.toString(),

                                      )));
                          setState(() {
                            cart = 0;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(0.1.h),
                          alignment: Alignment.center,
                          width: 44.w,
                          height: 5.5.h,
                          decoration: BoxDecoration(
                              color: (cart == 1)
                                  ? Color(0xfff333389)
                                  : Colors.white,
                              // color:_selectedColor,

                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white)),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                                color: (cart == 1)
                                    ? Colors.white
                                    : Color(0xff333389),
                                fontWeight: FontWeight.bold,
                                fontSize: 2.5.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // child: Padding(
              //   padding: EdgeInsets.only(bottom: 0.h, left: 2.h),
              //   child: Row(
              //     children: [
              //       IconButton(
              //         onPressed: () {
              //           _scaffoldKey.currentState?.openDrawer();
              //         },
              //         icon: Icon(
              //           Icons.menu,
              //           color: Colors.white,
              //           size: 4.h,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 2.3.h,
              //       ),
              //       Container(
              //         // padding: EdgeInsets.only(top: 1.5.h),
              //         // alignment: Alignment.center,
              //         child: Text(
              //           "Products",
              //           style: TextStyle(fontSize: 2.h, color: Colors.white),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 14.h,
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           // _scaffoldKey.currentState?.openDrawer();
              //         },
              //         icon: Icon(
              //           Icons.check_box_outline_blank,
              //           color: Colors.white,
              //           size: 3.h,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 1.h,
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           // _scaffoldKey.currentState?.openDrawer();
              //         },
              //         icon: Icon(
              //           Icons.shopping_bag_outlined,
              //           color: Colors.white,
              //           size: 3.h,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              decoration: BoxDecoration(
                color: Color(0xfff333389),
                // borderRadius: BorderRadius.all(
                //   Radius.circular(10),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  colorapi() async {
    final Map<String, String> data = {};
    data['action'] = 'all_color_display';

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider().product2_color(data).then((Response response) async {
          product2color = colorClass.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              product2color?.status == "success") {
            selectimageapi();
            displaycolor();
            setState(() {
              // btn = int.parse(product2color?.data?[0].colorImage ?? '');
            });

            // print("img" + (searchproperty?.data?[0].prodImgDefault).toString());

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) {}
          } else {}
        });
      } else {}
    });
  }

  imageapi() async {
    final Map<String, String> data = {};
    data['action'] = 'single_product_display';
    data['product_name'] = widget.pronamenevigatior.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider().product2_image(data).then((Response response) async {
          imageDisplay =
              product2Imageclass.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && imageDisplay?.status == "success") {
            setState(() {});

            // print("img" + (searchproperty?.data?[0].prodImgDefault).toString());

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) {}
          } else {}
        });
      } else {}
    });
  }

  selectimageapi() async {
    final Map<String, String> data = {};
    data['action'] = 'color_select_display_img';
    data['color_name'] = product2color?.data?[selectbtn].colorName ?? '';
    data['product_id'] = widget.coloridnevigator.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider()
            .product2_selectimage(data)
            .then((Response response) async {
          selectimage =
              selectColorImageClass.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && selectimage?.status == "success") {
            print("============="+(selectimage?.imageData?[0]).toString());
            setState(() {

            });

            // print("img" + (searchproperty?.data?[0].prodImgDefault).toString());

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) {}
          } else {}
        });
      } else {}
    });
  }




  displaycolor() async {
    final Map<String, String> data = {};
    data['action'] = 'color_select_display_all_data';
    data['product_name'] = widget.pronamenevigatior.toString();
    data['gender_type'] =  gen == 0 ?"MEN":"WOMEN";
    data['color_name'] = product2color?.data?[selectbtn].colorName ?? '';
    data['d_id'] = widget.coloridnevigator.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider()
            .product2_displaycolorselect(data)
            .then((Response response) async {
          displayallcolor =
              colorDisplayClass.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && displayallcolor?.status == "success") {


            print("============="+(displayallcolor?.mumbaiStock?[0].s).toString());
            setState(() {
              totals =int.parse( (displayallcolor?.mumbaiStock?[0].s).toString()) +int.parse((displayallcolor?.tripurStock?[0].s).toString());
              totalm =int.parse( (displayallcolor?.mumbaiStock?[0].m).toString()) +int.parse((displayallcolor?.tripurStock?[0].m).toString());
              totall =int.parse( (displayallcolor?.mumbaiStock?[0].l).toString()) +int.parse((displayallcolor?.tripurStock?[0].l).toString());
              totalxl =int.parse( (displayallcolor?.mumbaiStock?[0].xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].xl).toString());
              total2xl =int.parse( (displayallcolor?.mumbaiStock?[0].xxl).toString()) +int.parse((displayallcolor?.tripurStock?[0].xxl).toString());
              total3xl =int.parse( (displayallcolor?.mumbaiStock?[0].s3xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].s3xl).toString());
              total4xl =int.parse( (displayallcolor?.mumbaiStock?[0].s4xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].s4xl).toString());
              total5xl =int.parse( (displayallcolor?.mumbaiStock?[0].s5xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].s5xl).toString());










            });

            // print("img" + (searchproperty?.data?[0].prodImgDefault).toString());

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) {}
          } else {}
        });
      } else {}
    });
  }



  blockapi() async {
    final Map<String, String> data = {};
    data['action'] = 'block_produt_wise';
    data['t_ap_id'] =   '1';
    data['t_apd_id'] =   '2';
    data['m_ap_id'] =   '1';
    data['d_id'] = '1';
    data['m_xs'] = gen == 0 ?"MEN":"WOMEN";
    data['m_s'] = _s.text.trim().toString();
    data['m_m'] = _m.text.trim().toString();
    data['m_l'] = _l.text.trim().toString();
    data['m_xl'] =_xl.text.trim().toString();
    data['m_xxl'] = _xxl.text.trim().toString();
    data['m_3xl'] = _3xl.text.trim().toString();
    data['m_4xl'] = _4xl.text.trim().toString();
    data['m_5xl'] = _5xl.text.trim().toString();

    // data['t_xs'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_s'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_m'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_l'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_xl'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_xxl'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_3xl'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_4xl'] = gen == 0 ?"MEN":"WOMEN";
    // data['t_5xl'] = gen == 0 ?"MEN":"WOMEN";




    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider()
            .product2blockprovider(data)
            .then((Response response) async {
          block =
              blockProductClass.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && block?.status == "success") {


            print("============="+(block?.status).toString());
            setState(() {
              // totals =int.parse( (displayallcolor?.mumbaiStock?[0].s).toString()) +int.parse((displayallcolor?.tripurStock?[0].s).toString());
              // totalm =int.parse( (displayallcolor?.mumbaiStock?[0].m).toString()) +int.parse((displayallcolor?.tripurStock?[0].m).toString());
              // totall =int.parse( (displayallcolor?.mumbaiStock?[0].l).toString()) +int.parse((displayallcolor?.tripurStock?[0].l).toString());
              // totalxl =int.parse( (displayallcolor?.mumbaiStock?[0].xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].xl).toString());
              // total2xl =int.parse( (displayallcolor?.mumbaiStock?[0].xxl).toString()) +int.parse((displayallcolor?.tripurStock?[0].xxl).toString());
              // total3xl =int.parse( (displayallcolor?.mumbaiStock?[0].s3xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].s3xl).toString());
              // total4xl =int.parse( (displayallcolor?.mumbaiStock?[0].s4xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].s4xl).toString());
              // total5xl =int.parse( (displayallcolor?.mumbaiStock?[0].s5xl).toString()) +int.parse((displayallcolor?.tripurStock?[0].s5xl).toString());
              //









            });

            // print("img" + (searchproperty?.data?[0].prodImgDefault).toString());

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) {}
          } else {}
        });
      } else {}
    });
  }

}
