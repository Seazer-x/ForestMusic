import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestUtil {
  static RequestUtil? _instance;

  static const String baseUrl = "https://2323-103-152-220-103.ap.ngrok.io";

  RequestUtil._internal() {
    _instance = this;
  }

  factory RequestUtil() => _instance ?? RequestUtil._internal();

  static Future<T> get<T>(String uri) async {
    final res = await http
        .get(Uri.parse(baseUrl + uri))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode == 200) {
      return jsonDecode(utf8.decode(res.bodyBytes));
    } else {
      return jsonDecode(utf8.decode(res.bodyBytes));
    }
  }

  static Future<T> post<T>(String uri, Object body) async {
    var headers = <String, String>{};
    headers["Content-Type"] = "application/json";
    body = utf8.encode(json.encode(body));
    try {
      final res = await http
          .post(Uri.parse(baseUrl + uri), body: body, headers: headers)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return jsonDecode('{"code":500,"msg":"连接超时,请重试"}');
      });
      if (res.statusCode == 200) {
        return jsonDecode(utf8.decode(res.bodyBytes));
      } else {
        return jsonDecode(utf8.decode(res.bodyBytes));
      }
    } on FormatException {
      return jsonDecode('{"code":500,"msg":"服务器掉线,请稍后重试"}');
    }
  }
}
