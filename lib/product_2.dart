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
  bool _customTileExpanded = false;

  int selectindex = 0;
  int btn = 0;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List<products> images = [
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
  ];

  List<String> tabs = ["Tripur", "Munbai"];

  List<Color> tripur = [
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
    Color(0xff57492e),
  ];

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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Stack(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Container(
                              height: 44.h,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                itemCount: images.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.asset(
                                      (images[index].image).toString(),
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      // height: MediaQuery.of(context).size.height * 1,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              ),
                              color: Color(0xfffFFFFFF),
                            ),
                          ),
                          Positioned(
                            top: 37.h,
                            left: 16.h,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
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
                          ),
                        ]),
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
                                        selectindex = index;
                                      });
                                    },
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,

                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: (selectindex == index)
                                                ? Color(0xfff333389)
                                                : Color(0xfffFFFFFF),
                                          ),

                                          height: 5.h,
                                          width: 20.h,
                                          margin: EdgeInsets.only(
                                              right: 0.1.w, top: 0.6.h),

                                          // padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
                                          child: Text(
                                            tabs[index],
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                              color: (selectindex != index)
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
                        (selectindex == 0)
                            ? Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(top: 0.h),
                                          child: Text(
                                            "Select Color",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 3.h,
                                            ),
                                          )),
                                    ),
                                    // SizedBox(
                                    //   height: 1.4.h,
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 2.h, right: 2.h),
                                      child:
                                          Divider(color: Colors.grey.shade400),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                          height: 20.h,
                                          width: 50.h,
                                          padding: EdgeInsets.all(9.0),
                                          child: GridView.builder(
                                            itemCount: tripur.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 7,
                                                    crossAxisSpacing: 12.0,
                                                    childAspectRatio: 3 / 3,
                                                    mainAxisSpacing: 10.0),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                height: 28,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: (tripur[index]),
                                                ),
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
                                              fontSize: 3.h,
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
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(0.1.h),
                                                alignment: Alignment.center,
                                                width: 13.h,
                                                height: 5.5.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff333389))),
                                                child: Text(
                                                  'Men',
                                                  style: TextStyle(
                                                      color: Color(0xfff333389),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 2.5.h),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 0.6.h,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                color:
                                                (selectindex == 1)
                                                    ? Color(0xfff333389)
                                                    : Color(0xfffFFFFFF);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(0.1.h),
                                                alignment: Alignment.center,
                                                width: 15.h,
                                                height: 5.5.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text(
                                                  'Women',
                                                  style: TextStyle(
                                                      color: Color(0xfff333389),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 2.5.h),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 6.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Color(0xfffeaeaf3),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Color:",
                                                style: TextStyle(
                                                  fontSize: 3.h,
                                                ),
                                              ),
                                              Text(
                                                " Red",
                                                style: TextStyle(
                                                    fontSize: 3.h,
                                                    color: Color(0xfff333389)),
                                              ),
                                              SizedBox(
                                                width: 6.h,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    fontSize: 3.h,
                                                    color: Color(0xfff333389)),
                                              ),
                                              SizedBox(
                                                width: 7.h,
                                              ),
                                              Text(
                                                "Price:",
                                                style: TextStyle(
                                                  fontSize: 3.h,
                                                ),
                                              ),
                                              Text(
                                                " ₹125",
                                                style: TextStyle(
                                                    fontSize: 3.h,
                                                    color: Color(0xfff333389)),
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 1.h,
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Size",
                                              style: TextStyle(fontSize: 2.h),
                                            ),
                                            SizedBox(width: 1.8.h),
                                            Text("Stock in Mumbai",
                                                style:
                                                    TextStyle(fontSize: 2.h)),
                                            SizedBox(width: 1.8.h),
                                            Text("Stock in Tirpur",
                                                style:
                                                    TextStyle(fontSize: 2.h)),
                                            SizedBox(width: 1.8.h),
                                            Text("Total",
                                                style:
                                                    TextStyle(fontSize: 2.h)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child:
                                          Divider(color: Colors.grey.shade400),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "S ",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 5.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 12.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 5.w),
                                            Text("1200",
                                                style: TextStyle(
                                                    fontSize: 2.5.h,
                                                    color: Color(0xfff333389),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "M",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 5.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 12.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 5.w),
                                            Text("1200",
                                                style: TextStyle(
                                                    fontSize: 2.5.h,
                                                    color: Color(0xfff333389),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "L",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 3.h),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 12.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 5.w),
                                            Text("1200",
                                                style: TextStyle(
                                                    fontSize: 2.5.h,
                                                    color: Color(0xfff333389),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "XL",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 3.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 12.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(width: 5.w),
                                            Text("1200",
                                                style: TextStyle(
                                                    fontSize: 2.5.h,
                                                    color: Color(0xfff333389),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Available Qty",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 5.w),
                                            Container(
                                              width: 20.w,
                                              child: Divider(
                                                  thickness: 2,
                                                  color: Color(0xfff333389)),
                                            ),
                                            SizedBox(width: 5.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 11.8.h,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.5.h,
                                                        color:
                                                            Color(0xfff333389),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Enter Quantity",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 5.w),
                                            // Container(
                                            //   width: 20.w,
                                            //   child: Divider(
                                            //       thickness: 2,
                                            //       color: Color(0xfff333389)),
                                            // ),
                                            SizedBox(width: 5.w),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 45.w,
                                                height: 5.8.h,
                                                decoration: BoxDecoration(
                                                    color: Color(0xfff333389),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Color(
                                                            0xfff333389))),
                                                child: Text("550",
                                                    style: TextStyle(
                                                        fontSize: 2.h,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 8.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xfffffffff),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // border: Border.all(
                                            //     color: Color(
                                            //         0xfff333389)
                                            // )
                                          ),
                                          // child: Row(
                                          //   children: [
                                          //     Container(
                                          //       padding:
                                          //           EdgeInsets.only(left: 2.h),
                                          //       child: Text("Size chart",
                                          //           style: TextStyle(
                                          //               fontSize: 2.h,
                                          //               color: Colors.black,
                                          //               fontWeight:
                                          //                   FontWeight.bold)),
                                          //     ),
                                          //     Container(
                                          //       width: 65.w,
                                          //       height: 5.8.h,
                                          //       alignment:
                                          //           Alignment.centerRight,
                                          //       child: Icon(
                                          //         Icons.keyboard_arrow_down,
                                          //         color: Color(0xfff9696c1),
                                          //         size: 3.5.h,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )


                                      child:   ExpansionTile(
                                          title: Text('Size Chart'),

                                          children: <Widget>[
                                            ListTile(title: Text('This is tile number 1')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: Text("6546514"),
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
