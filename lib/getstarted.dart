import 'package:casadealerapp/login.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class get_started extends StatefulWidget {
  const get_started({Key? key}) : super(key: key);

  @override
  State<get_started> createState() => _get_startedState();
}

class _get_startedState extends State<get_started> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          Positioned(
              top: 85.h,
              left: 11.5.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 6.5.h,
                  width: 25.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xfff333389),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
