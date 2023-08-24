import 'package:flutter/material.dart';

import '../../../themes/themes.dart';
import '../../../utils/colors_constans.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  const LabelTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Themes.lightTheme.textTheme.subtitle2!
          .copyWith(fontSize: 12, color: ColorConstants.labelBlack),
    );
  }
}
