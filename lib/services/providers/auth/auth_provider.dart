import 'package:kampus_gratis/services/repository/auth/auth_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class AuthProvider {
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  // Future login(JSON body) async {
  //   var response = await _authRepository.login(body);
  //   return response;
  // }

  Future<JSON> register(JSON body) async {
    var response = await _authRepository.register(body);
    return response;
  }

  Future<JSON> loginGoogle() async {
    final response = await _authRepository.loginGoogle();
    return response;
  }
}
