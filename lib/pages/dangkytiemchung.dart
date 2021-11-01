import 'package:flutter/material.dart';
import 'package:tiemchungvacxin/pages/DVTC.dart';

class DangKyTiemChung extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DangKyTiemChungState();
  }
}

class DangKyTiemChungState extends State<DangKyTiemChung> {
  String _name;
  String _DOB;
  String _CMT;
  String _phoneNumber;
  String _doituong;

  List doiTuongUuTien = [
    "Người làm việc trong cs y tế",
    "Người tham gia chống dịch",
    "Lực lượng Công An",
    "Giáo viên,Sinh viên",

  ];
  String valueDoiTuongTiem ;

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

  Widget _buildDOB() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ngày sinh'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Bắt buộc có Ngày sinh';
        }
        return null;
      },
      onSaved: (String value) {
        _DOB = value;
      },
    );
  }

  Widget _buildCMND() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Số CMND/CCCD'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Bắt buộc có số CMT';
        }
        return null;
      },
      onSaved: (String value) {
        _CMT = value;
      },
    );
  }


  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Số điện thoại',

      ),
      keyboardType: TextInputType.phone,
      initialValue: '0868888666',
      validator: (String value) {
        if (value.isEmpty) {
          return 'Bắt buộc có SDT';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }
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
                _buildNameDVTC(),
                _buildCMND(),
                _buildPhoneNumber(),
                _buildDoiTuong(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_DOB);
                    print(_phoneNumber);
                    print(_CMT);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}