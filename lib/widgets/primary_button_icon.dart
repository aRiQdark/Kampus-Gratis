import 'package:flutter/material.dart';

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon(
      {Key? key,
      required this.icon,
      required this.label,
      this.color,
      required this.onPressed})
      : super(key: key);

  final Widget icon;
  final String label;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0))),
      ),
    );
  }
}
