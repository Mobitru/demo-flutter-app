import 'package:flutter_demo_app/consts/strings.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@injectable
class BioAuthRepository {
  final bool isSupported;
  final LocalAuthentication _auth;

  BioAuthRepository(this._auth, this.isSupported);

  Future<bool> authenticate() async {
    return await _auth.authenticate(
        localizedReason: loginBiometricTip,
        options: const AuthenticationOptions(biometricOnly: true));
  }

  @FactoryMethod(preResolve: true)
  static Future<BioAuthRepository> create() async {
    var auth = LocalAuthentication();
    return BioAuthRepository(auth, await auth.isDeviceSupported());
  }
}
