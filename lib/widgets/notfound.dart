import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/constants.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/gb.png',
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 32),
          Text(
            '404 not found',
            style: theme.textTheme.headline6,
          )
        ],
      ),
    );
  }
}
