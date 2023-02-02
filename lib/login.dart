import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/login-2.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 2,
        ),
      ),
    ));
  }
}
