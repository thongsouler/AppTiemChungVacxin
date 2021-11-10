import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiemchungvacxin/pages/DVTCScreen.dart';
import 'package:tiemchungvacxin/pages/dangkytiemchung.dart';
import 'package:tiemchungvacxin/pages/danhmucDVTC.dart';
import 'package:tiemchungvacxin/pages/danhmucvacxin.dart';
import 'package:tiemchungvacxin/pages/danhmucvacxin1.dart';
import 'dart:convert';
import 'pages/chungnhanpage.dart';
import 'pages/hosopage.dart';
import 'package:tiemchungvacxin/model/userModel.dart';



class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    String name = user.name;
    int CMND = user.cMND;


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.red ]
        )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/header.png')
                )
              ),
            ),
            SafeArea(

                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              child: Image.asset('assets/images/img.png'),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('$name \n $CMND  ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ))
                              ],
                            )

                          ],
                        ),
                      ),
                      Expanded(
                          child: GridView.count(
                            padding: EdgeInsets.only(top: 60),
                            crossAxisCount: 2,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 30,
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => HoSoPage()
                                    )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/hoso.png', height: 100,) ,
                                      SizedBox(height: 30,),
                                      Text('Hồ sơ tiêm chủng', style: TextStyle(fontWeight: FontWeight.bold, ))


                                    ],
                                  ),
                                ),
                              ),
                              InkWell(

                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => DangKyTiemChung(),
                                      )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),

                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/dk_vacxin.png', height: 100,) ,
                                      SizedBox(height: 30,),
                                      Text('Đăng ký tiêm chủng', style: TextStyle(fontWeight: FontWeight.bold, ))

                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => ChungNhanPage()
                                      )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/chungnhan.png', height: 100,) ,
                                      SizedBox(height: 30,),
                                      Text('Chứng nhận tiêm chủng', style: TextStyle(fontWeight: FontWeight.bold, ))

                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => ChungNhanPage()
                                      )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 10,),
                                      Image.asset('assets/images/lichtiem.png', height: 100,) ,
                                      SizedBox(height: 20,),
                                      Text('Lịch tiêm', style: TextStyle(fontWeight: FontWeight.bold, ))

                                    ],
                                  ),
                                ),
                              ),

                            ],


                          )
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) => VacxinScreen(),

                                        )
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 5,),
                                          Image.asset("assets/images/vacxin.png", height: 65,),
                                        ],


                                      )
                                     ),
                                  ),
                                    Center(child: Text("Vacxin",style: TextStyle(fontWeight: FontWeight.bold,),),),

                                  ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                                child: Column(
                                children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) => DVTCScreen(),

                                        )
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 5,),
                                          Image.asset("assets/images/hospital.png", height: 65,),
                                        ],


                                      )
                                  ),
                                ),
                                Center(child: Text("Đơn vị tiêm",style: TextStyle(fontWeight: FontWeight.bold,),),),

                              ],)
                            ),
                            SizedBox(width: 20,),
                            Expanded(child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) => DanhMucDVTC()

                                        )
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 10,),
                                          Image.asset("assets/images/news.png", height: 55,),
                                        ],


                                      )
                                  ),
                                ),
                                Center(child: Text("Tin tức",style: TextStyle(fontWeight: FontWeight.bold,),),),

                              ],)
                            ),
                            SizedBox(width: 20,),
                            Expanded(child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) => DanhMucVacxin(),

                                        )
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 5,),
                                          Image.asset("assets/images/setting.png", height: 65,),
                                        ],


                                      )
                                  ),
                                ),
                                Center(child: Text("Cài đặt",style: TextStyle(fontWeight: FontWeight.bold,),),),

                              ],)
                            ),

                          ],
                        ),
                      )
                    ],

                  ),
                )),

          ],
        ),

      ),
    );
  }

}

