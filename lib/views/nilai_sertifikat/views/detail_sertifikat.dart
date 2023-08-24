import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class DetailSertifikatView extends StatelessWidget {
  const DetailSertifikatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Detail Sertifikat',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                  onTap: () {}, child: const Icon(Icons.file_download_done))
              //Image.network('assets/images/sertif.jpg'),
              ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              label: 'Download',
              onPressed: () {
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Card(
                //           margin: const EdgeInsets.symmetric(horizontal: 20),
                //           child: Image.asset('assets/images/Error.png'),
                //         ),
                //         const SizedBox(
                //           height: 20,
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 20),
                //           child: PrimaryButton(
                //             label: 'Kembali',
                //             onPressed: () => Get.back(),
                //             isExpand: false,
                //           ),
                //         )
                //       ],
                //     );
                //   },
                // );
              },
              isExpand: false,
            ),
          ),
        ],
      ),
    );
  }
}
