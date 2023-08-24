import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

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
                                itemCount: controller.dataQuiz.value != null
                                    ? controller.dataQuiz.value!.quiz.length
                                    : 0,
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
                                        color:
                                            controller.indexAnswerNow.value ==
                                                    index
                                                ? Colors.black
                                                : controller.isAnswer[index] ==
                                                        false
                                                    ? null
                                                    : Colors.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: controller
                                                        .indexAnswerNow.value ==
                                                    index
                                                ? Colors.white
                                                : controller.isAnswer[index] ==
                                                        false
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: controller
                                                        .indexAnswerNow.value ==
                                                    index
                                                ? 25
                                                : controller.isAnswer[index] ==
                                                        false
                                                    ? 18
                                                    : 22,
                                          ),
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
                                'Jawab ',
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
                                itemCount: controller.dataQuiz.value != null
                                    ? controller
                                        .dataQuiz
                                        .value!
                                        .quiz[controller.indexAnswerNow.value]
                                        .choices
                                        .length
                                    : 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: GestureDetector(
                                      onTap: () => controller.addUserAnswer(
                                          controller
                                              .dataQuiz
                                              .value!
                                              .quiz[controller
                                                  .indexAnswerNow.value]
                                              .choices[index]),
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
                                                      .dataQuiz
                                                      .value!
                                                      .quiz[controller
                                                          .indexAnswerNow.value]
                                                      .choices[index] ==
                                                  controller.userAnswer[
                                                      controller
                                                          .indexAnswerNow.value]
                                              ? const Color(0xffB4D6FF)
                                              : const Color.fromARGB(
                                                  255, 218, 211, 211),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                  .dataQuiz
                                                  .value!
                                                  .quiz[controller
                                                      .indexAnswerNow.value]
                                                  .choices[index],
                                              style: const TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
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
                                GestureDetector(
                                  onTap: () {
                                    if (controller.dataQuiz.value!.quiz.length -
                                            1 ==
                                        controller.indexAnswerNow.value) {
                                      controller.changeStartCountDown();
                                      Future.delayed(
                                        const Duration(seconds: 1),
                                        () => Get.defaultDialog(
                                            barrierDismissible: false,
                                            radius: 25,
                                            backgroundColor: Colors.white,
                                            title: 'Konfirmasi',
                                            titleStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            middleText:
                                                'Yakin untuk menyelesaikan quiz?',
                                            middleTextStyle: const TextStyle(
                                                color: Colors.black),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller
                                                      .changeStartCountDown();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                                child: const Text(
                                                  'batal',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 46,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  Get.toNamed(
                                                    '/studiku/quiz/result',
                                                    arguments: [
                                                      Get.arguments[0],
                                                      Get.arguments[1],
                                                    ],
                                                  );
                                                  controller.submitAnswer();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green),
                                                child: const Text(
                                                  'Yakin',
                                                ),
                                              ),
                                            ]),
                                      );
                                    } else {
                                      controller.changeIndexAnswerNow(
                                          controller.indexAnswerNow.value + 1);
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 60,
                                    ),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 5,
                                    ),
                                    height: 40,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        color: controller.dataQuiz.value!.quiz
                                                        .length -
                                                    1 ==
                                                controller.indexAnswerNow.value
                                            ? Colors.green
                                            : const Color(0xff106FA4),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        controller.dataQuiz.value!.quiz.length -
                                                    1 ==
                                                controller.indexAnswerNow.value
                                            ? "Selesai"
                                            : "Next",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            color: controller.dataQuiz.value!
                                                            .quiz.length -
                                                        1 ==
                                                    controller
                                                        .indexAnswerNow.value
                                                ? Colors.white
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.indexAnswerNow.value != 0) {
                                      controller.changeIndexAnswerNow(
                                          controller.indexAnswerNow.value - 1);
                                    }
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
                                        .dataQuiz
                                        .value!
                                        .quiz[controller.indexAnswerNow.value]
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
                  Positioned(
                    top: Get.height * 0.14,
                    right: 20,
                    child: SizedBox(
                      width: 120,
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.formatedTime(
                                controller.startCountDown.toInt()),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
