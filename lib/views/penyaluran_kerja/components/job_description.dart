import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class JobDescription extends StatelessWidget {
  final String? title;
  const JobDescription({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: const [
              SizedBox(
                height: 5,
              ),
              Icon(
                Icons.circle,
                size: 6,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              "$title",
              textAlign: TextAlign.left,
              style: Themes.lightTheme.textTheme.caption!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
