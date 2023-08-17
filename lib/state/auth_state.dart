import 'package:flutter/material.dart';
import 'package:flutter_demo_app/model/user.dart';
import 'package:flutter_demo_app/repository/users_repository.dart';
import 'package:flutter_demo_app/repository/biometric_auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthState with ChangeNotifier {
  final UsersRepository _usersRepository;
  final BioAuthRepository _bioAuth;

  AuthState(this._usersRepository, this._bioAuth);

  bool get biometric => _bioAuth.isSupported;
  User? get currentUser => _usersRepository.currentUser;

  bool authenticated = false;
  bool error = false;

  void checkAuth({required String email, required String password}) {
    if (_usersRepository.checkCredentials(email, password)) {
      _updateAuth(auth: true, err: false);
    } else {
      _updateAuth(auth: false, err: true);
    }
  }

  void checkBioAuth() {
    _bioAuth.authenticate().then((value) {
      if (value) {
        _usersRepository.checkBioCredentials();
      }
      _updateAuth(auth: value, err: true);
    }, onError: (_) {
      _updateAuth(auth: false, err: true);
    });
  }

  void logout() {
    authenticated = false;
    error = false;
    _usersRepository.logout();
    notifyListeners();
  }

  void updateCurrentUser(User user) {
    _usersRepository.currentUser = user;
    notifyListeners();
  }

  void _updateAuth({required bool auth, required bool err}) {
    authenticated = auth;
    error = err;
    notifyListeners();
  }
}
