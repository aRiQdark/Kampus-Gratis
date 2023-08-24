import 'package:path/path.dart';

String thumbnail(String path) {
  final name =
      extension(path);
  String imgPath;

  if (name == '.png' || name == '.jpg' || name == '.jpeg') {
    imgPath = 'assets/images/img-asset.svg';
  } else if (name == '.doc' || name == '.docx') {
    imgPath = 'assets/images/doc-asset.svg';
  } else if (name == '.ppt' || name == '.pptx') {
    imgPath = 'assets/images/ppt-asset.svg';
  } else if (name == '.xls' || name == '.xlsx') {
    imgPath = 'assets/images/xls-asset.svg';
  } else if (name == '.pdf') {
    imgPath = 'assets/images/pdf-asset.svg';
  } else {
    imgPath = 'assets/images/default-asset.svg';
  }
  return imgPath;
}
