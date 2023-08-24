import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HistoryQuizView extends GetView<QuizController> {
  const HistoryQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF106fa4),
      appBar: AppBar(
        backgroundColor: const Color(0XFF106fa4),
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Riwayat Quiz',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0XFFfffbfe),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView.separated(
                itemCount:
                    controller.dataDescriptionQuiz.value?.summary?.length ?? 0,
                itemBuilder: (ctx, index) {
                  var nilai = controller
                          .dataDescriptionQuiz.value?.summary?[index].score ??
                      0;
                  var passingGrade = '-';
                  late Color passingGradeColor;
                  void checkGrade() {
                    if (nilai > 0.6 && nilai < 1) {
                      passingGradeColor = const Color(0XFF49a152);
                      passingGrade = 'contr';
                    } else {
                      passingGradeColor = Colors.red;
                      passingGrade = 'Tidak Lulus';
                    }
                  }

                  checkGrade();
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 21),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0XFFd0cdcf),
                            offset: Offset(0, 1),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0XFFf3f3f3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.dataDescriptionQuiz.value?.summary?[index].activityDetail.dateSubmit}',
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 22.5),
                              decoration: BoxDecoration(
                                color: passingGradeColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                // '${Get.arguments[0]}',
                                passingGrade,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Text(
                          '${Get.arguments[1]}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: LinearPercentIndicator(
                              lineHeight: 20,
                              percent: nilai / 100,
                              center: Text(
                                '${nilai.toInt()}%',
                              ),
                              backgroundColor: Colors.white,
                              progressColor: const Color(0XFFd9d9d9),
                              barRadius: const Radius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0XFF106fa4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text(
                                'Detail',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(
                              '/studiku/quiz/seeAnswer',
                              arguments: [
                                Get.arguments[1],
                                controller.quizReview(
                                  controller.dataDescriptionQuiz.value!
                                      .summary![index].id,
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
