import 'package:flutter/material.dart';

import '../../../utils/colors_constans.dart';

class AdministrasiDropdownField extends StatelessWidget {
  final String? valueDropdown;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  const AdministrasiDropdownField(
      {super.key,
      required this.valueDropdown,
      required this.items,
      required this.onChanged,
      required this.validator, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(left: 20, right: 10, top: 8, bottom: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.greyTextField),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration.collapsed(hintText: ''),
        isExpanded: true,
        validator: validator,
        value: valueDropdown,
        hint: Text(hintText),
        items: items
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
