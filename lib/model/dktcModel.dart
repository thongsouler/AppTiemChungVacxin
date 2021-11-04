import 'dart:convert';

class dktcModel {
  String nhomUuTien;
  String muiTiemThu;
  String status;
  String dvtc;
  // String createdAt;
  // String updatedAt;

  dktcModel(
      {
        this.nhomUuTien,
        this.muiTiemThu,
        this.status,
        this.dvtc,
        // this.createdAt,
        // this.updatedAt,
      });

  dktcModel.fromJson(Map<String, dynamic> json) {
    nhomUuTien = json['nhomUuTien'];
    muiTiemThu = json['muiTiemThu'];
    status = json['status'];
    dvtc = json['dvtc'];
    // createdAt = json['createdAt'];
    // updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nhomUuTien'] = this.nhomUuTien;
    data['muiTiemThu'] = this.muiTiemThu;
    data['status'] = this.status;
    data['dvtc'] = this.dvtc;
    // data['createdAt'] = this.createdAt;
    // data['updatedAt'] = this.updatedAt;
    return data;
  }
}

dktcModel dktcModelFromJson(String str) => dktcModel.fromJson(json.decode(str));


