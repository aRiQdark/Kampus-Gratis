import 'package:flutter/material.dart';
import 'package:kampus_gratis/themes/themes.dart';

class ScoreBoardTabView extends StatelessWidget {
  const ScoreBoardTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 32),
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFDB515)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Text(
                    "Asqa",
                    style: Themes.lightTheme.textTheme.subtitle2!
                        .copyWith(fontWeight: FontWeight.w400,color: Colors.black),
                  ),
                ],
              ),
              Text(
                '4.00',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 32),
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFFD67B)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Text(
                    "Asqa",
                    style: Themes.lightTheme.textTheme.subtitle2!
                        .copyWith(fontWeight: FontWeight.w400,color: Colors.black),
                  ),
                ],
              ),
              Text(
                '4.00',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 32),
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFFEFCB)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Text(
                    "Asqa",
                    style: Themes.lightTheme.textTheme.subtitle2!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                '4.00',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
