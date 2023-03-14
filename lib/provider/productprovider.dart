


import 'dart:io';

import 'package:casadealerapp/CustomException.dart';
import 'package:casadealerapp/response.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class Productprovider with ChangeNotifier{
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




}