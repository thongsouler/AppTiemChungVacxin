import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:tiemchungvacxin/model/dvtcModel.dart';
import 'package:tiemchungvacxin/model/dktcModel.dart';
import 'package:http/http.dart' as http;
import 'package:tiemchungvacxin/model/global.dart';


class DKTCNetworkRequest {
  static const String url = URL_DKTC;
  static List<dktcModel>parseDKTC(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    print(list);
    List<dktcModel> dktc = list.map((e) => dktcModel.fromJson(e)).toList();
    return dktc;


  }
  static Future<List<dktcModel>> fetchDKTC({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseDKTC, response.body);
    } else if(response.statusCode == 404){
      throw Exception('Not found');
    }else {
      throw Exception('Cant get');
    }

  }
  static Future<dktcModel> createDktc(String muiTiemThu) async{

    final response = await http.post(Uri.parse(url), body: {
      "muiTiemThu": muiTiemThu,
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return dktcModelFromJson(responseString);
    }else{
      return null;
    }
  }

}


