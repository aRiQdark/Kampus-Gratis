import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/scoreboard/scoreboard_controller.dart';
import 'package:kampus_gratis/views/scoreboard/component/card_user.dart';
import 'package:kampus_gratis/views/scoreboard/component/dropdown_menu.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';


class ScoreBoardView extends GetView<ScoreController> {
  const ScoreBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    const style1 = TextStyle(
      color: Color(0xff383838),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return Scaffold(
        appBar: const KGAppBar(
            backButton: true, title: "Papan Skor", withIconKG: true),
        body: controller.obx(
          (data) => ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    DropMenu(),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "1",
                            style: TextStyle(
                                color: Color(0xff383838),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset("assets/icons/segitiga-hijau.png",
                              width: 10),
                          Image.asset(
                            "assets/icons/crowns 1.png",
                            width: 57,
                          ),
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "2",
                                        style: TextStyle(
                                            color: Color(0xff383838),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset(
                                          "assets/icons/segitiga-hijau.png",
                                          width: 10),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CardScore1(
                                        linkThumbnail:
                                            data?[1].user?.displayPictureLink,
                                      ),
                                    ],
                                  ),
                                  // CardScore1(
                                  //   linkThumbnail:
                                  //       data?[0].user?.displayPictureLink,
                                  // ),
                                  Column(
                                    children: [
                                      const Text(
                                        "3",
                                        style: TextStyle(
                                            color: Color(0xff383838),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset(
                                          "assets/icons/segitiga-hijau.png",
                                          width: 10),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CardScore1(
                                        linkThumbnail:
                                            data?[2].user?.displayPictureLink,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () => Get.defaultDialog(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          title: '',
                                          content: Column(
                                            children: [
                                              ClipRect(
                                                child: data?[0]
                                                            .user
                                                            ?.displayPictureLink !=
                                                        null
                                                    ? Image.network(
                                                        'data?[0].user?.displayPictureLink',
                                                        width: 100,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Image.asset(
                                                        'assets/images/person2.png',
                                                        width: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text("Ikhsan"),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              const Text("Mahasiswa - POB"),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                width: 201,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffEDEDED),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    Text("Disukai"),
                                                    Text("1770 Suka"),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                width: 201,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffEDEDED),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    Text("Disukai"),
                                                    Text("1770 Postingan"),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                width: 201,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffEDEDED),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    Text("Poin"),
                                                    Text("20000 Poin"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      child: Container(
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white),
                                        padding: const EdgeInsets.all(4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: data?[0]
                                                      .user
                                                      ?.displayPictureLink !=
                                                  null
                                              ? Image.network(
                                                  "${data?[0].user?.displayPictureLink}",
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  "assets/images/person2.png",
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // child: CardScore1(
                                //   linkThumbnail:
                                //       data?[0].user?.displayPictureLink,
                                // ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                  child: Text(
                                data![0].user!.username!,
                                maxLines: 4,
                                style: style1,
                                textAlign: TextAlign.center,
                              )),
                              Flexible(
                                child: Text(
                                  data[1].user!.username!,
                                  maxLines: 2,
                                  style: style1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  data[2].user!.username!,
                                  maxLines: 2,
                                  style: style1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('${data[0].finalScore} Poin'),
                              Text('${data[1].finalScore} Poin'),
                              Text('${data[2].finalScore} Poin'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 41,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 11.0),
                width: 338,
                height: 49,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Rank",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Color(0xffFAFAFA),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    const Text(
                      "User",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Color(0xffFAFAFA),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 126,
                    ),
                    const Text(
                      "Poin",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Color(0xffFAFAFA),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 11.0),
                width: 338,
                height: Get.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 8),
                              width: Get.width * 0.15,
                              height: 46,
                              decoration: BoxDecoration(
                                  color: const Color(0XFFFDB415),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  (index + 4).toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff383838),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.only(top: 12, left: 12),
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 9, top: 9),
                                width: Get.width * 0.72,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFE5E5E5),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset.infinite,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CardScore(
                                          linkThumbnail: data[index]
                                              .user
                                              ?.displayPictureLink,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          data[index + 3].user?.username ??
                                              'Noname',
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            color: Color(0xff383838),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        '${data[index].finalScore}',
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          color: Color(0xff383838),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
