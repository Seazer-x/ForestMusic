import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RequestUtil {
  static RequestUtil? _instance;

  static const String baseUrl = "https://4deb-103-181-164-85.ap.ngrok.io";

  RequestUtil._internal() {
    _instance = this;
  }

  factory RequestUtil() => _instance ?? RequestUtil._internal();

  static Future<T> get<T>(String uri) async {
    final res = await http.get(Uri.parse(baseUrl + uri));
    if (res.statusCode == 200) {
      return jsonDecode(utf8.decode(res.bodyBytes));
    } else {
      if (kDebugMode) {
        print(utf8.decode(res.bodyBytes));
      }
      return jsonDecode(utf8.decode(res.bodyBytes));
    }
  }

  static Future<T> post<T>(String uri, Object body) async {
    var headers = <String, String>{};
    headers["Content-Type"] = "application/json";
    body = utf8.encode(json.encode(body));
    final res =
        await http.post(Uri.parse(baseUrl + uri), body: body, headers: headers);
    if (res.statusCode == 200) {
      return jsonDecode(utf8.decode(res.bodyBytes));
    } else {
      return jsonDecode(utf8.decode(res.bodyBytes));
    }
  }
}
