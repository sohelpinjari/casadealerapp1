import 'package:casadealerapp/drawer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class products_1 extends StatefulWidget {
  const products_1({Key? key}) : super(key: key);
  static const appTitle = 'Drawer Demo';

  @override
  State<products_1> createState() => _products_1State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _products_1State extends State<products_1> {
  List<String> images = [
    "assets/pexels-lumn-167699.jpg",
    "assets/pexels-sam-kolder-2387873.jpg",
    "assets/pexels-roberto-nickson-2559941.jpg",
    "assets/pexels-rodrigo-souza-2531709.jpg",
    "assets/pexels-sean-valentine-3592627.jpg",
    "assets/pexels-taha-samet-arslan-13534714.jpg",
    "assets/pexels-tima-miroshnichenko-6322806.jpg",
    "assets/pexels-aarti-vijay-2693529.jpg"
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
              padding: EdgeInsets.all(15),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0),
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                  );
                },
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
