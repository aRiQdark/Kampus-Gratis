import 'package:flutter/cupertino.dart';

class FilterSemester extends StatelessWidget {
  const FilterSemester({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff106FA4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Text("Global"),
          )
        ],
      ),
    );
  }
}
