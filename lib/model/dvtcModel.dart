class dvtcModel {
  String name;
  String address;
  String wardName;
  String districtName;
  String provinceName;
  String picFullname;

  dvtcModel(
      {
        this.name,
        this.address,
        this.wardName,
        this.districtName,
        this.provinceName,
        this.picFullname,
        });

  // dvtcModel.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   address = json['address'];
  //   wardName = json['wardName'];
  //   districtName = json['districtName'];
  //   provinceName = json['provinceName'];
  //   picFullname = json['picFullname'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['wardName'] = this.wardName;
    data['districtName'] = this.districtName;
    data['provinceName'] = this.provinceName;
    data['picFullname'] = this.picFullname;
    return data;
  }
  //This is static method
  factory dvtcModel.fromJson(Map<String, dynamic> json) {
    return dvtcModel(
        name : json['name'],
        address : json['address'],
        wardName : json['wardName'],
        districtName : json['districtName'],
        provinceName : json['provinceName'],
        picFullname : json['picFullname'],
    );
  }
}