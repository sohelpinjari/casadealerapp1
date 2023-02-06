import 'package:casadealerapp/drawer.dart';
import 'package:casadealerapp/product_2.dart';
import 'package:flutter/material.dart';
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
  String? Price;

  products(this.image, this.Brand_Name, this.Street_Wear, this.Artist_Name,
      this.Price);
}

class _products_1State extends State<products_1> {
  List<products> images = [
    products("assets/product_1_img.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1_img3.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1_img4.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1_img5.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1img6.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1_img.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
    products("assets/product_1_img2.png", "Brand Name", "Street Wear",
        "Artist Name", "\₹125"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
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
                height: 14.h,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.h, left: 2.h),
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
            ),
            Positioned(
              top: 10.5.h,
              left: 2.h,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your full name";
                    }
                    return null;
                  },
                  // controller: _firstname,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(3.h),
                    hintText: 'Search by SKU/Brand',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color(0xfff333389),
                      size: 4.5.h,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfffFBFBFB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => product_2()));
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  height:70.h,
                  width: MediaQuery.of(context).size.width,

                  padding: EdgeInsets.all(15),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.0,
                        childAspectRatio: 6 / 13.3,
                        mainAxisSpacing: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              (images[index].image).toString(),
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.2,
                                top: MediaQuery.of(context).size.height * 0.007),
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.02,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Text(
                                images[index].Brand_Name.toString(),
                                style: TextStyle(
                                  fontSize: 1.3.h,
                                  color: Color(0xfff333389),
                                ),
                              ),
                            ),
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
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 0.8.h),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  images[index].Price.toString(),
                                  style: TextStyle(
                                    fontSize: 2.3.h,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xfff333389),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 9.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xfff333389),
                                  size: 2.5.h,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  color: Color(0xfffFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
