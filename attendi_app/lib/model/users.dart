import 'package:flutter/material.dart';
class Users extends ChangeNotifier{
  final int? uSeq;
  String email;
  String password;
  final String? tel;
  String? joinDate;
  String? outDate = "";

  static String sEmail = '';
  static int uuSeq = 0;


  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  //  void setPasswordConfirm(String passwordConfirm) {
  //   this.passwordConfirm = passwordConfirm;
  //   notifyListeners();
  // }

  Users(
      {this.uSeq,
      required this.email,
      required this.password,
      this.tel,
      this.joinDate});

  Users.fromMap(Map<String, dynamic> res)
      : uSeq = res['uSeq'],
        email = res['email'],
        password = res['password'],
        tel = res['tel'],
        joinDate = res['joinDate'],
        outDate = res['outDate'];

  Users.fromMap1(Map<String, dynamic> res1)
      : uSeq = res1['uSeq'],
        email = res1['email'],
        password = res1['password'],
        tel = res1['tel'];

  Map<String, Object?> toMap() {
    return {'uSeq': uSeq, 'email': email, 'password': password, 'tel': tel, 'joinDate': joinDate, 'outDate': outDate};
  }
}
