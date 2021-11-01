

class hstcModel {
  int soMuiTiem;
  String ngayTiem;
  String tinhTrang;
  String createdAt;
  String updatedAt;

  hstcModel(
      {
        this.soMuiTiem,
        this.ngayTiem,
        this.tinhTrang,
        this.createdAt,
        this.updatedAt
      });

  factory hstcModel.fromJson(Map<String, dynamic> json) {
    return hstcModel(
        soMuiTiem : json['soMuiTiem'],
        ngayTiem : json['ngayTiem'],
        tinhTrang : json['tinhTrang'],
        createdAt : json['createdAt'],
        updatedAt : json['updatedAt'],

    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['soMuiTiem'] = this.soMuiTiem;
    data['ngayTiem'] = this.ngayTiem;
    data['tinhTrang'] = this.tinhTrang;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}