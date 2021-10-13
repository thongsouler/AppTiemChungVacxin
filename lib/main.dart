import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:tiemchungvacxin/loginscreen.dart';

import 'homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );

  }
}