// import 'dart:convert';
//
// import 'package:casadealerapp/CONST.dart';
// import 'package:casadealerapp/modal_class/view_block_single_product_class.dart';
// import 'package:casadealerapp/provider/productprovider.dart';
// import 'package:casadealerapp/screens/products_1.dart';
// import 'package:casadealerapp/screens/summary_b_edit.dart';
// import 'package:casadealerapp/screens/your_block_order.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:sizer/sizer.dart';
//
// class blockpage extends StatefulWidget {
//   String? pronamenevigatior;
//   String? coloridnevigator;
//   String? gender;
//    blockpage({Key? key,this.coloridnevigator,this.pronamenevigatior,this.gender}) : super(key: key);
//
//   @override
//   State<blockpage> createState() => _blockpageState();
// }
//
// class _blockpageState extends State<blockpage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   bool? check = false;
//   int sum = 0;
//   int sumindex = 0;
//   List<String> tabs = ["Blocked", "Cart"];
//   List<bool> checkbox = [
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false
//   ];
//
//   int cart = 0;
//   int i = 1000;
//   int i2 = 1000;
//   viewBlockProduct? blockView;
//
//
//   final controller = PageController(viewportFraction: 0.8, keepPage: true);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getdata();
//     print("hiii");
//   }
//   getdata()async{
//     await viewBlockSummary();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ,
//     );
//   }
//
// }
