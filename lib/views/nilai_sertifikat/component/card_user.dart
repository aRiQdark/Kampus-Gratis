import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/nilai_controller.dart';

class CardUser extends GetView<NilaiController> {
  const CardUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 70),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: controller.obx((state) => state?.studentInformation != null
          ? Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    state?.studentInformation?.studentName ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 5,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${state?.studentInformation?.nsn}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' ${state?.studentInformation?.major ?? ''}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' Semester  ${state?.studentInformation?.semester ?? ''}  '
                  ' / ${state?.studentInformation?.creditFinished ?? ''} SKS',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          : Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    "Data Belum Tersedia",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 5,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Data Belum Tersedia",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Data Belum Tersedia",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Data Belum Tersedia"
                  "Data Belum Tersedia",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          onError: (error) => const Text('Error data'),
          onEmpty: const Text('data kosong'),
          ),
    );
  }
}
