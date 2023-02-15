import 'package:casadealerapp/summary.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _customTileExpanded = false;

  int selectindex = 0;
  int btn = 0;
  int gen = 0;
  int cart = 0;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

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
                            child: Stack(children: <Widget>[
                              ClipRRect(
                                  child: Image.asset('assets/product_1_img2.png'),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),

                                  ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding:  EdgeInsets.only(left:  2.w, right:  2.w, top: 36.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width *0.2,
                                                height: MediaQuery.of(context).size.height *0.03,
                                                decoration: BoxDecoration(
                                                  color: Color(0xfff7c7773),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Brand Name",
                                                  style: TextStyle(
                                                    fontSize: 1.6.h,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Container(
                                                child: Text(
                                                  "Street Wear",
                                                  style: TextStyle(
                                                      fontSize: 3.h,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "Artist Name",
                                                  style: TextStyle(
                                                      fontSize: 1.9.h,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey.shade500),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // SizedBox(
                                          //   width: 20.w,
                                          // ),

                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                  height: 4.h,
                                                width: 9.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(25),
                                                    color: Colors.white),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.red,
                                                    size: 2.h,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              SizedBox(width: 3.w),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 4.h,
                                                width: 9.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(25),
                                                    color: Colors.white),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.share,
                                                    color: Colors.grey,
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
                                  ),
                                  // SizedBox()
                                  Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      height:
                                      MediaQuery.of(context).size.height * 0.02,
                                      decoration: BoxDecoration(
                                        // border: Border.all(color: Colors.grey.shade200,),
                                        color: Color(0xff333389),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: SmoothPageIndicator(
                                        controller: controller,
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
                            ]),
                          ),

                        ]),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:  2.h),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Color(0xfff9e9ec7))),
                            alignment: Alignment.center,
                            height: 6.h,
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

                                          height: 4.6.h,
                                          width: 44.w,
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
                                      padding: EdgeInsets.only(
                                          left: 2.h, right: 2.h),
                                      child:
                                          Divider(color: Colors.grey.shade400),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                                      child: Container(
                                          height: 18.h,
                                          width: 90.w,
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
                                              return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      btn = index;
                                                    });
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        height: 10.h,
                                                        width: 20.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: tripur[
                                                                    index]),
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
                                                                color: Colors
                                                                    .white,
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
                                                });
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
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff333389))),
                                                child: Text(
                                                  'Men',
                                                  style: TextStyle(
                                                      color: (gen == 0)
                                                          ? Color(0xff333389)
                                                          : Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff333389))),
                                                child: Text(
                                                  'Women',
                                                  style: TextStyle(
                                                      color: (gen == 1)
                                                          ? Color(0xff333389)
                                                          : Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Color(0xfffeaeaf3),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      height: 1.h,
                                    ),

                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround
                                        ,
                                        children: [
                                          Text(
                                            "Size",
                                            style: TextStyle(fontSize: 2.h),
                                          ),
                                          // SizedBox(width: 1.8.h),
                                          Text("Mumbai",
                                              style:
                                                  TextStyle(fontSize: 2.h)),
                                          // SizedBox(width: 1.8.h),
                                          Text("Tirpur",
                                              style:
                                                  TextStyle(fontSize: 2.h)),
                                          // SizedBox(width: 1.8.h),
                                          Text("Total",
                                              style:
                                                  TextStyle(fontSize: 2.h)),
                                        ],
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "S ",
                                              style: TextStyle(
                                                  fontSize: 2.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(width: 5.w),
                                            Column(
                                                
                                              children: [
                                                Text('432', style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.bold),),
                                                SizedBox(height:1.h),
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
                                                    child: Text("",
                                                        style: TextStyle(
                                                            fontSize: 2.h,
                                                            color:
                                                                Color(0xfff333389),
                                                            fontWeight:
                                                                FontWeight.bold))),
                                              ],
                                            ),
                                            // SizedBox(width: 12.w),
                                            Column(
                                                
                                              children: [
                                                Text('432', style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.bold),),
                                                SizedBox(height:1.h),
                                                
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
                                                    child: Text("",
                                                        style: TextStyle(
                                                            fontSize: 2.h,
                                                            color:
                                                                Color(0xfff333389),
                                                            fontWeight:
                                                                FontWeight.bold))),
                                              ],
                                            ),
                                            // SizedBox(width: 5.w),
                                            //
                                            Column(
                                              children: [
                                                Text("432", style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.bold),),
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
                                                    child: Text("",
                                                        style: TextStyle(
                                                            fontSize: 2.h,
                                                            color:
                                                            Color(0xfff333389),
                                                            fontWeight:
                                                            FontWeight.bold))),
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
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "M",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(width: 5.w),
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
                                            // SizedBox(width: 12.w),
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
                                            // SizedBox(width: 5.w),
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "L",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(width: 3.h),
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
                                            // SizedBox(width: 12.w),
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
                                            // SizedBox(width: 5.w),
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "XL",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(width: 3.w),
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
                                            // SizedBox(width: 12.w),
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
                                            // SizedBox(width: 5.w),
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Available Qty",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(width: 5.w),
                                            Container(
                                              width: 20.w,
                                              child: Divider(
                                                  thickness: 2,
                                                  color: Color(0xfff333389)),
                                            ),
                                            // SizedBox(width: 5.w),
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
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Enter Quantity",
                                              style: TextStyle(
                                                  fontSize: 2.5.h,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(width: 5.w),
                                            // Container(
                                            //   width: 20.w,
                                            //   child: Divider(
                                            //       thickness: 2,
                                            //       color: Color(0xfff333389)),
                                            // ),
                                            // SizedBox(width: 5.w),
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
                                                        color: Colors
                                                            .grey.shade600),
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
                                                      fit: BoxFit.fill,
                                                      height: 40.h,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height:
                                                        MediaQuery.of(context)
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
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Image',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    2.h),
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

                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
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
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder: (context) => products_1()));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            minimumSize: Size(
                                                                40.w, 6.5.h),
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
                                                            minimumSize: Size(
                                                                40.w, 6.5.h),
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
                            : Container(
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
                                    height: 25.h,
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
                                        return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                btn = index;
                                              });
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration:
                                                  BoxDecoration(
                                                      shape: BoxShape
                                                          .circle,
                                                      color: tripur[
                                                      index]),
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
                                                    color: Colors
                                                        .white,
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
                                        onTap: () {
                                          setState(() {
                                            gen = 1;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(0.1.h),
                                          alignment: Alignment.center,
                                          width: 13.h,
                                          height: 5.5.h,
                                          decoration: BoxDecoration(
                                              color: (gen == 0)
                                                  ? Colors.white
                                                  : Color(0xfff333389),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              border: Border.all(
                                                  color:
                                                  Color(0xff333389))),
                                          child: Text(
                                            'Men',
                                            style: TextStyle(
                                                color: (gen == 0)
                                                    ? Color(0xff333389)
                                                    : Colors.white,
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
                                          setState(() {
                                            gen = 0;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(0.1.h),
                                          alignment: Alignment.center,
                                          width: 15.h,
                                          height: 5.5.h,
                                          decoration: BoxDecoration(
                                              color: (gen == 1)
                                                  ? Colors.white
                                                  : Color(0xfff333389),
                                              // color:_selectedColor,

                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              border: Border.all(
                                                  color:
                                                  Color(0xff333389))),
                                          child: Text(
                                            'Women',
                                            style: TextStyle(
                                                color: (gen == 1)
                                                    ? Color(0xff333389)
                                                    : Colors.white,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround
                                    ,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                      color: Colors
                                                          .grey.shade600),
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
                                                    fit: BoxFit.fill,
                                                    height: 40.h,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.9,
                                                  height:
                                                  MediaQuery.of(context)
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
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'Image',
                                                          style: TextStyle(
                                                              fontSize:
                                                              2.h),
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

                                                  width:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height:
                                                  MediaQuery.of(context)
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
                                                        .center,
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
                                                          minimumSize: Size(
                                                              40.w, 6.5.h),
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
                                                          'Catalog',
                                                          style: TextStyle(
                                                              fontSize: 2.h),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder: (context) => products_1()));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize: Size(
                                                              40.w, 6.5.h),
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
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),                              )
                      ],
                    ),
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
                          setState(() {
                            cart = 1;
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
                                  builder: (context) => summary()));
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
    ;
  }
}
