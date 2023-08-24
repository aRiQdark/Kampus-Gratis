import 'dart:isolate';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/studiku/module_model.dart';
import 'package:kampus_gratis/services/providers/studiku/module_provider.dart';
import 'package:kampus_gratis/models/studiku/detail_modul_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class ModulController extends GetxController with StateMixin {
  ModulController(this._moduleProvider);
  final ModuleProvider _moduleProvider;

  ReceivePort port = ReceivePort();

  RxList<ModuleModel> allDataModuleByIdSession = <ModuleModel>[].obs;
  // ignore: unnecessary_cast
  final Rx<DetailModuleModel?> detailModul = (null as DetailModuleModel?).obs;
  var takeawayController = TextEditingController();

  RxString idModul = ''.obs;
  RxString idSession = ''.obs;

  RxBool isLoading = false.obs;

  getAllModuleById(String paramIdSession) async {
    try {
      List<ModuleModel>? getDataModule =
          await _moduleProvider.getAllModuleById(paramIdSession);
      change(getDataModule, status: RxStatus.success());
      if (getDataModule != null) {
        allDataModuleByIdSession.value = getDataModule;
      }
      idSession.value = paramIdSession;
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  getDetailModuleById(String paramIdModul) async {
    try {
      isLoading.value = true;
      idModul.value = paramIdModul;
      DetailModuleModel? detailDataModule =
          await _moduleProvider.getDetailModuleById(paramIdModul);
      change(detailDataModule, status: RxStatus.success());

      if (detailDataModule != null) {
        detailModul.value = detailDataModule;
      }
      isLoading.value = false;
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  finishModule(String takeaway, BuildContext context) async {
    Map<String, dynamic> thisBody = {
      "module_id": idModul.value,
      "takeaway": takeaway
    };

    Get.back();
    showLoaderDialog(context);
    await _moduleProvider.finishDetailModuleById(
      thisBody,
    );
    takeawayController.clear();
    Get.back();
    Get.back();
    change(null, status: RxStatus.loading());
    getAllModuleById(idSession.value);
  }

  YoutubePlayerController isYoutubeController(String paramUrlYt) {
    String result = paramUrlYt.substring(
      32,
    );

    return YoutubePlayerController(
      initialVideoId: result,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
      ),
    );
  }

  String? getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return null;
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
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

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
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

    getAllModuleById(Get.arguments[0]);
  }
}
