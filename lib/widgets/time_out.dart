import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/constants.dart';

class TimeOut extends StatelessWidget {
  const TimeOut({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sally-1.jpg',
              width: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: Text(
                  'Muat Ulang',
                  style: theme.textTheme.button,
                ),
                onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
