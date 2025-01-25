class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? photo;

  String get fullName {
    return '$firstName $lastName';
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    lastName = json['mobile'];
    lastName = json['photo'];
  }

  Map<String, dynamic> tojson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'photo': photo,
    };
  }
}
