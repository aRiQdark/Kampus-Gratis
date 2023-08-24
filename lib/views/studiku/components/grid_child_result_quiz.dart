import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class GridChildResultQuiz extends StatelessWidget {
  const GridChildResultQuiz({
    Key? key,
    required this.label,
    required this.content,
    this.contentLabel,
    this.status,
  }) : super(key: key);

  final String label;
  final String content;
  final String? contentLabel;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.brightness_1,
                size: 9,
              ),
              Text(
                ' $label',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  color: const Color(0xFF939094),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          status != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      color: Color(0xFF15C8A8),
                    ),
                    child: Center(
                      child: Text(
                        content,
                        style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "$content ${contentLabel ?? ''}",
                    style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                      color: const Color(0xFF106FA4),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
