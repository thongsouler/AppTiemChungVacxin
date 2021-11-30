import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tiemchungvacxin/model/dktcModel.dart';
import 'package:tiemchungvacxin/model/global.dart';
import 'package:tiemchungvacxin/model/vacxinModel.dart';
import 'package:tiemchungvacxin/pages/DVTC.dart';
import 'package:http/http.dart' as http;

import 'danhmucvacxin.dart';


class DangKyTiemChung extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DangKyTiemChungState();
  }
}

class DangKyTiemChungState extends State<DangKyTiemChung> {
  String muiTiemThu;
  dktcModel _model;



  List doiTuongUuTien = [
    "1. Người làm việc trong cs y tế",
    "2. Người tham gia chống dịch",
    "3. Giáo viên,Sinh viên ",
    "4. Không có",

  ];
  List buoiTiem = [
    "Buổi sáng",
    "Buổi chiều"
  ];
  List muiTiem = [
    "Mũi 1",
    "Mũi 2",
    "Mũi 3"
  ];
  String valueDoiTuongTiem ;
  String valuebuoiTiem;
  String valuemuiTiem;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameDVTC() {
    return Row(
      children: <Widget>[
        Text("ĐVTC"),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Expanded(
              child: DropdownButton(
                hint: Text('Trạm y tế Phường Thượng Thanh'),
                value: valueDoiTuongTiem,
                onChanged: (newValue){
                  setState(() {
                    valueDoiTuongTiem = "Trạm y tế Phường Việt Hưng";
                  });
                },
                // items: doiTuongUuTien.map((value){
                //   return DropdownMenuItem(
                //       value: value,
                //       child: Text(value)
                //   );
                //
                // }).toList(),

              ),
            ),
          ),
        ),
      ],

    );
  }
  Widget _buildmuiTiem() {
    return Row(
      children: <Widget>[
        Text("Mũi tiêm"),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Expanded(
              child: DropdownButton(
                value: valuemuiTiem,
                onChanged: (newValue){
                  setState(() {
                    valuemuiTiem = newValue;
                  });
                },

                items: muiTiem.map((value){
                  return DropdownMenuItem(
                      value: value,
                      child: Text(value)
                  );

                }).toList(),

              ),
            ),
          ),
        ),
      ],

    );
  }
  Widget _buildbuoiTiem() {
    return Row(
      children: <Widget>[
        Text("Buổi tiêm"),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Expanded(
              child: DropdownButton(
                value: valuebuoiTiem,
                onChanged: (newValue){
                  setState(() {
                    valuebuoiTiem = newValue;
                  });
                },

                items: buoiTiem.map((value){
                  return DropdownMenuItem(
                      value: value,
                      child: Text(value)
                  );

                }).toList(),

              ),
            ),
          ),
        ),
      ],

    );
  }

  Widget _buildName() {
    return Container(
      child: Text("", style: TextStyle(fontSize: 22, color: Colors.deepPurple),),
    );
  }
  // Widget _buildCMND() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Số CMND/CCCD'),
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Bắt buộc có số CMT';
  //       }
  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _CMT = value;
  //     },
  //   );
  // }



  Widget _buildDoiTuong() {
    return Row(
      children: <Widget>[
        Text("Đối tượng"),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Expanded(
              child: DropdownButton(
                hint: Text('Đối tượng ưu tiên'),
                value: valueDoiTuongTiem,
                onChanged: (newValue){
                  setState(() {
                    valueDoiTuongTiem = newValue;
                  });
                },
                items: doiTuongUuTien.map((value){
                  return DropdownMenuItem(
                      value: value,
                      child: Text(value)
                  );

                }).toList(),

              ),
            ),
          ),
        ),
      ],

    );
  }
  Widget _buildDVTC() {
    return Row(
      children: <Widget>[
        Text("Đơn vị tiêm chủng"),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Expanded(
              child: DropdownButton(
                hint: Text('Đơn vị tiêm chủng'),
                value: valueDoiTuongTiem,
                onChanged: (newValue){
                  setState(() {
                    valueDoiTuongTiem = newValue;
                  });
                },
                items: doiTuongUuTien.map((value){
                  return DropdownMenuItem(
                      value: value,
                      child: Text(value)
                  );

                }).toList(),

              ),
            ),
          ),
        ),
      ],

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đăng ký tiêm chủng")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildNameDVTC(),
                _buildmuiTiem(),
                _buildbuoiTiem(),
                _buildDoiTuong(),
                SizedBox(height: 100),
                RaisedButton(
                    color: Colors.green,
                    elevation: 4,
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: (){}),
                RaisedButton(
                    color: Colors.redAccent,
                    elevation: 4,
                    child: Text(
                      'Lịch sử',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => DanhMucVacxin(),

                          )
                      );
                    })




              ],
            ),
          ),
        ),
      ),
    );
  }


}

