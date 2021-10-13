import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tiemchungvacxin/model/global.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';
import 'package:http/http.dart' as http;


class VacxinNetworkRequest {
  // static const String url = 'http://10.0.2.2:3000/api/vacs';
  // static List<VacxinModel>parseVacxin(String responseBody){
  //   var list = json.decode(responseBody) as List<dynamic>;
  //   List<VacxinModel> vacxins = list.map((e) => VacxinModel.fromJson(e)).toList();
  //   return vacxins;
  //
  //
  // }
  // static Future<List<VacxinModel>> fetchVacxins({int page = 1}) async {
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     return compute(parseVacxin, response.body);
  //   } else if(response.statusCode == 404){
  //     throw Exception('Not found');
  //   }else {
  //     throw Exception('Cant get');
  //   }
  // }

  Future<List<VacxinModel>> fetchVacxins(http.Client client) async {
    final response = await client.get(Uri.parse(URL_VACXIN));
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["result"] == "ok") {
        final vacxins = mapResponse["vaccins"].cast<Map<String, dynamic>>();
        final listOfVacxins = await vacxins.map<VacxinModel>((json) {
          return VacxinModel.fromJson(json);
        }).toList();
        return listOfVacxins;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
