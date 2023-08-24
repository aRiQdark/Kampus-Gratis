import 'package:flutter/material.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/views/nilai_sertifikat/component/chart_nilai.dart';

class NilaiTab extends StatelessWidget {
  const NilaiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const <Widget>[
              Icon(Icons.circle, color: Color(0xff3AAA35),size: 15),
              SizedBox(width: 6,),
              Text(
                "Rangkuman Nilai",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Color(0Xff106FA4),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const LineChartWidget(),
          const SizedBox(height: 30,),
          Column(
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(100),
                  2: FixedColumnWidth(50),
                  3: FlexColumnWidth()
                },
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106FA4),
                        child: Text(
                          "SKS Diambil",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106fa4),
                        child: Text(
                          "SKS Lulus",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: const Color(0XFF106fa4),
                        child: Text(
                          "IPK",
                          style: Themes.lightTheme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Table(
                      border: TableBorder.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const <int, TableColumnWidth>{
                        1: FixedColumnWidth(100),
                        2: FixedColumnWidth(50),
                        3: FlexColumnWidth()
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                height: 10,
                                child: Text(
                                  ' 144',
                                  style: Themes
                                      .lightTheme.textTheme.subtitle2!
                                      .copyWith(fontSize: 10),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Text(
                              "121",
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "3.5",
                              style: Themes.lightTheme.textTheme.subtitle2!
                                  .copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ]);
                },
              ),
            ],
          ),
          const SizedBox(height: 30,),
          SizedBox(
            width: 150,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/nilai/list');
              },
              child: const Text("Lihat Detail Nilai"),
            ),
          )
        ],
      ),
    );
  }
}
