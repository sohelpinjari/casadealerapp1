import 'package:casadealerapp/block_order.dart';
import 'package:casadealerapp/cart_order.dart';
import 'package:casadealerapp/getstarted.dart';
import 'package:casadealerapp/loginsuccess.dart';
import 'package:casadealerapp/order_id.dart';
import 'package:casadealerapp/product_2.dart';
import 'package:casadealerapp/products_1.dart';
import 'package:casadealerapp/summary.dart';
import 'package:casadealerapp/your_block_order.dart';
import 'package:casadealerapp/your_order.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        return MaterialApp(
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
        );
      },
    );
  }
}
