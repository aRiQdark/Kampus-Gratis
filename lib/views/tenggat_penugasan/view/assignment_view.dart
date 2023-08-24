import 'package:flutter/material.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/tenggat_penugasan/view/assigned_tab_view.dart';
import 'package:kampus_gratis/views/tenggat_penugasan/view/finished_tab_view.dart';
import 'package:kampus_gratis/views/tenggat_penugasan/view/grading_tab_view.dart';
import 'package:kampus_gratis/views/tenggat_penugasan/view/late_tab_view.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class AssignmentView extends StatelessWidget {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      backgroundColor: Themes.lightTheme.backgroundColor,
      appBar: const KGAppBar(
        backButton: false,
        title: 'Penugasan',
        withIconKG: true,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: TabBar(
                  labelColor: Themes.lightTheme.primaryColor,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Themes.lightTheme.primaryColor,
                  indicatorWeight: 3,
                  tabs: const [
                    Tab(
                      icon: Text(
                        'Ditugaskan',
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Terlambat',
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Penilaian',
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Selesai',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  AssignedTabView(),
                  LateTabView(),
                  GradingTabView(),
                  FinishedTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomMenuIndex: 2,
    );
  }
}
