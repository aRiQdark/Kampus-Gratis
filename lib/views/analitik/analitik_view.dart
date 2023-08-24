import 'package:d_chart/d_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AnalitikView extends StatelessWidget {
  const AnalitikView({super.key});

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff106FA4),
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('Semester 1', style: style);
        break;
      case 7:
        text = const Text('Semester 2', style: style);
        break;
      case 12:
        text = const Text('Semester 3', style: style);
        break;

      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '4';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff106FA4),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Analitik',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [Image.asset('assets/images/LOGO-01.png')],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Nama',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Jimmy Soedibjoe',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: const [
                  Text(
                    'Semester',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 64,
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    '2 (2022-2023)',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: const [
                  Text(
                    'Program Studi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'POB',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: const [
                  Text(
                    'Jumlah SKS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    '24 Sks',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: const [
                  Text(
                    'Jumlah Prodi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 42,
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Rendy S.kom, M.Kom',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 43,
              ),
              Row(
                children: [
                  Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    'Performa semester ini',
                    style: TextStyle(
                      color: Color(0xff106FA4),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Align(
                child: CircularPercentIndicator(
                  radius: 100,
                  lineWidth: 20,
                  percent: 0.9,
                  center: const Text(
                    "100%",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  linearGradient: const LinearGradient(
                    colors: [
                      Color(0xFFFDB415),
                      Color(0xFFE5F52F),
                      Color(0xFF16D3FD),
                    ],
                    stops: [0.3, 0.6, 0.9],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  animation: true,
                  animationDuration: 1500,
                  curve: Curves.easeIn,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 1,
                color: const Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    'Analisa performa mahasiswa',
                    style: TextStyle(
                      color: Color(0xff106FA4),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 300,
                child: DChartLine(
                  pointColor: (lineData, index, id) {
                    return Colors.black;
                  },
                  includePoints: true,
                  includeArea: true,
                  data: const [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 1, 'measure': 3},
                        {'domain': 2, 'measure': 2.5},
                        {'domain': 3, 'measure': 1},
                      ],
                    },
                  ],
                  lineColor: (lineData, index, id) => const Color(0xff0E9CFF),
                ),
              ),
              // SizedBox(
              //   height: 300,
              //   child: LineChart(
              //     LineChartData(
              //       lineTouchData: LineTouchData(
              //         handleBuiltInTouches: true,
              //         touchTooltipData: LineTouchTooltipData(
              //           tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
              //         ),
              //       ),
              //       gridData: FlGridData(show: false),
              //       titlesData: FlTitlesData(
              //         bottomTitles: AxisTitles(
              //           sideTitles: SideTitles(
              //             showTitles: true,
              //             reservedSize: 32,
              //             interval: 1,
              //             getTitlesWidget: bottomTitleWidgets,
              //           ),
              //         ),
              //         rightTitles: AxisTitles(
              //           sideTitles: SideTitles(showTitles: false),
              //         ),
              //         topTitles: AxisTitles(
              //           sideTitles: SideTitles(showTitles: false),
              //         ),
              //         leftTitles: AxisTitles(
              //           sideTitles: SideTitles(
              //             getTitlesWidget: leftTitleWidgets,
              //             showTitles: true,
              //             interval: 1,
              //             reservedSize: 40,
              //           ),
              //         ),
              //       ),
              //       borderData: FlBorderData(
              //         show: true,
              //       ),
              //       lineBarsData: [
              //         LineChartBarData(
              //           isCurved: false,
              //           color: const Color(0xff4af699),
              //           barWidth: 3,
              //           isStrokeCapRound: false,
              //           dotData: FlDotData(show: false),
              //           belowBarData: BarAreaData(show: false),
              //           spots: const [
              //             FlSpot(1, 1),
              //             FlSpot(2, 1.5),
              //             FlSpot(5, 1.4),
              //             FlSpot(7, 3.4),
              //             FlSpot(10, 2),
              //             FlSpot(12, 2.2),
              //             FlSpot(13, 1.8),
              //           ],
              //         )
              //       ],
              //       minX: 0,
              //       maxX: 14,
              //       maxY: 4,
              //       minY: 0,
              //     ),
              //     swapAnimationDuration:
              //         const Duration(milliseconds: 150), // Optional
              //     swapAnimationCurve: Curves.linear, // Optional
              //   ),
              // ),
              Container(
                height: 1,
                color: const Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    'Analisa performa mahasiswa',
                    style: TextStyle(
                      color: Color(0xff106FA4),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quiz',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.8,
                        backgroundColor: Colors.white,
                        progressColor: const Color(0xff3EB449),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '80 %',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        'Tugas',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.75,
                        backgroundColor: Colors.white,
                        progressColor: const Color(0xff078A49),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '75 %',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        'UAS',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.6,
                        backgroundColor: Colors.white,
                        progressColor: const Color(0XFF2A94AF),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '60 %',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        'UTS',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.6,
                        backgroundColor: Colors.white,
                        progressColor: const Color(0XFF106FA4),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '60 %',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Container(
                  height: 35,
                  width: 154,
                  decoration: BoxDecoration(
                    color: const Color(0xff3AAA35),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'Unduh Detail Analitik',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
