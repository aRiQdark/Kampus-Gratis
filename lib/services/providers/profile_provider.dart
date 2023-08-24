import 'package:kampus_gratis/models/profile_model.dart';
import 'package:kampus_gratis/services/repository/profile_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class ProfileProvider {
  final ProfileRepository _profileRepository;

  ProfileProvider(this._profileRepository);

  Future<KGUserModel?> getUser() async {
    var user = await _profileRepository.getUser();
    return KGUser.fromJson(user).data;
  }
  Future<KGUserModel?> updateUser(JSON body) async {
    var user = await _profileRepository.updateUser(body);
    return KGUser.fromJson(user).data;
  }
}
