import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/sertifikat_controller.dart';
import 'package:kampus_gratis/views/nilai_sertifikat/component/detail_sertifikat.dart';

class CardSertifikat extends GetView<SertifikatController> {
  final String linkPDF;
  final String? linkThumbnail;
  final String subject;
  const CardSertifikat(
      {super.key,
      required this.linkPDF,
      this.linkThumbnail,
      required this.subject});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: GestureDetector(
                    child: SizedBox(
                      width: 150,
                      child: linkThumbnail != null
                          ? Image.network(
                              '$linkThumbnail',
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              'assets/images/Art 1.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                    onTap: () => {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return DetailSertifikat(linkPDF: linkPDF);
                              }))
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
