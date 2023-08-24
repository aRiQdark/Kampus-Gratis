import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/artikel/artikel_model.dart';
import 'package:kampus_gratis/services/providers/artikel/artikel_provider.dart';

class ArtikelController extends GetxController with StateMixin<List<Result?>> {
  final ArtikelProvider _artikelProvider;

  ArtikelController(this._artikelProvider);

  final _result = Rx<ArtikelModel?>(null);
  var articles = RxList<Result>();

  final ScrollController scrollController = ScrollController();
  final int _limit = 5;

  RxBool isLoadMore = false.obs;

  String? search;
  int? totalData;
  int _currentPage = 1;

  Future<void> getArtikel() async {
    try {
      final result =
          await _artikelProvider.getArtikel(_currentPage, _limit, search);

      articles.assignAll(result?.result ?? []);
      _result.value = result;
      totalData = result?.totalData;

      return change(articles, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  void loadMore() async {
    final totalData = _result.value?.totalData ?? 0;
    if (totalData / _limit <= _currentPage) return;
    if (isLoadMore.value) return;

    isLoadMore.value = true;
    debugPrint('loadMore');
    _currentPage += 1;

    final result =
        await _artikelProvider.getArtikel(_currentPage, _limit, search);
    articles.addAll(result?.result ?? []);
    change(articles, status: RxStatus.success());
    _result.value?.totalData = result?.totalData;
    isLoadMore.value = false;
  }

  void _initializeScrollController() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      loadMore();
    }
  }

  @override
  void onInit() async {
    debugPrint('artikel controller init');
    await getArtikel();
    _initializeScrollController();
    super.onInit();
  }
}
