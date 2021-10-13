import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChungNhanPage extends StatelessWidget{
  Future<String> login() async {
    var response = await http.get(
        Uri.parse('http://192.168.0.102:8000/api/v1/vaccins'));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["dataKey"];
    print(data[0]["name"]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chứng nhận tiêm chủng'),
      ),
      body: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.white,
    ),
    child: Row(
      children: <Widget>[
        Image.asset('assets/images/qr.png', height: 100,) ,
        SizedBox(height: 30,),
        Text('Chứng nhận tiêm chủng', style: TextStyle(fontWeight: FontWeight.bold, ))

    ],
    ),
      ),

    );
  }
}