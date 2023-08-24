import 'package:kampus_gratis/models/studiku/session_model.dart';
import 'package:kampus_gratis/services/repository/studiku/session_repository.dart';

class SessionProvider {
  final SessionRepository _sessionRepository;

  SessionProvider(this._sessionRepository);

  Future<List<SessionModel>?> getAllSessionById(String paramIdSession) async {
    var response = await _sessionRepository.getAllSessionById(paramIdSession);

    List<dynamic> getSessionById = response["data"];

    List<SessionModel> result = [];

    for (var element in getSessionById) {
      result.add(SessionModel.fromJson(element));
    }

    return result;
  }
}
