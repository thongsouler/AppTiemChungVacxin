

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiemchungvacxin/api/vacxinNetwork.dart';
import 'package:http/http.dart' as http;
import 'package:tiemchungvacxin/model/global.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';

String imageUrl = 'assets/images/vacxin.png';

class VacxinList extends StatelessWidget{
  final List<VacxinModel> vacxins;


  //constructor
  VacxinList({Key key, this.vacxins}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    // TODO: implement build
    return ListView.builder(
      padding: EdgeInsets.all(10),
                itemCount: vacxins.length,
                itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    showDialogFunc(context, vacxins[index].tenVaccin, vacxins[index].hangSanXuat,vacxins[index].quocGia,vacxins[index].khoangCachTiem, vacxins[index].doiTuongTiem);
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
                                  '${vacxins[index].tenVaccin}', style: TextStyle(fontSize: 25, color: Colors.deepOrange, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: width,
                                  child: Text(
                                    '${vacxins[index].hangSanXuat}', style: TextStyle(fontSize: 15, color: Colors.lightBlue),
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
//This is a block of Model Dialog
showDialogFunc(context, tenVaccin, hangSanXuat , quocGia, khoangCachTiem, doiTuongTiem) {
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
            width: MediaQuery.of(context).size.width * 0.7,
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
                Text(
                  '$tenVaccin',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
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
                      'Hãng sản xuất: $hangSanXuat'
                      + '\nQuốc gia: $quocGia'
                          + '\nĐối tượng tiêm: $doiTuongTiem'
                          + '\nKhoảng cách tiêm: $khoangCachTiem',
                      maxLines: 5,
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
class VacxinScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VacxinScreenState();
  }
}
class _VacxinScreenState extends State<VacxinScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh muc vacxin'),
      ),
      body: FutureBuilder(
        future: fetchVacxins(http.Client()),
        builder: (context, snapshot){
          if (snapshot.hasError){
            print(snapshot.error);
          }
          return snapshot.hasData ? VacxinList(vacxins: snapshot.data): Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
  Future<List<VacxinModel>> fetchVacxins(http.Client client) async {
    print('dang test');
    final response = await client.get(Uri.parse(URL_VACXIN));
    print('dang test');
    print(response);
    if (response.statusCode == 200) {
      print('dang test');
      Map<String, dynamic> mapResponse = json.decode(response.body);
      print('dang test');
      if (true) {
        print('dang test');
        final vacxins = mapResponse["vaccins"].cast<Map<String, dynamic>>();
        print('dang test');
        final listOfVacxins = await vacxins.map<VacxinModel>((json) {
          return VacxinModel.fromJson(json);
        }).toList();
        print(response);
        return listOfVacxins;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}