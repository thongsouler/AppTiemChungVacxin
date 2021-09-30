
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'country_summary.dart';
import 'country.dart';
import 'country_statistic.dart';

class CovidService{

  Future<List<CountrySummaryModel>> getCountrySummary() async{
    final data = await http.Client().get("https://api.covid19api.com/total/dayone/country/vietnam");

    if(data.statusCode != 200)
      throw Exception();

    List<CountrySummaryModel> summaryList = (json.decode(data.body) as List).map((item) => new CountrySummaryModel.fromJson(item)).toList();
    return summaryList;
  }


}