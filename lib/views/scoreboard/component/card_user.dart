import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/scoreboard/scoreboard_controller.dart';

class CardScore extends GetView<ScoreController> {
  final String? linkThumbnail;
  final String? userName;
  const CardScore({
    super.key,
    this.linkThumbnail,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Get.defaultDialog(
            radius: 20,
            backgroundColor: Colors.white,
            title: '',
            content: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: linkThumbnail != null
                        ? Image.network(
                            '$linkThumbnail',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/person2.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Ikhsan",
                  style: TextStyle(
                      color: Color(0xff106FA4),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "Mahasiswa - POB",
                  style: TextStyle(
                      color: Color(0xff106FA4),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 201,
                  decoration: const BoxDecoration(
                    color: Color(0xffEDEDED),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Disukai"),
                      Row(
                        children: const [
                          Text("1770 ",
                              style: TextStyle(color: Color(0xff106FA4))),
                          Text("Suka"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 201,
                  decoration: const BoxDecoration(
                    color: Color(0xffEDEDED),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Disukai"),
                      Row(
                        children: const [
                          Text("1770 ",
                              style: TextStyle(color: Color(0xff106FA4))),
                          Text("Posting"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 201,
                  decoration: const BoxDecoration(
                    color: Color(0xffEDEDED),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Poin"),
                      Row(
                        children: const [
                          Text("20000 ",
                              style: TextStyle(color: Color(0xff106FA4))),
                          Text("Poin"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
      },
      child: GestureDetector(
        child: SizedBox(
          height: 29,
          width: 29,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: linkThumbnail != null
                ? Image.network(
                    '$linkThumbnail',
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    'assets/images/person2.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}

class CardScore1 extends GetView<ScoreController> {
  final String? linkThumbnail;
  final String? userName;
  const CardScore1({
    super.key,
    this.linkThumbnail,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Get.defaultDialog(
            radius: 20,
            backgroundColor: Colors.white,
            title: '',
            content: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: linkThumbnail != null
                        ? Image.network(
                            '$linkThumbnail',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/person2.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Ikhsan",
                  style: TextStyle(
                      color: Color(0xff106FA4),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "Mahasiswa - POB",
                  style: TextStyle(
                      color: Color(0xff106FA4),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 201,
                  decoration: const BoxDecoration(
                    color: Color(0xffEDEDED),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Disukai"),
                      Row(
                        children: const [
                          Text("1770 ",
                              style: TextStyle(color: Color(0xff106FA4))),
                          Text("Suka"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 201,
                  decoration: const BoxDecoration(
                    color: Color(0xffEDEDED),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Disukai"),
                      Row(
                        children: const [
                          Text("1770 ",
                              style: TextStyle(color: Color(0xff106FA4))),
                          Text("Posting"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 201,
                  decoration: const BoxDecoration(
                    color: Color(0xffEDEDED),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Poin"),
                      Row(
                        children: const [
                          Text("20000 ",
                              style: TextStyle(color: Color(0xff106FA4))),
                          Text("Poin"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
      },
      child: GestureDetector(
        child: SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: linkThumbnail != null
                ? Image.network(
                    '$linkThumbnail',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/person2.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
