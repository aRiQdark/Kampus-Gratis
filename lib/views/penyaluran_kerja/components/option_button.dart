import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.height,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  final double height;
  final String imageUrl;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        height: height,
        decoration: BoxDecoration(
          color: const Color(0XFFe5e5e5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    imageUrl,
                    width: 90,
                  ),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.start,
                style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0XFF383838),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Lihat Pekerjaan',
                    style: Themes.lightTheme.textTheme.caption!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF383838),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Color(0XFF383838),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
