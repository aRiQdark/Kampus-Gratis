import 'package:kampus_gratis/models/panduan/panduan_buku_model.dart';
import 'package:kampus_gratis/models/panduan/panduan_kamus_model.dart';
import 'package:kampus_gratis/models/panduan/panduan_video_model.dart';
import 'package:kampus_gratis/services/repository/panduan/panduan_repository.dart';

class PanduanProvider {
  final PanduanRepository _panduanRepository;

  PanduanProvider(this._panduanRepository);

  Future<List<PanduanVideoModel>> getAllPanduanVideo() async {
    var response = await _panduanRepository.getAllPanduanVideo();

    final responseResult = ResponseResultPanduanVideo.fromJson(response);

    return responseResult.data;
  }

  Future<List<PanduanBukuModel>> getAllPanduanBuku() async {
    var response = await _panduanRepository.getAllPanduanBuku();

    final responseResult = ResponseResultPanduanBuku.fromJson(response);

    return responseResult.data;
  }

  Future<List<PanduanKamusModel>> getAllPanduanKamus(
      String type, String? search) async {
    var response = await _panduanRepository.getAllPanduanKamus(type, search);

    final responseResult = ResponseResultPanduanKamus.fromJson(response);

    return responseResult.data;
  }
}
