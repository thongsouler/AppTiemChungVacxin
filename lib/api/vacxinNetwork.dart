import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';
import 'package:http/http.dart' as http;


class NetworkRequest {
  static const String url = 'http://192.168.0.102:3000/api/vacs';
  static List<ProductDataModel>parseVacxin(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<ProductDataModel> vacxins = list.map((e) => ProductDataModel.fromJson(e)).toList();
    return vacxins;


  }
  static Future<List<ProductDataModel>> fetchVacxins({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseVacxin, response.body);
    } else if(response.statusCode == 404){
      throw Exception('Not found');
    }else {
      throw Exception('Cant get');
    }
  }
}