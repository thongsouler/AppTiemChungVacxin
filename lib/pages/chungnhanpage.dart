import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChungNhanPage extends StatelessWidget{
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