import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tiemchungvacxin/model/dvtcModel.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';
import 'package:http/http.dart' as http;


class DVTCNetworkRequest {
  static const String url = 'http://10.0.2.2:3000/api/dvtc';
  static List<dvtcModel>parseDVTC(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    print(list);
    List<dvtcModel> dvtc = list.map((e) => dvtcModel.fromJson(e)).toList();
    return dvtc;


  }
  static Future<List<dvtcModel>> fetchDVTC({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseDVTC, response.body);
    } else if(response.statusCode == 404){
      throw Exception('Not found');
    }else {
      throw Exception('Cant get');
    }
  }
}

