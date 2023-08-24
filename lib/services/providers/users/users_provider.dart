import 'package:kampus_gratis/models/users/users_model.dart';
import 'package:kampus_gratis/services/repository/users/users_repository.dart';

class UsersProvider {
  final UsersRepository _usersRepository;

  UsersProvider(this._usersRepository);

  Future<UsersModel> getUsers() async {
    var users = await _usersRepository.getUsers();
    return Users.fromJson(users).data;
  }
}
