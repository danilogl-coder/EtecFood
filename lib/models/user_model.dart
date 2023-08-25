class UserModel {
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.phoneNumber,
      this.cpf,
      this.photograph});

  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? cpf;
  String? photograph;
}
