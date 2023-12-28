import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/model/user.dart';

@injectable
class UsersRepository {
  final User _userEmail;
  final User _userBio;
  final String _password;
  User? currentUser;
  String get correctUserEmail => _userEmail.email;
  String get correctUserPassword => _password;


  UsersRepository(this._userEmail, this._userBio, this._password);

  @FactoryMethod(preResolve: true)
  static Future<UsersRepository> create() async {
    final uEmail = await rootBundle.loadString(userEmailUri);
    final uBio = await rootBundle.loadString(userBioUri);
    final userJson = json.decode(uEmail);
    return UsersRepository(
        User.fromJson(userJson), User.fromJson(json.decode(uBio)), userJson['password'] as String);
  }

  bool checkCredentials(String email, String password) {
    if (email == _userEmail.email && password == _password) {
      currentUser = _userEmail;
      return true;
    }
    return false;
  }

  void checkBioCredentials() {
    currentUser = _userBio;
  }

  void logout() {
    currentUser = null;
  }
}
