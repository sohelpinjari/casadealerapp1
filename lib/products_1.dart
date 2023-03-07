import 'dart:convert';
import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/drawer.dart';
import 'package:casadealerapp/login_authprovider.dart';
import 'package:casadealerapp/product_2.dart';
import 'package:casadealerapp/productapiclass.dart';
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

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  List<products> images = [
    products("assets/product_1_img.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1_img3.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1_img4.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1_img5.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1img6.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1_img.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "S", "M", "L", "\₹125"),
  ];
  productapi? productData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // view();
    productsapi();

    getdata();
  }

  getdata() async {
    userData = await SaveDataLocal.getDataFromLocal();
    setState(() {
      productData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(context),
        key: _scaffoldKey,
        // appBar: AppBar(
        //   toolbarHeight: 15.h, // Set this height
        //
        //   title: Text("Products"),
        //   backgroundColor: Color(0xfff333389),
        //
        // ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xfffFFFFFF),
            ),
            Positioned(
              top: 0.0,
              child: Container(
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
            ),
            Positioned(
              top: 8.5.h,
              left: 0,
              right: 0,
              // left: 2.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.10,
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
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/product_1_img4.png"),
                                  fit: BoxFit.fitWidth)
                              // // borderRadius: BorderRadius.all(
                              // //   Radius.circular(10),
                              // ),
                              ),
                        ),
                        Text(
                          'Men',
                          style: TextStyle(fontSize: 2.h, color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.10,
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
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                  image: AssetImage("assets/product_1_img.png"),
                                  fit: BoxFit.fitWidth)
                              // // borderRadius: BorderRadius.all(
                              // //   Radius.circular(10),
                              // ),
                              ),
                        ),
                        Text(
                          'Women',
                          style: TextStyle(fontSize: 2.h, color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.10,
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
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/product_1_img5.png"),
                                  fit: BoxFit.fitWidth)
                              // // borderRadius: BorderRadius.all(
                              // //   Radius.circular(10),
                              // ),
                              ),
                        ),
                        Text(
                          'Kids',
                          style: TextStyle(fontSize: 2.h, color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.10,
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
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/product_1_img2.png"),
                                  fit: BoxFit.fitWidth)
                              // // borderRadius: BorderRadius.all(
                              // //   Radius.circular(10),
                              // ),
                              ),
                        ),
                        Text(
                          'Gift',
                          style: TextStyle(fontSize: 2.h, color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.10,
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
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/product_1_img3.png"),
                                  fit: BoxFit.fitWidth)
                              // // borderRadius: BorderRadius.all(
                              // //   Radius.circular(10),
                              // ),
                              ),
                        ),
                        Text(
                          'Tiger',
                          style: TextStyle(fontSize: 2.h, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 22.h,
              child: Container(
                // height: MediaQuery.of(context).size.height,
                height: 75.h,
                width: MediaQuery.of(context).size.width,

                padding: EdgeInsets.all(15),
                color: Color(0xfffFFFFFF),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 19.0,
                      childAspectRatio: 3.h / 6.6.h,
                      mainAxisSpacing: 15),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => product_2(
                                      imagenevigator:
                                          (images[index].image).toString(),
                                      pronamenevigatior:
                                      images[index].Street_Wear.toString(),
                                      coloridnevigator:
                                          '${productData?.productData![index].apId}',
                                    )));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  (images[index].image).toString(),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.33,
                                    top: MediaQuery.of(context).size.height *
                                        0.010),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 8.5.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size: 2.h,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        // left: MediaQuery.of(context).size.width * 0.01,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.26),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Text(
                                        images[index].Brand_Name.toString(),
                                        style: TextStyle(
                                          fontSize: 1.3.h,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.24),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 8.4.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.share,
                                          color: Color(0xff7d7d7d),
                                          size: 2.h,
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
                              images[index].Street_Wear.toString(),
                              style: TextStyle(
                                  fontSize: 2.3.h, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0.8.h),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              images[index].Artist_Name.toString(),
                              style: TextStyle(
                                  fontSize: 1.6.h,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500),
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                decoration: BoxDecoration(
                                  color: Color(0xffeaeaf3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  images[index].size_s.toString(),
                                  style: TextStyle(
                                      fontSize: 2.h,
                                      color: Color(0xff3f3f90),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                decoration: BoxDecoration(
                                  color: Color(0xffeaeaf3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  images[index].size_m.toString(),
                                  style: TextStyle(
                                      fontSize: 2.h,
                                      color: Color(0xff3f3f90),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                decoration: BoxDecoration(
                                  color: Color(0xffeaeaf3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  images[index].size_l.toString(),
                                  style: TextStyle(
                                      fontSize: 2.h,
                                      color: Color(0xff3f3f90),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 15.w,
                                padding: EdgeInsets.only(left: 0.8.h),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  images[index].Price.toString(),
                                  maxLines: 3,
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
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.09,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                  color: Color(0xffe2000f),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                  size: 2.h,
                                ),
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
          ],
        ),
      ),
    );
  }

  productsapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, String> data = {};
    data['action'] = 'fetch_products';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Authprovider().products(data).then((Response response) async {
          productData = productapi.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && productData?.status == "success") {
            SaveDataLocal.saveLogInData(userData!);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => loginsuccess()));

            if (kDebugMode) {}
          } else {}
        });
      } else {
        setState(() {});
      }
    });
  }
}
