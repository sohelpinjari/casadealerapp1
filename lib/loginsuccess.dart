import 'package:casadealerapp/getstarted.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class loginsuccess extends StatefulWidget {
  const loginsuccess({Key? key}) : super(key: key);

  @override
  State<loginsuccess> createState() => _loginsuccessState();
}

class _loginsuccessState extends State<loginsuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/final_getstart.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 2,
          ),
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

        Positioned(
          top: 85.h,
          left: 2.h,
          child: Container(

            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.08,
            // color: Color(0xfff333389),
            // padding:
            //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
            child: ElevatedButton(
              onPressed: () {



                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => get_started()));
              },
              child: Row(
                children: [
                  Text('Back to Login' , style: TextStyle(fontSize: 2.h),

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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff333389),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),

                ),
              ),
            ),
          ),
        ),

      ]),
    ));
  }
}
