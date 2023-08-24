import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/artikel/artikel_controller.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class Artikel extends GetView<ArtikelController> {
  const Artikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: AppBar(
        title: const Text('Today Insights'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) => SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: <Widget>[
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    data?.sort(
                      (a, b) {
                        return b!.createdAt!
                            .compareTo(a!.createdAt ?? DateTime.now());
                      },
                    );
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/artikel-details', arguments: index);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              data?[index]?.imageLink != null
                                  ? Container(
                                      height: 250.0,
                                      constraints: const BoxConstraints(
                                          maxWidth: 450, maxHeight: 250),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${data?[index]?.imageLink}')),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(kBorderRadius),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              data?[index]?.imageLink != null
                                  ? const SizedBox(height: 8.0)
                                  : const SizedBox(),
                              Text(
                                '${DateFormat.yMMMMd('id_ID').format(data?[index]?.createdAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data?[index]?.createdAt ?? DateTime.now())} WIB',
                                style: theme.textTheme.caption,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 3.0),
                              Text(
                                data?[index]?.title ?? '',
                                style: theme.textTheme.subtitle1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                data?[index]?.description ?? '',
                                style: theme.textTheme.bodyText2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(thickness: 1),
                  itemCount: data?.length ?? 0),
              Obx(
                () => controller.isLoadMore.value
                    ? const SizedBox(height: 8.0)
                    : const SizedBox(),
              ),
              Obx(
                () => controller.isLoadMore.value
                    ? const CircularProgressIndicator.adaptive()
                    : const SizedBox(),
              ),
              Obx(
                () => controller.isLoadMore.value
                    ? const SizedBox(height: 16.0)
                    : const SizedBox(),
              ),
            ],
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        onEmpty: const Center(child: Text('No data')),
        onError: (err) => Center(child: Text(err.toString())),
      ),
    );
  }
}
