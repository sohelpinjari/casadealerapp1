// import 'dart:async';
//
// import 'package:casadealerapp/CONST.dart';
// import 'package:casadealerapp/screens/login.dart';
// import 'package:casadealerapp/screens/products_1.dart';
// import 'package:casadealerapp/shared_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// class get_started extends StatefulWidget {
//   const get_started({Key? key}) : super(key: key);
//
//   @override
//   State<get_started> createState() => _get_startedState();
// }
//
// class _get_startedState extends State<get_started> {
//   Timer? _timer;
//
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   getdata();
//   //   _timer = Timer.periodic( Duration(seconds: 4), (timer) {
//   //     userData ==null?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login(),))
//   //         :Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => products_1(),));
//   //     // Navigator.pushReplacement(context,
//   //     //         MaterialPageRoute(builder: (context) => login())):
//   //     // Navigator.pushReplacement(context,
//   //     //     MaterialPageRoute(builder: (context) => products_1()));
//   //   });
//   //
//   // }
//   // getdata()async{
//   //   userData=await SaveDataLocal.getDataFromLocal();
//   //   setState(() {
//   //     userData;
//   //   });
//   // }
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getdata();
//
//
//       // Navigator.pushReplacement(context,
//       //         MaterialPageRoute(builder: (context) => login())):
//       // Navigator.pushReplacement(context,
//       //     MaterialPageRoute(builder: (context) => products_1()));
//
//   }
//
//   getdata() async {
//     userData = await SaveDataLocal.getDataFromLocal();
//     setState(() {
//       userData;
//     });
//     Timer(
//         const Duration(seconds: 3),
//             () =>Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => login())));
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffffffff),
//         body: Stack(children: [
//           Column(
//             children: [
//               Container(
//                 height: 70.h,
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'assets/get_started2.png',
//                   fit: BoxFit.fill,
//                   // height: MediaQuery.of(context).size.height * 1,
//                   // width: MediaQuery.of(context).size.width * 2,
//                 ),
//               ),
//               SizedBox(height: 5.h),
//               Container(
//                 height: 12.h,
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'assets/get_started_logo.png',
//                   fit: BoxFit.contain,
//                   // height: MediaQuery.of(context).size.height * 1,
//                   // width: MediaQuery.of(context).size.width * 2,
//                 ),
//               ),
//             ],
//           ),
//
//           // Positioned(
//           //     top: 85.h,
//           //     left: 11.5.h,
//           //     child: GestureDetector(
//           //       onTap: () {
//           //         Navigator.push(
//           //           context,
//           //           MaterialPageRoute(builder: (context) => login()),
//           //         );
//           //       },
//           //       child: Container(
//           //         alignment: Alignment.center,
//           //         height: 6.5.h,
//           //         width: 25.h,
//           //         child: Row(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           crossAxisAlignment: CrossAxisAlignment.center,
//           //           children: [
//           //             TextButton(
//           //               onPressed: () {
//           //                 Navigator.push(
//           //                   context,
//           //                   MaterialPageRoute(builder: (context) => login()),
//           //                 );
//           //               },
//           //               child: Text(
//           //                 'Get Started',
//           //                 style: TextStyle(color: Colors.white),
//           //               ),
//           //             ),
//           //             Icon(
//           //               Icons.arrow_forward,
//           //               color: Colors.white,
//           //               size: 24.0,
//           //               semanticLabel:
//           //                   'Text to announce in accessibility modes',
//           //             ),
//           //           ],
//           //         ),
//           //         decoration: BoxDecoration(
//           //           color: Color(0xfff333389),
//           //           borderRadius: BorderRadius.all(
//           //             Radius.circular(15),
//           //           ),
//           //         ),
//           //       ),
//           //     )),
//
//           // Positioned(
//           //   top: 85.h,
//           //   left: 11.h,
//           //   child: Container(
//           //     width: MediaQuery.of(context).size.width * 0.5,
//           //     height: MediaQuery.of(context).size.height * 0.07,
//           //     // color: Color(0xfff333389),
//           //     // padding:
//           //     //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
//           //     child: ElevatedButton(
//           //       onPressed: () {
//           //         // Navigator.push(context,
//           //         //     MaterialPageRoute(builder: (context) => login()));
//           //       },
//           //       child: Row(
//           //         crossAxisAlignment: CrossAxisAlignment.center,
//           //         mainAxisAlignment: MainAxisAlignment.center,
//           //         children: [
//           //           Text(
//           //             'Get Started',
//           //             style: TextStyle(fontSize: 2.h),
//           //           ),
//           //           SizedBox(width: 4.w,),
//           //           Icon(
//           //             Icons.arrow_forward,
//           //             color: Colors.white,
//           //             size: 24.0,
//           //             semanticLabel: 'Text to announce in accessibility modes',
//           //           ),
//           //         ],
//           //       ),
//           //       style: ElevatedButton.styleFrom(
//           //         backgroundColor: Color(0xfff333389),
//           //         shape: RoundedRectangleBorder(
//           //           borderRadius: BorderRadius.circular(15),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ]),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:casadealerapp/CONST.dart';
import 'package:casadealerapp/screens/login.dart';
import 'package:casadealerapp/screens/products_1.dart';
import 'package:casadealerapp/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class get_started extends StatefulWidget {
  const get_started({Key? key}) : super(key: key);

  @override
  State<get_started> createState() => _get_startedState();
}

class _get_startedState extends State<get_started> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      userData == null
          ? Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => login(),
            ))
          : Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => products_1(),
            ));
      // Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => login())):
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => products_1()));
    });
  }

  getdata() async {
    userData = await SaveDataLocal.getDataFromLocal();
    setState(() {
      userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Stack(children: [
          Column(
            children: [
              Container(
                height: 70.h,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/get_started2.png',
                  fit: BoxFit.fill,
                  // height: MediaQuery.of(context).size.height * 1,
                  // width: MediaQuery.of(context).size.width * 2,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 12.h,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/get_started_logo.png',
                  fit: BoxFit.contain,
                  // height: MediaQuery.of(context).size.height * 1,
                  // width: MediaQuery.of(context).size.width * 2,
                ),
              ),
            ],
          ),

          // Positioned(
          //     top: 85.h,
          //     left: 11.5.h,
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => login()),
          //         );
          //       },
          //       child: Container(
          //         alignment: Alignment.center,
          //         height: 6.5.h,
          //         width: 25.h,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(builder: (context) => login()),
          //                 );
          //               },
          //               child: Text(
          //                 'Get Started',
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             ),
          //             Icon(
          //               Icons.arrow_forward,
          //               color: Colors.white,
          //               size: 24.0,
          //               semanticLabel:
          //                   'Text to announce in accessibility modes',
          //             ),
          //           ],
          //         ),
          //         decoration: BoxDecoration(
          //           color: Color(0xfff333389),
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(15),
          //           ),
          //         ),
          //       ),
          //     )),

          // Positioned(
          //   top: 85.h,
          //   left: 11.h,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width * 0.5,
          //     height: MediaQuery.of(context).size.height * 0.07,
          //     // color: Color(0xfff333389),
          //     // padding:
          //     //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
          //     child: ElevatedButton(
          //       onPressed: () {
          //         // Navigator.push(context,
          //         //     MaterialPageRoute(builder: (context) => login()));
          //       },
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             'Get Started',
          //             style: TextStyle(fontSize: 2.h),
          //           ),
          //           SizedBox(width: 4.w,),
          //           Icon(
          //             Icons.arrow_forward,
          //             color: Colors.white,
          //             size: 24.0,
          //             semanticLabel: 'Text to announce in accessibility modes',
          //           ),
          //         ],
          //       ),
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Color(0xfff333389),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
