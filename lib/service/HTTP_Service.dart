import 'dart:convert';

import 'package:flutter_advanced/model/api_model.dart';
import 'package:http/http.dart';

import '../model/post_model.dart';
import 'log_service.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  //static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

/* Http Apis*/

  // static String API_LIST = "/api/v1/employees";
  // static String API_CREATE = "/api/v1/create";
  // static String API_UPDATE = "/api/v1/update/21"; //{id}
  // static String API_DELETE = "/api/v1/delete/2"; //{id}

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

/* Http Requests*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(APISERVICE post) {
    Map<String, String> params = Map();
    params.addAll({
      'employee_name': post.employee_name!,
      'employee_salary': post.employee_salary!,
      'employee_age': post.employee_age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(APISERVICE post) {
    Map<String, String> params = Map();
    params.addAll({
      'id': post.id.toString(),
      'employee_name': post.employee_name!,
      'employee_salary': post.employee_salary!,
      'employee_age': post.employee_age.toString(),
    });
    LogService.w(params.toString());
    return params;
  }

  /* Http Parsing */

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
