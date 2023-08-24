import 'package:flutter/material.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';

class DetailAcaraCard extends StatelessWidget {
  const DetailAcaraCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 33.0),
          child: Container(
            width: 320.0,
            height: 267,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/pp.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Pemateri',
                        style: Themes.lightTheme.textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Ikhsan Rafli Fauzi',
                        style: Themes.lightTheme.textTheme.titleMedium,
                      ),
                      Text(
                        'Founder Plants Rice Company',
                        style: Themes.lightTheme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/taguser.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Kapasitas',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          '100 orang',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: 'Montserrat'),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Image.asset('assets/images/ticket.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          ' harga tiket',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          ' Gratis',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/monitorrecorder.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Jenis Kegiatan',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          'Zoom Meeting',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: 'Montserrat'),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 27,
                    ),
                    Image.asset('assets/images/videotime.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          '13 Desember 2022',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          '19:00 - 21:00 WIB',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 21.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 33.0),
          child: Container(
            width: 320.0,
            height: 267,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 306.63,
                    height: 160.41,
                    child: Image.asset('assets/images/asset-1.png'),
                  ),
                ),
                const SizedBox(
                  height: 11.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Text(
                    'Senin, 12 Desember 2022',
                    style: Themes.lightTheme.textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Text(
                    'Mabim - HMTRPL 2022',
                    style: Themes.lightTheme.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 11),
                  width: 50,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: ColorConstants.green2),
                  child: Center(
                    child: Text(
                      'Gratis',
                      style: Themes.darkTheme.textTheme.bodyMedium,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.31,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Materi Seminar',
            style: Themes.lightTheme.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text.rich(TextSpan(text: '* ', children: [
            TextSpan(
                text: 'Pengembangan softskill',
                style: Themes.lightTheme.textTheme.bodyLarge)
          ])),
        )
      ],
    );
  }
}
