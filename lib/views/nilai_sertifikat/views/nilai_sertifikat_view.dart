import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/sertifikat_controller.dart';
import 'package:kampus_gratis/views/nilai_sertifikat/component/nilai_tab.dart';
import 'package:kampus_gratis/views/nilai_sertifikat/component/sertifikat_tab.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class NilaiSertifikatView extends GetView<SertifikatController> {
  const NilaiSertifikatView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: KGScaffold(
          appBar: const KGAppBar(
              backButton: true, title: "Nilai & Sertifikat", withIconKG: true),
          body: controller.obx(
            (state) => SafeArea(
              child: Column(
                children: const [
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: TabBar(
                      labelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          text: 'Nilai',
                        ),
                        Tab(
                          text: 'Sertifikat',
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 500,
                      child: TabBarView(children: [
                        Tab(
                          child: NilaiTab(),
                        ),
                        Tab(
                          child: SertifikatTab(),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
