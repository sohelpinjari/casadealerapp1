import 'package:casadealerapp/getstarted.dart';
import 'package:casadealerapp/products_1.dart';
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
      backgroundColor: Color(0xfffFFFFFF),

      body: Stack(children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/loginsuccess.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 2,
              ),
            ),
            SizedBox(height: 3.h,),

            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Congratulations!" , style: TextStyle(fontSize: 3.h),),
                  SizedBox(height: 2.h,),

                  Text("Your registration is pending approval"

                      ),
                  SizedBox(height: 1.h,),

                  Text( "you will be notified soon"),

                ],
              ),
            ),
            SizedBox(height: 4.h,),

            Container(

              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              // color: Color(0xfff333389),
              // padding:
              //     EdgeInsets.only(left: 35, right: 40, bottom: 10, top: 20),
              child: ElevatedButton(
                onPressed: () {



                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => products_1()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfff333389),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),

                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.6.h),
                      child: Text('Back to Login' , style: TextStyle(fontSize: 2.h),


                      ),
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

          ],
        ),




      ]),
    ));
  }
}
