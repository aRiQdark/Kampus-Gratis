import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdministrasiView extends StatelessWidget {
  const AdministrasiView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new))),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: const Text(
                'ADMINISTRASI',
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 195, 255),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Image.asset('assets/images/Administrasi.png'),
          ),
          const SizedBox(
            height: 190,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 195, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  // if (loginController.selectedprogram == 'Mahasiswa') {
                    Get.toNamed('/data-diri');
                  // } else {
                  //   debugPrint('ERROR');
                  // }
                },
                child: const Text(
                  'Lanjut',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )),
          ),
        ],
      ),
    );
  }
}
