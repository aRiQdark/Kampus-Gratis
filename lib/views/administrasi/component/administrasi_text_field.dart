import 'package:flutter/material.dart';

import '../../../utils/colors_constans.dart';

class AdministrasiTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Widget? suffixIcon;
  final bool readOnly;
  const AdministrasiTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validator,
    this.textInputType,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        keyboardType: textInputType,
        controller: textEditingController,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.only(left: 20, right: 5),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorConstants.greyTextField,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorConstants.greyTextField,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorConstants.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
         
        ),
      ),
    ));
  }
}
