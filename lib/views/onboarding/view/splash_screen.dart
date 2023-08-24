
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _NewOnboardingViewState();
}

class _NewOnboardingViewState extends State<SplashScreenView> {
  int phase = 0;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        phase = 1;
      });
    });
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        phase = 2;
      });
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        phase = 3;
      });
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        phase = 4;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xff106FA4),
            ),
            Stack(
              children: [
                AnimatedPositioned(
                  curve: phase == 1 ? Curves.bounceIn : Curves.bounceOut,
                  right: phase == 3 ? 150 : 180,
                  bottom: phase == 0
                      ? 1000
                      : phase == 1
                          ? 200
                          : 320,
                  duration: const Duration(milliseconds: 450),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceInOut,
                    height: phase == 3 ? 153 : 73,
                    width: phase == 3 ? 153 : 73,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: phase == 3
                          ? BorderRadius.circular(75)
                          : BorderRadius.circular(50),
                    ),
                  ),
                ),
                if (phase == 3) ...[
                  AnimatedPositioned(
                    curve: phase == 1 ? Curves.bounceIn : Curves.bounceOut,
                    right: phase == 3 ? 178 : 180,
                    bottom: phase == 0
                        ? 1000
                        : phase == 1
                            ? 200
                            : 380,
                    duration: const Duration(milliseconds: 450),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      height: phase == 3 ? 37.59 : 73,
                      width: phase == 3 ? 90 : 73,
                      child: Image.asset('assets/images/Logo-Biru.png'),
                    ),
                  )
                ],
                if (phase == 4) ...[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  AnimatedPositioned(
                    curve: Curves.bounceOut,
                    right: 0,
                    left: 30,
                    bottom: 150,
                    duration: const Duration(milliseconds: 450),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      height: phase == 3 ? 37.59 : 500,
                      width: phase == 3 ? 90 : 500,
                      child: Image.asset('assets/images/Logo-Biru-Big.png'),
                    ),
                  )
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
