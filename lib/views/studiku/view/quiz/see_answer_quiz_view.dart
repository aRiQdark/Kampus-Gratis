import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';

class SeeAnswerQuizView extends GetView<QuizController> {
  const SeeAnswerQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              color: const Color(0xff106FA4),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: Get.height * 0.65,
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          children: [
                            Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.only(left: 23, right: 23),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.dataQuizReview.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.changeIndexAnswerNow(index);
                                    },
                                    child: Container(
                                      height: 28,
                                      width: 28,
                                      margin: const EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller
                                                    .indexAnswerNow.value ==
                                                index
                                            ? const Color(0xff4361EE)
                                            : controller.dataQuizReview[index]
                                                        .userAnswer ==
                                                    "kosong"
                                                ? Colors.grey
                                                : Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30, bottom: 20),
                              child: Text(
                                'Jawab',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Montserrat'),
                              ),
                            ),
                            MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .dataQuizReview[
                                        controller.indexAnswerNow.value]
                                    .question
                                    .choices
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0.0, 3.0),
                                            blurRadius: 1,
                                            spreadRadius: 4,
                                          )
                                        ],
                                        color: controller
                                                    .dataQuizReview[controller
                                                        .indexAnswerNow.value]
                                                    .realAnswer ==
                                                controller
                                                    .dataQuizReview[controller
                                                        .indexAnswerNow.value]
                                                    .question
                                                    .choices[index]
                                            ? const Color(0xff24CE09)
                                            : controller
                                                        .dataQuizReview[
                                                            controller
                                                                .indexAnswerNow
                                                                .value]
                                                        .userAnswer ==
                                                    controller
                                                        .dataQuizReview[
                                                            controller
                                                                .indexAnswerNow
                                                                .value]
                                                        .question
                                                        .choices[index]
                                                ? Colors.red
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              color: Color(0xff939094),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                controller.alphabet[index],
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            controller
                                                .dataQuizReview[controller
                                                    .indexAnswerNow.value]
                                                .question
                                                .choices[index],
                                            style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 44,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    height: 40,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE5E5E5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                      child: Text(
                                        'Kembali',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.2,
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Container(
                        height: 160,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Card(
                            elevation: 6.3,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pertanyaan',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    controller
                                        .dataQuizReview[
                                            controller.indexAnswerNow.value]
                                        .question
                                        .question,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat', fontSize: 16),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.1,
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(4),
                      child: const Text(
                        'Quiz',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
