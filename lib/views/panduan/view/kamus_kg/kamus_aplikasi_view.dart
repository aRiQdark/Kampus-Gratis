import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_kamus_kg_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';

class KamusAplikasi extends GetView<PanduanKamusKGController> {
  const KamusAplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments[0] == 'application' ? 'Kamus Aplikasi' : 'Glosarium',
          style: Themes.darkTheme.textTheme.headline6!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2995B2),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: TextFormField(
                controller: controller.searchController,
                onChanged: (value) {
                  if (value == '') {
                    controller.getAllPanduanKamus(
                      Get.arguments[0],
                      '',
                    );
                  } else {
                    controller.getAllPanduanKamus(
                      Get.arguments[0],
                      controller.searchController.text,
                    );
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search ',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    height: 2.7,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF2995B2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color(0xFF2995B2),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: controller.obx(
                (data) => ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpansionTile(
                          childrenPadding: const EdgeInsets.all(0),
                          title: Text(
                            '${data![index].word}',
                            style:
                                Themes.lightTheme.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                '${data[index].definition}',
                                style: Themes.lightTheme.textTheme.bodyText2!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   '${data![index].word}',
                        // style:
                        //     Themes.lightTheme.textTheme.bodyText2!.copyWith(
                        //   fontWeight: FontWeight.w600,
                        //   fontSize: 14,
                        //   color: Colors.black,
                        // ),
                        // ),
                        // Text(
                        //   '${data[index].definition}',
                        //   style:
                        //       Themes.lightTheme.textTheme.bodyText2!.copyWith(
                        //     fontWeight: FontWeight.w600,
                        //     fontSize: 14,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        const Divider(thickness: 1.5),
                      ],
                    );
                  },
                  itemCount: data!.length,
                ),
                onEmpty: const Center(
                  child: Text('Tidak ada hasil pencarian'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
