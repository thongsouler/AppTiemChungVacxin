import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiemchungvacxin/api/dvtcNetwork.dart';
import 'package:tiemchungvacxin/model/dvtcModel.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';
import 'package:tiemchungvacxin/api/vacxinNetwork.dart';


// Future<ProductDataModel> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('http://192.168.0.102:3000/api/vacs'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print(response.body);
//     return ProductDataModel.fromJson(jsonDecode(response.body));
//
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
String imageUrl = 'assets/images/hospital.png';

class DanhMucDVTC extends StatefulWidget{
  @override
  _DanhMucDVTCState createState() => _DanhMucDVTCState();
}

class _DanhMucDVTCState extends State<DanhMucDVTC> {
  List<dvtcModel> dvtcData = List();


  @override
  void initState() {
    super.initState();
    DVTCNetworkRequest.fetchDVTC().then((dataFromServer){
      setState(() {
        dvtcData = dataFromServer;
      });

    } );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Danh Mục Đơn vị Tiêm chủng"),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  )
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: dvtcData.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        showDialogFunc(context, dvtcData[index].name, dvtcData[index].address,dvtcData[index].wardName,dvtcData[index].provinceName, dvtcData[index].picFullname);
                      },
                      //Card which holds layout of listview item
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child:Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(imageUrl),
                              ),
                              flex: 1,
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Container(
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${dvtcData[index].name}', style: TextStyle(fontSize: 19, color: Colors.deepOrange, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: width,
                                      child: Text(
                                        '${dvtcData[index].wardName}', style: TextStyle(fontSize: 12, color: Colors.lightBlue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              flex: 6,
                            )
                          ],
                        ),
                      ),
                    );


                  }
              )
              )
            ],
          )
      ),
    );
  }
}
// This is a block of Model Dialog
showDialogFunc(context, name, address,wardName,provinceName, picFullname) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    imageUrl,
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(

                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Địa chỉ: $address $wardName $provinceName'
                          + '\nNgười quản lý: $picFullname',
                      maxLines: 6,
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
