import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';

class PrimaryButtonActionIcon extends StatelessWidget {
  const PrimaryButtonActionIcon(
      {Key? key, required this.text, required this.icon, this.press})
      : super(key: key);
  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(kPadding1),

        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,

        textStyle: theme.textTheme.button,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius1)),
        // backgroundColor: Get.isDarkMode ? theme.primaryColorDark : theme.primaryColorLight,
        backgroundColor:
            Get.isDarkMode ? ColorConstants.gray400 : ColorConstants.gray50,
      ),
      onPressed: press,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: kPadding),
          Expanded(
            child: Text(
              text,
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
