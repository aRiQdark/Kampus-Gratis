import 'package:kampus_gratis/models/studiku/description_quiz_model.dart';
import 'package:kampus_gratis/models/studiku/quiz_model.dart';
import 'package:kampus_gratis/models/studiku/result_quiz_model.dart';
import 'package:kampus_gratis/models/studiku/review_quiz_model.dart';
import 'package:kampus_gratis/services/repository/studiku/quiz_repository.dart';

class QuizProvider {
  final QuizRepository _quizRepository;

  QuizProvider(this._quizRepository);
  Future<DescriptionQuizModel> getQuizDescById(String paramIdSession) async {
    var response = await _quizRepository.getQuizDescById(paramIdSession);

    DescriptionQuizModel result =
        DescriptionQuizModel.fromJson(response["data"]);

    return result;
  }

  Future<QuizModel> takeQuizById(String paramIdQuiz) async {
    var response = await _quizRepository.takeQuizById(paramIdQuiz);

    QuizModel result = QuizModel.fromJson(response["data"]);

    return result;
  }

  Future<ResultQuizModel> submitQuiz(Map<String, dynamic> paramAnswer) async {
    var response = await _quizRepository.submitQuiz(paramAnswer);

    ResultQuizModel result = ResultQuizModel.fromJson(response["data"]);

    return result;
  }

  Future<List<QuizReviewModel>> quizReview(String paramIdQuiz) async {
    var response = await _quizRepository.quizReview(paramIdQuiz);

    List<dynamic> getDataQuizReview = response["data"]["summary"];

    List<QuizReviewModel> data = [];

    for (var element in getDataQuizReview) {
      data.add(QuizReviewModel.fromJson(element));
    }

    return data;
  }
}
