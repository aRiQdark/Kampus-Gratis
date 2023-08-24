import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/tenggat_penugasan/tenggat_penugasan_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/tenggat_penugasan/components/assignment_card.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

class AssignedTabView extends GetView<TenggatPenugasanController> {
  const AssignedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => state!.ongoing.isEmpty
          ? Center(
              child: Text(
                'Tidak ada tugas',
                textAlign: TextAlign.center,
                style: Themes.lightTheme.textTheme.headline6,
              ),
            )
          : ListView.builder(
              itemCount: state.ongoing.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return AssignmentCard(
                  arguments: [state.ongoing[index].sessionId],
                  title: '${state.ongoing[index].session.sessionNo}',
                  subject: state.ongoing[index].subject.name,
                  dosen: state.ongoing[index].penugasan.lecturer.user.fullName,
                  titleDosen:
                      state.ongoing[index].penugasan.lecturer.title.join(', '),
                  deadline: state.ongoing[index].deadline,
                  isLate: false,
                  isDone: false,
                  isGrading: false,
                );
              },
            ),
      onLoading: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            padding: const EdgeInsets.symmetric(
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
    );
  }
}
