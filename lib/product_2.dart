import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'drawer.dart';

class product_2 extends StatefulWidget {
  const product_2({Key? key}) : super(key: key);

  @override
  State<product_2> createState() => _product_2State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  int selectindex = 0;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List<products> images = [
    // products("assets/product_1_img.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    // products("assets/product_1_img3.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
    // products("assets/product_1_img4.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
    // products("assets/product_1_img5.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
    // products("assets/product_1img6.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
    // products("assets/product_1_img.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
    // products("assets/product_1_img2.png", "Brand Name", "Street Wear",
    //     "Artist Name", "\₹125"),
  ];

  List<String> tabs = ["Tripur", "Munbai"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffFFFFFF),

        drawer: drawer(),
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
                        style: TextStyle(fontSize: 2.h, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 14.h,
                    ),
                    IconButton(
                      onPressed: () {
                        // _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.check_box_outline_blank,
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
            Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                children: [
                  Stack(children: <Widget>[
                    Container(
                      height: 44.h,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              (images[index].image).toString(),
                              width: MediaQuery.of(context).size.width * 0.9,
                              // height: MediaQuery.of(context).size.height * 1,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                      color: Color(0xfffFFFFFF),
                    ),
                    Positioned(
                      top: 37.h,
                      left: 16.h,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.02,
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: SlideEffect(
                              spacing: 8.0,
                              radius: 15.0,
                              dotWidth: 11.0,
                              dotHeight: 12.0,
                              paintStyle: PaintingStyle.fill,
                              strokeWidth: 1.5,
                              dotColor: Colors.grey.shade300,
                              activeDotColor: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    alignment: Alignment.center,
                    height: 6.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectindex = index;
                              });
                            },
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(

                                  height: 5.h,
                                  width: 8.h,
                                  margin: EdgeInsets.only(right: 3.w),
                                  color: (selectindex == index)
                                      ? Color(0xfff333389)
                                      : Color(0xfffFFFFFF),
                                  // padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
                                  child: Center(
                                    child: Text(
                                      tabs[index],
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: (selectindex != index)
                                            ? Colors.grey.shade600
                                            : Color(0xffb4776e6),
                                      ),
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
                        }
                        ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
