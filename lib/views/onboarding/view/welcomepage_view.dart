import 'package:flutter/material.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF106FA4),
        body: Column(children: [
          const SizedBox(
            child: Image(
              image: AssetImage('assets/images/logo_kg.png'),
            ),
          ),
          const SizedBox(
            child: Image(
              image: AssetImage('assets/images/teach_kg.png'),
            ),
          ),
          SizedBox(
            width: 223,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48))),
                onPressed: () {},
                child: const Text('Daftar Sekarang ')),
          )
        ]));
  }
}
