import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class QuizRepository {
  final ApiService _apiService;

  QuizRepository(this._apiService);

  Future<JSON> getQuizDescById(String paramIdSession) async {
    var response = await _apiService.get(
      endpoint: '/quiz/desc/session/$paramIdSession',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> takeQuizById(String paramIdQuiz) async {
    var response = await _apiService.post(
      endpoint: '/quiz/take/$paramIdQuiz',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> submitQuiz(Map<String, dynamic> paramAnswer) async {
    var response = await _apiService.post(
      endpoint: '/quiz/submit',
      requiresAuthToken: true,
      body: paramAnswer,
    );

    return response;
  }

  Future<JSON> quizReview(String paramIdQuiz) async {
    var response = await _apiService.get(
      endpoint: '/quiz/review/$paramIdQuiz',
      requiresAuthToken: true,
    );

    return response;
  }
}
