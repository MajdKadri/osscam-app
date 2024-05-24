class SignupModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String? role;

  SignupModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.role});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = "USER";
    return data;
  }
}
