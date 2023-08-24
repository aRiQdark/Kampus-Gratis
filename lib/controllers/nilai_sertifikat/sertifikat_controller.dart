import 'dart:ui';

import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/models/nilai_sertifikat/sertifikat_model.dart';
import 'package:kampus_gratis/services/providers/nilai_sertifikat/sertifikat_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class SertifikatController extends GetxController
    with StateMixin<List<SertifikatModel>?> {
  final SertifikatProvider _sertifikatProvider;

  ReceivePort port = ReceivePort();
  SertifikatController(this._sertifikatProvider);

  // RxString batalkan = 'Batalkan'.obs;
  RxString filenameFromAPI = ''.obs;
  RxBool isEmpty = true.obs;
  XFile? file;
  RxString fileName = ''.obs;
  RxBool isLoading = false.obs;

  getSertifikat() async {
    try {
      List<SertifikatModel>? result = await _sertifikatProvider.getSertifikat();
      debugPrint(result?.isEmpty.toString());
      // if (result!.isNotEmpty) {
      //   debugPrint('asu');
      //   change(null, status: RxStatus.empty());
      // }
      change(result, status: RxStatus.success());
      // result.forEach((element) => print(element.link));

      // final fileFromAPI =
      //     XFile('${result?[].?.activityDetail?.fileAssignment}');
      // filenameFromAPI.value = basename(fileFromAPI.path);

      // final deadline = '${result?.assignment?.deadline}';
      // late(deadline);

      // for (int i = 0; i < result.assignment.fileAssignment.length; i++) {
      //   renderThumbnail(result.assignment.fileAssignment[i]);
      // }
      return result;
    } catch (e) {
      change(null,
          status: RxStatus.error('$e FROM GET CERTIFICATE'));
    }
  }

  downloadDocument(String urlDocument) async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();

      await FlutterDownloader.enqueue(
        url: urlDocument,
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: baseStorage!.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
        saveInPublicStorage: true,
      );
    }
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  void onInit() {
    super.onInit();
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    port.listen((dynamic data) {
      // String id = data[0];
      // DownloadTaskStatus status = data[1];
      // int progress = data[2];
    });
    update();
    FlutterDownloader.registerCallback(downloadCallback);

    getSertifikat();
    super.onInit();
  }
}
