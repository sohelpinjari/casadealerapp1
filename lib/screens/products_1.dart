import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/loader.dart';
import 'package:casadealerapp/main.dart';
import 'package:casadealerapp/modal_class/category_wise_display.dart';
import 'package:casadealerapp/modal_class/search_class.dart';
import 'package:casadealerapp/screens/cart_order.dart';
import 'package:casadealerapp/screens/drawer.dart';
import 'package:casadealerapp/provider/login_authprovider.dart';
import 'package:casadealerapp/modal_class/all_category_display.dart';
import 'package:casadealerapp/screens/product_2.dart';
import 'package:casadealerapp/modal_class/productapiclass.dart';
import 'package:casadealerapp/provider/productprovider.dart';
import 'package:casadealerapp/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class products_1 extends StatefulWidget {
  const products_1({Key? key}) : super(key: key);
  static const appTitle = 'Drawer Demo';

  @override
  State<products_1> createState() => _products_1State();
}

class products {
  String? image;
  String? Brand_Name;
  String? Street_Wear;
  String? Artist_Name;
  String? size_s;
  String? size_m;
  String? size_l;

  String? Price;

  products(this.image, this.Brand_Name, this.Street_Wear, this.Artist_Name,
      this.size_s, this.size_m, this.size_l, this.Price);
}

class _products_1State extends State<products_1> {
  TextEditingController _search = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  allcategorydisplay? allproperty;
  categorywisedisplay? allcatogaryproperty;
  search? searchproperty;
  List<products> images = [
    products("assets/product_1_img.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1_img3.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1_img4.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1_img5.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1img6.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1_img.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125 - \₹150"),
  ];
  productapi? productData;
  String? name;
  String? select;
  String? image;
  bool se_icon = false;
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alldisplay();
    categorydisplay();

    print(allproperty?.status);
    print(allproperty?.data?[0].categoryImg);
  }

  // getdata() async {
  //   userData = await SaveDataLocal.getDataFromLocal();
  //   setState(() {
  //     productData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return commanScreen( isLoading:isloading,
      scaffold: Scaffold(
        drawer: drawer(context),
        key: _scaffoldKey,
        // appBar: AppBar(
        //   toolbarHeight: 15.h, // Set this height
        //
        //   title: Text("Products"),
        //   backgroundColor: Color(0xfff333389),
        //
        // ),
        body: isloading?Container(): Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xfffFFFFFF),
            ),
            SingleChildScrollView(
              child: Column(
                children: [

                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 11.h,

                        child: Column(
                          children: [
                            SizedBox(height: 4.h),
                            Row(
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
                                        size: 4.h,
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
                                        style: TextStyle(
                                            fontSize: 2.h, color: Colors.white),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    cart_order()));
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
                          ],
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
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
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
                                    searchapi(value);
                                  } else if (value.isEmpty) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                products_1()));
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
                            )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Container(
                      height: 13.h,
                      // margin: EdgeInsets.symmetric(horizontal: 2.h),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allproperty?.data?.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  gen = index;
                                  select = allproperty?.data?[index].id;

                                });


                                print("gfhfhgh");
                                categorydisplay();



                              },
                              child: Container(
                                height: 13.h,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 0.8.h),
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.10,
                                      // child: TextFormField(
                                      //   validator: (value) {
                                      //     if (value!.isEmpty) {
                                      //       return "";
                                      //     }
                                      //     return null;
                                      //   },
                                      //   // controller: _firstname,
                                      //   decoration: InputDecoration(
                                      //     border: InputBorder.none,
                                      //     contentPadding: EdgeInsets.all(3.h),
                                      //     hintText: 'Search by SKU/Brand',
                                      //     suffixIcon: Icon(
                                      //       Icons.search,
                                      //       color: Color(0xfff333389),
                                      //       size: 4.5.h,
                                      //     ),
                                      //   ),
                                      // ),




                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: (gen != index)
                                                ? Colors.white
                                                : Color(0xfff333389),
                                            width: 0.8.w),

                                        shape: BoxShape.circle,
                                        // color: Colors.blueGrey,


                                        image: DecorationImage(
                                            image: NetworkImage(
                                          allproperty
                                                  ?.data?[index].categoryImg ??
                                              "",
                                        )
                                            // borderRadius: BorderRadius.all(
                                            //   Radius.circular(10),
                                            ),
                                      ),
                                      // child:Image.network( '${allproperty?.data?[index].categoryImg.toString()}')
                                    ),
                                    Text(
                                      allproperty?.data?[index].categoryName ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 1.5.h, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  _search.text.isNotEmpty
                      ? (searchproperty == null
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Container(
                                              height: 25.h,
                                              child: Text(
                                                'Not Found',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 2.h,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : searchproperty?.data?.length ?? 0) ==
                              0
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      'Not Found',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 2.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 75.h,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.topCenter,
                              // margin: EdgeInsets.symmetric(horizontal: 2.h),
                              child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: searchproperty == null
                                      ? 0
                                      : searchproperty?.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      // height:40.h,
                                      // width: 20.h,
                                      // margin:
                                      // EdgeInsets.only(right: 1.h, bottom: 1.h),
                                      child: GestureDetector(
                                        onTap: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => product_2(

                                                    pronamenevigatior:   '${searchproperty?.data?[index].prodName}',
                                                                                                // coloridnevigator:
                                                    //     '${productData?.productData![index].apId}',
                                                  )
                                              )
                                          );
                                          String? search = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      products_1()));
                                          if (search != null) {
                                            if (search.isNotEmpty) {
                                              _search.text = search;
                                              searchapi(search);
                                            }
                                          }
                                        },
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              CachedNetworkImage(
                                                imageUrl: searchproperty
                                                        ?.data?[index]
                                                        .prodImgDefault ??
                                                    '',
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  height: 19.h,
                                                  width: 40.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10.sp),
                                                    ),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                  height: 19.h,
                                                  width: 40.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10.h),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.asset(
                                                      "assets/default_product_image.png",
                                                      // width: MediaQuery.of(context)
                                                      //     .size
                                                      //     .width *
                                                      //     0.6,
                                                      // height: MediaQuery.of(context)
                                                      //     .size
                                                      //     .height *
                                                      //     0.3,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                // Container(
                                                //   decoration: BoxDecoration(
                                                //   borderRadius: BorderRadius.all(
                                                //       Radius.circular(10.sp),
                                                //     ),
                                                //
                                                //   ),
                                                //   child: Image.asset(
                                                //     "assets/product_1_img.png",
                                                //     width: MediaQuery.of(context)
                                                //         .size
                                                //         .width *
                                                //         0.6,
                                                //     height: MediaQuery.of(context)
                                                //         .size
                                                //         .height *
                                                //         0.3,
                                                //     fit: BoxFit.cover,
                                                //
                                                //   ),
                                                // )
                                              ),

                                              Container(
                                                child: Flexible(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        searchproperty
                                                                ?.data?[index]
                                                                .prodName ??
                                                            '',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 1.8.h,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // Flexible(
                                              //   child: Text(
                                              //     searchproperty?.data?[index]
                                              //         . ??
                                              //         '',
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2)),
                            )
                      : Container(
                          // height: MediaQuery.of(context).size.height,
                          height: 75.h,
                          width: MediaQuery.of(context).size.width,

                          padding: EdgeInsets.all(15),
                          color: Color(0xfffFFFFFF),
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: allcatogaryproperty?.diffProduct?.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 19.0,
                                    childAspectRatio: 3.h / 5.9.h,
                                    mainAxisSpacing: 15),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => product_2(

                                              pronamenevigatior:
                                                  '${allcatogaryproperty?.diffProduct?[index].name}',
                                              // images[index]
                                              //     .Street_Wear
                                              //     .toString(),
                                              coloridnevigator:
                                                  '${allcatogaryproperty?.diffProduct?[index].id}',
                                              )
                                      )
                                  );
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child:


                                          CachedNetworkImage( width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.6,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.3,
                                              fit: BoxFit.cover,
                                            imageUrl:allcatogaryproperty
                                                ?.diffProduct?[index]
                                                .prodImgDefault ??
                                                "",
                                            progressIndicatorBuilder: (context,
                                                url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget: (context, url, error) =>
                                                Image.asset( "assets/default_product_image.png",
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.6,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.3,
                                                  fit: BoxFit.cover
                                                  ,
                                                )
                                          ),

                                          // Image.network(
                                          //         allcatogaryproperty
                                          //                 ?.diffProduct?[index]
                                          //                 .prodImgDefault ??
                                          //             "",
                                          //
                                          //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                          //     return Image.asset( "assets/default_product_image.png",
                                          //       width: MediaQuery.of(context)
                                          //           .size
                                          //           .width *
                                          //           0.6,
                                          //       height: MediaQuery.of(context)
                                          //           .size
                                          //           .height *
                                          //           0.3,
                                          //       fit: BoxFit.cover
                                          //       ,
                                          //     );
                                          //   },
                                          //         width: MediaQuery.of(context)
                                          //                 .size
                                          //                 .width *
                                          //             0.6,
                                          //         height: MediaQuery.of(context)
                                          //                 .size
                                          //                 .height *
                                          //             0.3,
                                          //         fit: BoxFit.cover,
                                          //       ),
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsets.only(
                                        //       left: MediaQuery.of(context).size.width *
                                        //           0.33,
                                        //       top: MediaQuery.of(context).size.height *
                                        //           0.010),
                                        //   child: Container(
                                        //     alignment: Alignment.center,
                                        //     width: 8.5.w,
                                        //     height: 4.h,
                                        //     decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius: BorderRadius.all(
                                        //         Radius.circular(25),
                                        //       ),
                                        //     ),
                                        //     child: IconButton(
                                        //       icon: Icon(
                                        //         Icons.favorite_border,
                                        //         color: Colors.red,
                                        //         size: 2.h,
                                        //       ),
                                        //       onPressed: () {},
                                        //     ),
                                        //   ),
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  // left: MediaQuery.of(context).size.width * 0.01,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.26),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.18,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                decoration: BoxDecoration(
                                                  // color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                // child: Text(
                                                //   images[index]
                                                //       .Brand_Name
                                                //       .toString(),
                                                //   style: TextStyle(
                                                //     fontStyle: FontStyle.italic,
                                                //     fontSize: 1.1.h,
                                                //     color: Colors.white,
                                                //   ),
                                                // ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.08,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.24),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 8.w,
                                                height: 3.8.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(25),
                                                  ),
                                                ),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.share,
                                                    color: Color(0xff7d7d7d),
                                                    size: 1.8.h,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 0.8.h),
                                      alignment: Alignment.centerLeft,

                                      child: Text(
                                        allcatogaryproperty
                                                ?.diffProduct?[index].name ??
                                            "N/A",

                                        style: TextStyle(
                                            fontSize: 2.h,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.only(left: 0.8.h),
                                    //   alignment: Alignment.centerLeft,
                                    //   child: Text(
                                    //     images[index].Artist_Name.toString(),
                                    //     style: TextStyle(
                                    //         fontSize: 1.3.h,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontStyle: FontStyle.italic,
                                    //         color: Colors.grey.shade500),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    // Row(
                                    //   // crossAxisAlignment: CrossAxisAlignment.start,
                                    //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   children: [
                                    //     Container(
                                    //       alignment: Alignment.center,
                                    //       width: MediaQuery.of(context).size.width * 0.07,
                                    //       height:
                                    //           MediaQuery.of(context).size.height * 0.03,
                                    //       decoration: BoxDecoration(
                                    //         color: Color(0xffeaeaf3),
                                    //         borderRadius: BorderRadius.all(
                                    //           Radius.circular(15),
                                    //         ),
                                    //       ),
                                    //       child: Text(
                                    //         images[index].size_s.toString(),
                                    //         style: TextStyle(
                                    //             fontSize: 2.h,
                                    //             color: Color(0xff3f3f90),
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 1.w,
                                    //     ),
                                    //     Container(
                                    //       alignment: Alignment.center,
                                    //       width: MediaQuery.of(context).size.width * 0.07,
                                    //       height:
                                    //           MediaQuery.of(context).size.height * 0.03,
                                    //       decoration: BoxDecoration(
                                    //         color: Color(0xffeaeaf3),
                                    //         borderRadius: BorderRadius.all(
                                    //           Radius.circular(15),
                                    //         ),
                                    //       ),
                                    //       child: Text(
                                    //         images[index].size_m.toString(),
                                    //         style: TextStyle(
                                    //             fontSize: 2.h,
                                    //             color: Color(0xff3f3f90),
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //     ),
                                    //     // SizedBox(
                                    //     //   width: 1.w,
                                    //     // ),
                                    //     // Container(
                                    //     //   alignment: Alignment.center,
                                    //     //   width: MediaQuery.of(context).size.width * 0.07,
                                    //     //   height:
                                    //     //       MediaQuery.of(context).size.height * 0.03,
                                    //     //   decoration: BoxDecoration(
                                    //     //     color: Color(0xffeaeaf3),
                                    //     //     borderRadius: BorderRadius.all(
                                    //     //       Radius.circular(15),
                                    //     //     ),
                                    //     //   ),
                                    //     //   child: Text(
                                    //     //     images[index].size_l.toString(),
                                    //     //     style: TextStyle(
                                    //     //         fontSize: 2.h,
                                    //     //         color: Color(0xff3f3f90),
                                    //     //         fontWeight: FontWeight.bold),
                                    //     //   ),
                                    //     // ),
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: 3.5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 42.w,
                                          padding: EdgeInsets.only(left: 0.8.h),
                                          alignment: Alignment.centerLeft,
                                          child:
                                          allcatogaryproperty
                                              ?.diffProduct?[index]
                                              .minPrice == 0 || allcatogaryproperty
                                  ?.diffProduct?[index]
                                  .minPrice ==  null
                                              ? Text(
                                            "N/A",
                                            style: TextStyle(color: Colors.red,
                                              fontSize: 2.3.h,
                                              fontWeight: FontWeight.bold,
                                            ),

                                          )
                                              :

                                          Text(
                                            (allcatogaryproperty
                                                            ?.diffProduct?[
                                                                index]
                                                            .minPrice)
                                                        .toString()  +
                                                    " - " +
                                                    (allcatogaryproperty
                                                            ?.diffProduct?[
                                                                index]
                                                            .minPrice)
                                                        .toString() ?? 'N/A',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 2.3.h,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffe2000f),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 16.w,
                                        // ),
                                        // Container(
                                        //   alignment: Alignment.center,
                                        //   width: MediaQuery.of(context).size.width * 0.09,
                                        //   height:
                                        //       MediaQuery.of(context).size.height * 0.04,
                                        //   decoration: BoxDecoration(
                                        //     color: Color(0xffe2000f),
                                        //     borderRadius: BorderRadius.all(
                                        //       Radius.circular(15),
                                        //     ),
                                        //   ),
                                        //   child: Icon(
                                        //     Icons.shopping_cart_outlined,
                                        //     color: Colors.white,
                                        //     size: 2.h,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  alldisplay() async {
    final Map<String, String> data = {};
    data['action'] = 'all_category_display';
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider().allcatogeryapi(data).then((Response response) async {
          allproperty = allcategorydisplay.fromJson(json.decode(response.body));

          isloading = false;

          if (response.statusCode == 200 && allproperty?.status == "success") {
            setState(() {
              select = allproperty?.data?[0].id.toString();
              categorydisplay();
            });



            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) { isloading = false;}
          } else { isloading = false;}
        });
      } else { isloading = false;}
    });
  }

  categorydisplay() async {
    final Map<String, String> data = {};
    data['action'] = 'category_wise_product';
    data['category_id'] = select.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider()
            .selectcategorydisplay(data)
            .then((Response response) async {
          allcatogaryproperty =
              categorywisedisplay.fromJson(json.decode(response.body));
          isloading = false;

          if (response.statusCode == 200 &&
              allcatogaryproperty?.status == "success") {
            setState(() {});

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) { isloading = false;}
          } else {

            isloading = false;}
        });
      } else { isloading = false;}
    });
  }

  searchapi(body) async {
    final Map<String, String> data = {};
    data['action'] = 'searching_products';
    data['search'] = body;

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Productprovider().searchproduct(data).then((Response response) async {
          searchproperty = search.fromJson(json.decode(response.body));

          isloading = false;
          if (response.statusCode == 200 &&
              searchproperty?.status == "success") {
            setState(() {});

            print("img" + (searchproperty?.data?[0].prodImgDefault).toString());

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) { isloading = false;}
          } else { isloading = false;}
        });
      } else { isloading = false;}
    });
  }
}
