import 'package:flutter/material.dart';

class ButtonSemester extends StatefulWidget {
  const ButtonSemester({
    Key? key,
    required this.text,
    required this.warna,
  }) : super(key: key);
  final String text;
  final Color warna;

  @override
  State<ButtonSemester> createState() => _ButtonSemesterState();
}

class _ButtonSemesterState extends State<ButtonSemester> {
  bool isDown = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      width: 380,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff9D71E8),
          boxShadow: [
            BoxShadow(offset: Offset.fromDirection(2), blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            !isDown
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isDown = !isDown;
                      });
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        isDown = !isDown;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
