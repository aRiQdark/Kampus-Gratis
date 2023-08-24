// ignore_for_file: unnecessary_cast

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/studiku/description_quiz_model.dart';
import 'package:kampus_gratis/models/studiku/quiz_model.dart';
import 'package:kampus_gratis/models/studiku/result_quiz_model.dart';
import 'package:kampus_gratis/models/studiku/review_quiz_model.dart';
import 'package:kampus_gratis/services/providers/studiku/quiz_provider.dart';

class QuizController extends GetxController with StateMixin {
  final QuizProvider _quizProvider;
  QuizController(this._quizProvider);

  final Rx<DescriptionQuizModel?> dataDescriptionQuiz =
      (null as DescriptionQuizModel?).obs;

  final resultQuiz = ResultQuizModel(
    score: 90,
    status: 'Lulus',
    dateSubmitted: "",
    correctAnswers: 10,
    durationTaken: 300,
    numberOfQuestions: 10,
  );

  final Rx<ResultQuizModel?> dataResultQuiz = (null as ResultQuizModel?).obs;

  final Rx<QuizModel?> dataQuiz = (null as QuizModel?).obs;
  RxBool isLoading = false.obs;
  RxBool maxAttempts = false.obs;
  ScrollController scrollMain = ScrollController();

  // timerResultQuiz

  //Variable Quiz
  RxInt indexAnswerNow = 0.obs;
  RxInt startCountDown = 0.obs;
  RxInt lastCountDown = 0.obs;
  RxList isAnswer = [].obs;
  RxList userAnswer = [].obs;
  RxList<QuizReviewModel> dataQuizReview = <QuizReviewModel>[].obs;
  RxList alphabet = ["A", "B", "C", "D", "E", "F"].obs;

  late Timer _timer;

  late AnimationController animController;

  @override
  void onInit() {
    super.onInit();
    getQuizDescById(Get.arguments[0]);
  }

  // method Quiz
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        // ignore: unrelated_type_equality_checks
        if (startCountDown == 0) {
          _timer.cancel();

          if (lastCountDown.value == 0) {
            submitAnswer();
            Get.toNamed(
              '/studiku/quiz/result',
              arguments: [
                Get.arguments[0],
                Get.arguments[1],
              ],
            );
          }
        } else {
          startCountDown--;
          lastCountDown.value = startCountDown.value;
        }
      },
    );
  }

  changeStartCountDown() {
    if (startCountDown.value != 0) {
      startCountDown.value = 0;
    } else {
      startCountDown.value = lastCountDown.value;
      startTimer();
    }
  }

  String formatedTime(int seconds) {
    if (seconds != 0) {
      int hours = (seconds / 3600).truncate();
      seconds = (seconds % 3600).truncate();
      int minutes = (seconds / 60).truncate();

      String hoursStr = (hours).toString().padLeft(2, '0');
      String minutesStr = (minutes).toString().padLeft(2, '0');
      String secondsStr = (seconds % 60).toString().padLeft(2, '0');

      if (hours == 0) {
        return "$minutesStr:$secondsStr";
      }
      return "$hoursStr:$minutesStr:$secondsStr";
    } else {
      return "";
    }
  }

  int formatedHoursToSeconds(int hours) {
    int minutes = hours * 60;
    int seconds = minutes * 60;
    return seconds;
  }

  changeIndexAnswerNow(int paramIndexAnswer) {
    indexAnswerNow.value = paramIndexAnswer;
  }

  getQuizDescById(String paramIdSession) async {
    try {
      isLoading.value = true;
      DescriptionQuizModel? getDataDescriptionQuiz =
          await _quizProvider.getQuizDescById(paramIdSession);
      dataDescriptionQuiz.value = getDataDescriptionQuiz;

      if (dataDescriptionQuiz.value?.summary != null) {
        if (dataDescriptionQuiz.value!.summary!.length > 3) {
          maxAttempts.value = true;
        } else {
          maxAttempts.value = false;
        }
      }
      isLoading.value = false;
    } catch (e) {
      if (e.toString().contains("no quiz found")) {
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 25,
          backgroundColor: Colors.white,
          title: "Maaf",
          titleStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          middleText: 'Quiz Tidak Tersedia',
          middleTextStyle: const TextStyle(color: Colors.black),
        );
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.back();
            Get.back();
          },
        );
      }
    }
  }

  takeQuizByIdQuiz(String paramIdQuiz) async {
    try {
      isLoading.value = true;
      indexAnswerNow.value = 0;
      QuizModel getDataQuiz = await _quizProvider.takeQuizById(paramIdQuiz);
      dataQuiz.value = getDataQuiz;

      List dataIsAnswer = [];
      List dataUserAnswer = [];

      for (int i = 0; i < dataQuiz.value!.quiz.length; i++) {
        dataIsAnswer.insert(i, false);
        dataUserAnswer.insert(i, "kosong");
      }
      var dt = DateTime.now();

      String deadline = dataQuiz.value!.deadline.toString();

      DateTime dateTime = DateTime.parse(deadline);
      dateTime =
          dateTime.add(DateTime.parse(deadline).timeZoneOffset).toLocal();

      Duration dif = dateTime.difference(dt);

      if (dif.inHours < 0) {
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 25,
          backgroundColor: Colors.white,
          title: "Maaf",
          titleStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          middleText: 'Anda sudah tidak bisa mengerjakan Quiz',
          middleTextStyle: const TextStyle(color: Colors.black),
        );
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.back();
            Get.back();
            Get.back();
          },
        );
      } else {
        isAnswer.value = dataIsAnswer;
        userAnswer.value = dataUserAnswer;
        startCountDown.value = dif.inSeconds;
        isLoading.value = false;
        startTimer();
      }
    } catch (e) {
      if (e.toString().contains("user have exceeded maximum attempts")) {
        Get.defaultDialog(
          barrierDismissible: false,
          radius: 25,
          backgroundColor: Colors.white,
          title: "Maaf",
          titleStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          middleText: 'Anda sudah tidak bisa mengerjakan Quiz',
          middleTextStyle: const TextStyle(color: Colors.black),
        );
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.back();
            Get.back();
            Get.back();
          },
        );
      }
    }
  }

  addUserAnswer(String paramUserAnswer) {
    userAnswer[indexAnswerNow.value] = paramUserAnswer;
    isAnswer[indexAnswerNow.value] = true;
  }

  submitAnswer() async {
    isLoading.value = true;
    startCountDown.value = 0;
    Map<String, dynamic> isAnswerUser = {
      "answer": userAnswer,
      "quiz_id": Get.arguments[0],
      "material_enrolled_id": dataQuiz.value!.materialEnrolledId,
      "duration_taken": lastCountDown.value
    };

    ResultQuizModel getDataResultQuiz =
        await _quizProvider.submitQuiz(isAnswerUser);
    dataResultQuiz.value = getDataResultQuiz;
    indexAnswerNow.value = 0;
    isLoading.value = false;
  }

  quizReview(String paramIdQuiz) async {
    isLoading.value = true;
    List<QuizReviewModel> getDataQuizReview =
        await _quizProvider.quizReview(paramIdQuiz);

    List<QuizReviewModel> data = [];
    for (var element in getDataQuizReview) {
      data.add(element);
    }
    dataQuizReview.value = data;

    
    isLoading.value = false;
  }

  
}
