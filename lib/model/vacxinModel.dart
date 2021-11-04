class VacxinModel {
  String tenVaccin;
  String hangSanXuat;
  String quocGia;
  String loaiVaccin;
  String doiTuongTiem;
  // int soMuiTiem;
  // int khoangCachTiem;

  VacxinModel(
      {this.tenVaccin,
        this.hangSanXuat,
        this.quocGia,
        this.loaiVaccin,
        this.doiTuongTiem,
        // this.soMuiTiem,
        // this.khoangCachTiem
      });

  // VacxinModel.fromJson(Map<String, dynamic> json) {
  //   tenVaccin = json['tenVaccin'];
  //   hangSanXuat = json['hangSanXuat'];
  //   quocGia = json['quocGia'];
  //   loaiVaccin = json['loaiVaccin'];
  //   doiTuongTiem = json['doiTuongTiem'];
  //   soMuiTiem = json['soMuiTiem'];
  //   khoangCachTiem = json['khoangCachTiem'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenVaccin'] = this.tenVaccin;
    data['hangSanXuat'] = this.hangSanXuat;
    data['quocGia'] = this.quocGia;
    data['loaiVaccin'] = this.loaiVaccin;
    data['doiTuongTiem'] = this.doiTuongTiem;
    // data['soMuiTiem'] = this.soMuiTiem;
    // data['khoangCachTiem'] = this.khoangCachTiem;
    return data;
  }
  // Chuyển đổi đối tượng Map thành đối tượng VacxinModel
  //This is static method
  factory VacxinModel.fromJson(Map<String, dynamic> json) {
    return VacxinModel(
        tenVaccin : json['tenVaccin'],
        hangSanXuat : json['hangSanXuat'],
        quocGia : json['quocGia'],
        loaiVaccin : json['loaiVaccin'],
        doiTuongTiem : json['doiTuongTiem'],
        // soMuiTiem : json['soMuiTiem'],
        // khoangCachTiem : json['khoangCachTiem'],
    );
  }
}