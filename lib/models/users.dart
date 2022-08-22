class Users {
  int? iId;
  String? email;
  String? password;
  String? token;
  int? status;

  Users({this.iId, this.email, this.password, this.token, this.status});

  Users.fromJson(Map<String, dynamic> map) {
    iId = map['_id'];
    email = map['email'];
    password = map['password'];
    token = map['token'];
    status = map['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    data['status'] = this.status;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': this.iId,
      'email': this.email,
      'password': this.password,
      'token': this.token,
      'status': this.status,
    };
  }

  Users.fromMap(Map<String, dynamic> map){
    iId = map['_id'];
    email = map['email'];
    password = map['password'];
    token = map['token'];
    status = map['status'];
  }

}