import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/sertifikat_controller.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class DetailSertifikat extends GetView<SertifikatController> {
  final String linkPDF;
  const DetailSertifikat({
    super.key,
    required this.linkPDF,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Get.back(),
        ),
      ),
      body: PdfViewer.openFutureFile(
        () async =>
            (await DefaultCacheManager().getSingleFile(linkPDF)).path,
        params: const PdfViewerParams(
          scrollDirection: Axis.vertical,
          panEnabled: false,
          scaleEnabled: false,
        ),
      ),
      // PdfViewer.openFutureFile(
      //   () async => (await DefaultCacheManager()
      //           .getSingleFile('${controller.state?[index].link}'))
      //       .path,
      //   params: const PdfViewerParams(),
      // ),
    );
  }
}
