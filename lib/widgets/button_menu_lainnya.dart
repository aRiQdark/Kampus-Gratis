import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonMenuLainnya extends StatelessWidget {
  final String imgAssets;
  final String title;
  final String subtitle;
  final String routes;
  const ButtonMenuLainnya({
    Key? key,
    required this.imgAssets,
    required this.title,
    required this.subtitle,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(routes),
      leading: Image.asset(
        imgAssets,
        width: 32,
        height: 32,
        fit: BoxFit.contain,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
