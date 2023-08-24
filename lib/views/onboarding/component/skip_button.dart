import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/constants.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    // required this.size,
    required this.onTap,
  }) : super(key: key);

  // final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        splashColor: Colors.white,
        child: const Center(
          child: Text(
            'Skip',
            // style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
