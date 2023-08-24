import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/artikel/artikel_controller.dart';
import 'package:kampus_gratis/controllers/beranda/beranda_controller.dart';
import 'package:kampus_gratis/controllers/iklan/iklan_controller.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/views/beranda/component/beranda_app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';
import 'package:string_capitalize/string_capitalize.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({super.key});

  @override
  Widget build(BuildContext context) {
    final iklanController = Get.find<IklanController>();
    final artikelController = Get.find<ArtikelController>();
    final profilController = Get.find<ProfilController>();
    final textTheme = Themes.lightTheme.textTheme;
    return KGScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        withIconKG: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/profile_appbar.png"),
                      fit: BoxFit.cover)),
              child: profilController.obx(
                  (state) => ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: SizedBox(
                          child: state?.displayPictureLink != null
                              ? Image.network(
                                  "${state!.displayPictureLink}",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/person2.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                  onLoading: const ShimmerLoading(
                    shape: ShimmerShape.circle,
                  ),
                  onError: (error) => CircleAvatar(
                        backgroundColor: ColorConstants.gray50,
                      ),
                  onEmpty: CircleAvatar(
                    backgroundColor: ColorConstants.gray50,
                  )),
            ),
            Expanded(
              child: profilController.obx((state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello ${(state?.fullName?.capitalizeEach())},',
                        style: Themes.darkTheme.textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Sudah siap belajar di Kampus Gratis?',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.0,
                            color: Colors.white),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            iklanController.obx(
                (state) {
                  return CarouselSlider.builder(
                    itemCount: state?.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 20.0, bottom: 24.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                offset: Offset(1, 2),
                              )
                            ],
                            image: state?[index].name != null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('${state?[index].url}'),
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      viewportFraction: 1.0,
                    ),
                  );
                },
                onLoading: Container(
                  height: 192,
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 24.0),
                  child: const ShimmerLoading(),
                ),
                onEmpty: const Center(
                  child: Text('Data kosong'),
                ),
                onError: (error) {
                  return SizedBox(
                    height: 192,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 24.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorConstants.gray50,
                      ),
                    ),
                  );
                }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              child: const Text(
                'Fitur',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            profilController.obx(
              (state) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                // height: controller.isExpanded.value ? 320 : 220,
                child: Obx(
                  () => GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 24,
                    crossAxisCount: 4,
                    children: controller.isExpanded.value
                        ? controller.listButtonExpanded
                        : controller.listButton,
                  ),
                ),
              ),
              onEmpty: const SizedBox(),
              onError: (error) => Text(error.toString()),
              onLoading: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const ShimmerLoading(),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const SizedBox(
                              width: 50,
                              height: 10,
                              child: ShimmerLoading(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            artikelController.obx(
              (data) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Artikel',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/artikel');
                            },
                            child: Text('Lebih banyak',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstants.gray100)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      height: 185,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => Get.toNamed('/artikel-details',
                                  arguments: index),
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data?[index]?.imageLink != null
                                        ? Container(
                                            height: 113,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.10),
                                                  offset: const Offset(
                                                    0,
                                                    4.0,
                                                  ),
                                                  blurRadius: 4.0,
                                                  spreadRadius: 1.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${data?[index]?.imageLink}'),
                                                  fit: BoxFit.cover),
                                            ),
                                          )
                                        : const SizedBox(),
                                    data?[index]?.imageLink != null
                                        ? const SizedBox(height: 8.0)
                                        : const SizedBox(),
                                    Text(
                                      '${data?[index]?.title}',
                                      style: textTheme.subtitle2,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${data?[index]?.description}',
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ));
                        },
                        itemCount: data?.length != null
                            ? data!.length < 5
                                ? data.length
                                : 5
                            : 0,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: 20.0,
                        ),
                      ),
                    )
                  ],
                );
              },
              onLoading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8.0),
                    ShimmerLoading(
                      width: 150.0,
                      height: Theme.of(context).textTheme.subtitle1?.fontSize,
                    ),
                    const SizedBox(height: 8.0),
                    const ShimmerLoading(height: 150.0),
                    const SizedBox(height: 8.0),
                    ShimmerLoading(
                      height: textTheme.subtitle2?.fontSize,
                    ),
                    const SizedBox(height: 4.0),
                    ShimmerLoading(
                      height: textTheme.subtitle2?.fontSize,
                    ),
                  ],
                ),
              ),
              onError: (error) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8.0),
                    ShimmerLoading(
                      width: 150.0,
                      height: Theme.of(context).textTheme.subtitle1?.fontSize,
                    ),
                    const SizedBox(height: 8.0),
                    const ShimmerLoading(height: 150.0),
                    const SizedBox(height: 8.0),
                    ShimmerLoading(
                      height: textTheme.subtitle2?.fontSize,
                    ),
                    const SizedBox(height: 4.0),
                    ShimmerLoading(
                      height: textTheme.subtitle2?.fontSize,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomMenuIndex: 0,
    );
  }
}
