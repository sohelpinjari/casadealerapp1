import 'package:casadealerapp/screens/block_order.dart';
import 'package:casadealerapp/screens/cart_order.dart';
import 'package:casadealerapp/screens/getstarted.dart';
import 'package:casadealerapp/screens/login.dart';
import 'package:casadealerapp/screens/loginsuccess.dart';
import 'package:casadealerapp/screens/order_id.dart';
import 'package:casadealerapp/screens/product_2.dart';
import 'package:casadealerapp/screens/products_1.dart';
import 'package:casadealerapp/provider/productprovider.dart';

import 'package:casadealerapp/screens/summary.dart';
import 'package:casadealerapp/screens/your_block_order.dart';
import 'package:casadealerapp/screens/your_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'provider/login_authprovider.dart';
int? gen = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider (
          providers: [
          ChangeNotifierProvider(
              create: (context) => Authprovider()),
            ChangeNotifierProvider(
                create: (context) => Productprovider()),


          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: get_started(),
          ),
        );
      },
    );
  }
}
