import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/studiku_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/studiku/components/card_subject.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

class MainView extends GetView<StudikuController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      backgroundColor: Themes.lightTheme.backgroundColor,
      appBar: const KGAppBar(
        backButton: false,
        title: 'Studi-Ku',
        withIconKG: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            height: 50,
            child: Text(
              'Mata Kuliah',
              style: Themes.lightTheme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) {
                return state!.isEmpty
                    ? Center(
                        child: Text(
                          'Anda belum mengambil matakuliah, silahkan daftar matakuliah di menu Silabus',
                          style: Themes.lightTheme.textTheme.headline6,
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CardSubject(
                            arguments: [
                              state[index].item.subjectId,
                              state[index].item.subject.name,
                              state[index].item.subject.subjectCode,
                              state[index].item.subject.thumbnailLink,
                            ],
                            kodeMK: state[index].item.subject.subjectCode,
                            jmlMhs: state[index].studentCount,
                            nameMK: state[index].item.subject.name,
                            nameDosen: state[index].lecturers.first,
                            sks: state[index].item.subject.credit,
                            type: 'Wajib',
                            progress: state[index].progress,
                          );
                        },
                      );
              },
              onLoading: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: const ShimmerLoading(),
                  );
                },
                itemCount: 4,
              ),
              onError: (error) {
                return Container(
                  height: Get.height,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Error.png',
                        fit: BoxFit.cover,
                        height: 100,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Maaf sepertinya terdapat kesalahan $error, silahkan refresh halaman ini',
                          style: Themes.lightTheme.textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomMenuIndex: 1,
    );
  }
}
