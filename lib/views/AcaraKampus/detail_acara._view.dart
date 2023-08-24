import 'package:flutter/material.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/views/AcaraKampus/Component/detail_acara_card.dart';

import '../../themes/themes.dart';
import '../../widgets/app_bar.dart';

class DetailAcaraView extends StatelessWidget {
  const DetailAcaraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.grey40,
        appBar: const KGAppBar(
          backButton: true,
          title: ' Detail Acara',
          withIconKG: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              const DetailAcaraCard(),
              const SizedBox(
                height: 35.69,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  width: 145,
                  height: 41,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.mainBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0))),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: ColorConstants.grey40,
                            content: Container(
                              width: 325,
                              height: 57,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: ColorConstants.green2,
                              ),
                              child: Row(children: [
                                const SizedBox(
                                  width: 83.0,
                                ),
                                Text(
                                  'Berhasil Mendaftar',
                                  style: Themes.darkTheme.textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  width: 13.0,
                                ),
                                Image.asset('assets/images/checkWhite1.png')
                              ]),
                            )));
                      },
                      child: Text(
                        'Daftar',
                        style: Themes.darkTheme.textTheme.titleMedium,
                      )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }
}
