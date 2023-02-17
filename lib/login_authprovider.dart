import 'dart:io';

import 'package:casadealerapp/response.dart';

import 'package:http/http.dart' as http;

class AuthProviders {
  Future<http.Response> loginApi(bodyData) async {
    Map<String, String> headers = {
      'Authorization': 'hXuRUGsEGuhGf6KG',
    };
    const url =
        'https://distributor-app.fableadtechnolabs.com/admin/api/ajax.php';
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
