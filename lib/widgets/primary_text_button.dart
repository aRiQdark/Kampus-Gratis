import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.subtitle2?.copyWith(
            color: ColorConstants.green1, fontWeight: FontWeight.w600),
      ),
    );
  }
}
