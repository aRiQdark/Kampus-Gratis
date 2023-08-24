import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/assignment_controller.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class DetailLampiran extends GetView<AssignmentController> {
  const DetailLampiran({super.key});

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
        () async => (await DefaultCacheManager().getSingleFile(
                '${controller.state?.assignment?.fileAssignmentLink}'))
            .path,
        params: const PdfViewerParams(),
      ),
    );
  }
}
