import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';
import 'package:string_capitalize/string_capitalize.dart';

class ProfilWidget extends GetView<ProfilController> {
  const ProfilWidget(this.controller, {Key? key}) : super(key: key);

  @override
  final ProfilController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => Get.toNamed('/profil/edit'),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          color: ColorConstants.mainColorBlue,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(1, 5),
          //     blurRadius: 6,
          //     color: Get.isDarkMode ? ColorConstants.gray50 : ColorConstants.gray200,
          //   ),
          // ],
        ),
        child: controller.obx((data) {
          return Column(
            children: <Widget>[
              // CircleAvatar(
              //   radius: 48.0,
              //   child: data?.displayPictureLink != null
              //       ? FadeInImage.assetNetwork(
              //           placeholder: 'assets/images/person2.png',
              //           image: '${data?.displayPictureLink}',
              //           fit: BoxFit.cover,
              //         )
              //       : Image.asset(
              //           'assets/images/person2.png',
              //           fit: BoxFit.cover,
              //         ),
              // ),
              CircleAvatar(
                radius: 48.0,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(48.0),
                    child: data?.displayPictureLink != null
                        ? Image.network(
                            '${data?.displayPictureLink}',
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/person2.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text('${data?.role}'.capitalizeEach(),
                  style:
                      theme.textTheme.bodyText2?.copyWith(color: Colors.white)),
              const SizedBox(height: 8.0),
              Text(
                '${data?.fullName}'.capitalizeEach(),
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle1?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${data?.email}',
                style: theme.textTheme.bodyText2?.copyWith(color: Colors.white),
              ),
            ],
          );
        },
            onLoading: Column(
              children: <Widget>[
                const ShimmerLoading(
                  shape: ShimmerShape.circle,
                  radius: 48.0,
                ),
                const SizedBox(height: 16.0),
                ShimmerLoading(
                  height: theme.textTheme.subtitle1?.fontSize,
                  width: 8 * 16,
                ),
                const SizedBox(height: 8.0),
                ShimmerLoading(
                  height: theme.textTheme.bodyText2?.fontSize,
                  width: 8 * 24,
                ),
                const SizedBox(height: 8.0),
                ShimmerLoading(
                  height: theme.textTheme.bodyText2?.fontSize,
                  width: 8 * 8,
                ),
              ],
            )),
      ),
    );
  }
}
