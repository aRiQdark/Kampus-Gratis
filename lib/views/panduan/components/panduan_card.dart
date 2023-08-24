import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class PanduanCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String? url;
  final String? imageLink;
  final String? text;
  final String destination;

  const PanduanCard({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.url,
    this.imageLink,
    this.text,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (destination == '/panduan/video/detail') {
          var arr = url!.split('watch?v=');
          String videoId = arr[1];
          Get.toNamed(
            destination,
            arguments: [id, title, description, icon, videoId, url],
          );
        }

        if (destination == '/panduan/buku/detail') {
          Get.toNamed(
            destination,
            arguments: [id, title, description, icon, imageLink, text],
          );
        }

        // print(
        //     'id : $id\ntitle : $title\ndescription : $description\nurl : $url');
        // String str = 'hello-world-tutorialkart';

        //split string
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            width: 1.5,
            color: Color(0xFF2995B2),
          ),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Text(
            title,
            style: Themes.lightTheme.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(30),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
