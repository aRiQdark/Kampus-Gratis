import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/sertifikat_controller.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class SertifikatTab extends GetView<SertifikatController> {
  const SertifikatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      body: Column(
        children: [
          const SizedBox(height: 20,),
          controller.obx((state) => Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: state!.length,
              itemBuilder: (context, index) {
                return ListSertifikat(
                            linkPDF: '${state[index].link}',
                            linkThumbnail: '${state[index].thumbnailLink}',
                            subject: '${state[index].subject?.name}',
                          );
              },
            ),
          ))
        ],
      ),
    );
  }
}

class ListSertifikat extends GetView<SertifikatController> {
  final String linkPDF;
  final String linkThumbnail;
  final String subject;
  const ListSertifikat(
      {super.key,
      required this.linkPDF,
      required this.linkThumbnail,
      required this.subject});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Image.network(
                        linkThumbnail,
                        fit: BoxFit.contain,
                        width: 150,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PrimaryButton(
                    isExpand: false,
                    onPressed: () async {
                      Get.snackbar(
                        'Sedang Download',
                        'Mohon Tunggu',
                      );
                      await controller.downloadDocument(linkPDF);
                    },
                    label: 'Download',
                  ),
                )
              ],
            );
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.network(
              linkThumbnail,
              fit: BoxFit.contain,
              width: 150,
            ),
            const SizedBox(height: 20),
            Text(subject, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}