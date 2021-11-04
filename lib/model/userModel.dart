class userModel {
  String name;
  String email;
  int phoneNumber;
  String gioiTinh;
  int cMND;
  String address;
  String job;
  String wardName;
  String districtName;
  String provinceName;
  int iV;

  userModel(
      {
        this.name,
        this.email,
        this.phoneNumber,
        this.gioiTinh,
        this.cMND,
        this.address,
        this.job,
        this.wardName,
        this.districtName,
        this.provinceName,
        this.iV});

  userModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    gioiTinh = json['gioiTinh'];
    cMND = json['CMND'];
    address = json['Address'];
    job = json['job'];
    wardName = json['wardName'];
    districtName = json['districtName'];
    provinceName = json['provinceName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['gioiTinh'] = this.gioiTinh;
    data['CMND'] = this.cMND;
    data['Address'] = this.address;
    data['job'] = this.job;
    data['wardName'] = this.wardName;
    data['districtName'] = this.districtName;
    data['provinceName'] = this.provinceName;
    data['__v'] = this.iV;
    return data;
  }
}

userModel user = userModel(address: "Hà Nội", cMND: 123456789, wardName: "Phường Phương Liệt", districtName: "Quận Hoàng Mai", provinceName :"Thành phố Hà Nội", name: "Hồ Sỹ Thông", email : "hosythong@gmail.com", phoneNumber: 08688888);