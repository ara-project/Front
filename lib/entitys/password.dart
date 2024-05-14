class Resetpassword {
  String token;
  String password;
  String newPassword;
  String confirmNewPassword;

  Resetpassword(
      {required this.token,
      required this.password,
      required this.newPassword,
      required this.confirmNewPassword});
  factory Resetpassword.fromJson(Map<String, dynamic> json) {
    return Resetpassword(
        token: json['token'] ?? 0,
        password: json['password'] ?? 0,
        newPassword: json['newPassword'] ?? 0,
        confirmNewPassword: json['confirmNewPassword'] ?? 0);
  }
}
