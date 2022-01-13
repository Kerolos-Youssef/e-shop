class RegisterModel {
  late bool status;
  dynamic message;
  late RegisterData userData;
  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = RegisterData.fromJson(json['data']);
  }
}

class RegisterData {
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;
  dynamic id;
  RegisterData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
    id = json['id'];
  }
}
