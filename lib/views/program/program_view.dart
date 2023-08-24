import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/program/program_controller.dart';

class ProgramView extends GetView<ProgramController> {
  const ProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: controller.obx((data) {
        return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(data?[index].namaProgram ?? ''),
                    subtitle: Text(data?[index].detail ?? ''),
                    onTap: () => Get.snackbar(
                        "Fitur belum tersedia", 'Silahkan coba lagi nantis'),
                  ),
                ],
              );
            });
      },
          onEmpty: const Text(''),
          onLoading: const Center(
            child: CircularProgressIndicator.adaptive(),
          )),
    );
  }
}
