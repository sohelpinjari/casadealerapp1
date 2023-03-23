import 'dart:io';

import 'package:casadealerapp/CustomException.dart';
import 'package:casadealerapp/response.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class Productprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',
  };
  Future<http.Response> allcatogeryapi(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=all_category_display';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> selectcategorydisplay(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=category_wise_product';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> searchproduct(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=searching_products';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> view_product_order(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=view_order';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> product_orderDetail(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=order_details';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> product2_color(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=all_color_display';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> product2_image(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=single_product_display';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> product2_selectimage(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=color_select_display_img';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }


  Future<http.Response> product2_displaycolorselect(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=color_select_display_all_data';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> forgot(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=forgot_password';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> product2blockprovider(Map<String, dynamic> bodyData) async {
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php?action=block_produt_wise';
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }


}
