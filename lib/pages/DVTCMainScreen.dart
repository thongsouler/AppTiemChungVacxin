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

class DVTCMainList extends StatelessWidget{
  final List<dvtcModel> dvtcData;
  Map <String, String> districtName = {"LB": "Quận Long Biên", "HM": "Quận Hoàng Mai", "TX": "Quận Thanh Xuân", "TH": "Quận Tây Hồ"};


  //constructor
  DVTCMainList({Key key, this.dvtcData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width * 0.6;
    print(dvtcData[1].districtName);

    int LB_DVTC = dvtcData
        .where((e) => e.districtName == districtName["LB"])
        .length;
    int HM_DVTC = dvtcData
        .where((e) => e.districtName == districtName["HM"])
        .length;
    int TX_DVTC = dvtcData
        .where((e) => e.districtName == districtName["TX"])
        .length;
    int TH_DVTC = dvtcData
        .where((e) => e.districtName == districtName["TH"])
        .length;

    Map <String, int> countDVTC = {
      "LB": LB_DVTC,
      "HM": HM_DVTC,
      "TX": TX_DVTC,
      "TH": TH_DVTC
    };


    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        InkWell(
          onTap: (){

          },
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
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
                          '${districtName["LB"]}', style: TextStyle(fontSize: 19,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: width,
                          child: Text(
                            'Số đơn vị tiêm chủng: ${countDVTC["LB"]}',
                            style: TextStyle(fontSize: 12, color: Colors
                                .lightBlue),
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
        ),
        Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
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
                        '${districtName["TH"]}', style: TextStyle(fontSize: 19,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: width,
                        child: Text(
                          'Số đơn vị tiêm chủng: ${countDVTC["TH"]}',
                          style: TextStyle(fontSize: 12, color: Colors
                              .lightBlue),
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
        Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
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
                        '${districtName["TX"]}', style: TextStyle(fontSize: 19,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: width,
                        child: Text(
                          'Số đơn vị tiêm chủng: ${countDVTC["TX"]}',
                          style: TextStyle(fontSize: 12, color: Colors
                              .lightBlue),
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
        Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
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
                        '${districtName["HM"]}', style: TextStyle(fontSize: 19,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: width,
                        child: Text(
                          'Số đơn vị tiêm chủng: ${countDVTC["HM"]}',
                          style: TextStyle(fontSize: 12, color: Colors
                              .lightBlue),
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

      ],

    );
  }
}
// This is a block of Model Dialog

class DVTCMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DVTCMainScreenState();
  }
}
class _DVTCMainScreenState extends State<DVTCMainScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh muc vacxin'),
      ),
      body: FutureBuilder(
        future: fetchDVTCs(http.Client()),
        builder: (context, snapshot){
          if (snapshot.hasError){
            print(snapshot.error);
          }
          return snapshot.hasData ? DVTCMainList(dvtcData: snapshot.data): Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
  Future<List<dvtcModel>> fetchDVTCs(http.Client client) async {
    print('dang test');
    final response = await client.get(Uri.parse(URL_DVTC));
    print('dang test');
    print(response);
    if (response.statusCode == 200) {
      print('dang test');
      Map<String, dynamic> mapResponse = json.decode(response.body);
      print('dang test');
      if (true) {
        print('dang test');
        final dvtcs = mapResponse["dvtcs"].cast<Map<String, dynamic>>();
        print('dang test');
        final listOfDVTC = await dvtcs.map<dvtcModel>((json) {
          return dvtcModel.fromJson(json);
        }).toList();
        print(response);
        return listOfDVTC;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load data!!');
    }
  }
}
