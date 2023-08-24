import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/models/studiku/assignment_detail_model.dart';
import 'package:kampus_gratis/services/providers/studiku/assignment_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class AssignmentController extends GetxController
    with StateMixin<AssignmentDetailModel> {
  final AssignmentProvider _assignmentProvider;

  AssignmentController(
    this._assignmentProvider,
  );

  RxString filenameFromAPI = ''.obs;
  RxBool isLate = false.obs;
  RxBool isEmpty = true.obs;
  XFile? file;
  RxString fileName = ''.obs;
  RxBool isLoading = false.obs;

  getAssignmentById(String paramIdSession) async {
    try {
      var result = await _assignmentProvider.getAssignmentById(paramIdSession);
      change(result, status: RxStatus.success());
      final fileFromAPI =
          XFile('${result?.studentsWork?.activityDetail?.fileAssignment}');
      filenameFromAPI.value = basename(fileFromAPI.path);

      final deadline = '${result?.assignment?.deadline}';
      late(deadline);
      // final score = result?.studentsWork?.score;
      // String grade;
      // switch (score) {
      //   case 85 > 100:
      //     grade = 'A';
      //   case 85 > 100:
      //     grade = 'B';
      //     case 85 > 100:
      //     grade = 'C';
      //     case 85 > 100:
      //     grade = 'D';
      // }
      return result;
    } catch (e) {
      change(null, status: RxStatus.error('$e FROM GET ASSIGNMENT'));
    }
  }

  void late(String deadline) {
    final dateFormat = DateFormat('dd/MM/yyyy').add_Hms();
    final date = dateFormat.parse(deadline);
    final now = DateTime.now();
    final result = now.isAfter(date);
    isLate.value = result;
  }

  submitStudentWork() async {
    try {
      isLoading.value = true;
      final paramIdSession = Get.arguments[0];

      final result =
          await _assignmentProvider.submitStudentWork(paramIdSession, file!);
      await getAssignmentById(paramIdSession);
      isLoading.value = false;
      Get.defaultDialog(title: 'Success', middleText: result['message']);
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  cancelStudentWork() async {
    try {
      isLoading.value = true;
      final paramIdSession = Get.arguments[0];
      var result = await _assignmentProvider.cancelStudentWork(paramIdSession);
      await getAssignmentById(paramIdSession);
      isLoading.value = false;
      Get.defaultDialog(title: 'Success', middleText: result['message']);
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  openFileFromAPI() async {
    final Uri url =
        Uri.parse('${state?.studentsWork?.activityDetail?.fileAssignmentLink}');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  openFile() async {
    await OpenFilex.open(file?.path);
  }

  // List<PlatformFile>? files = [];
  // RxList<XFile>? tes;

  Future pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'doc', 'docx', 'png'],
        type: FileType.custom,
        // allowMultiple: true,
      );

      if (result != null) {
        isEmpty.value = false;
        file = XFile(result.files.single.path!);
        fileName.value = file?.name ?? '';
        final fileSize = await file?.length();
        if (fileSize! > 2000000) {
          removeFile();
          return Get.defaultDialog(
            title: 'File Terlalu Besar',
            middleText: 'Ukuran File yang diterima tidak lebih dari 2MB',
          );
        }
      } else {
        file = null;
      }
    } catch (e) {
      // print('error : $e');
    }
  }

  Future removeFile() async {
    try {
      bool? result = await FilePicker.platform.clearTemporaryFiles();
      if (result == true) {
        isEmpty.value = true;
        fileName.value = '';
      }
    } catch (e) {
      // print(e);
    }
  }

  // upload from camera

  Future openCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    if (pickedImage != null) {
      isEmpty.value = false;
      file = XFile(pickedImage.path);
      fileName.value = basename(file!.path);
      final fileSize = await file?.length();
      if (fileSize! > 2000000) {
        removeFile();
        return Get.defaultDialog(
          title: 'File Terlalu Besar',
          middleText: 'Ukuran File yang diterima tidak lebih dari 2MB',
        );
      }
    }
  }

  // Future removeCamera() async {
  //   file = null;
  //   fileName.value = '';
  // }

  @override
  void onInit() {
    getAssignmentById(Get.arguments[0]);
    super.onInit();
  }
}
