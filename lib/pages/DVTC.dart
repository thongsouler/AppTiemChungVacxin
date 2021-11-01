import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiemchungvacxin/api/dvtcNetwork.dart';
import 'package:tiemchungvacxin/model/dvtcModel.dart';
import 'package:tiemchungvacxin/model/global.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';
import 'package:tiemchungvacxin/api/vacxinNetwork.dart';


String imageUrl = 'assets/images/hospital.png';

class DVTCList extends StatelessWidget{
  final List<dvtcModel> dvtcData;


  //constructor
  DVTCList({Key key, this.dvtcData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: dvtcData.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              showDialogFunc(context, dvtcData[index].name, dvtcData[index].address,dvtcData[index].wardName,dvtcData[index].districtName, dvtcData[index].provinceName, dvtcData[index].picFullname);
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
                              '${dvtcData[index].districtName}', style: TextStyle(fontSize: 12, color: Colors.lightBlue),
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
    );
  }
}
// This is a block of Model Dialog
showDialogFunc(context, name, address,wardName,districtName, provinceName, picFullname) {
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
                      'Địa chỉ: $address - $wardName - $districtName - $provinceName'
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
class DVTCScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DVTCScreenState();
  }
}
class _DVTCScreenState extends State<DVTCScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh muc vacxin'),
      ),
      body: FutureBuilder(
        future: fetchDVTCinDistrict(http.Client()),
        builder: (context, snapshot){
          if (snapshot.hasError){
            print(snapshot.error);
          }
          return snapshot.hasData ? DVTCList(dvtcData: snapshot.data): Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
  Future<List<dvtcModel>> fetchDVTCinDistrict(http.Client client) async {
    final response = await client.get(Uri.parse(URL_DVTC));
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (true) {
        final dvtcs = mapResponse["dvtcs"].cast<Map<String, dynamic>>();
        print('dang test');
        final listOfDVTC = await dvtcs.map<dvtcModel>((json) {
          return dvtcModel.fromJson(json);
        }).toList();
        return listOfDVTC;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
