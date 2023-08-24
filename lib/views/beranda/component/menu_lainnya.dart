import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/button_menu_lainnya.dart';

class MenuLainnya extends StatelessWidget {
  const MenuLainnya({super.key});

  @override
  Widget build(BuildContext context) {
    List<ButtonMenuLainnya> buttonList = const [
      ButtonMenuLainnya(
          imgAssets: 'assets/icons/Simulasi 1.png',
          title: 'Ruang Simulasi',
          subtitle: 'Lorem Ipsum Dolor',
          routes: '/mylearning'),
      ButtonMenuLainnya(
          imgAssets: 'assets/icons/Rencana 2.png',
          title: 'Perencanaan Karir dan Kompetensi',
          subtitle: 'Lorem Ipsum Dolor',
          routes: '/mylearning'),
      ButtonMenuLainnya(
          imgAssets: 'assets/icons/Analisis 1.png',
          title: 'Analytics',
          subtitle: 'Lorem Ipsum Dolor',
          routes: '/mylearning'),
      ButtonMenuLainnya(
          imgAssets: 'assets/icons/Kalender 2.png',
          title: 'Kalender saya',
          subtitle: 'Lorem Ipsum Dolor',
          routes: '/mylearning'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: DraggableScrollableSheet(
        initialChildSize: 0.975,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Fitur Kami Lain-nya',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.separated(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttonList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Row(
                      children: const [
                        SizedBox(width: 72.0),
                        Expanded(child: Divider())
                      ],
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return buttonList[index];
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
