import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/primary_button_icon.dart';

class NotFoundPage extends StatelessWidget {
  final void Function() onPressed;
  final bool isLoading;

  const NotFoundPage(
      {super.key, required this.onPressed, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/404 Error-pana.svg'),
                      const Text(
                        'Koneksi tidak tersedia, pastikan kamu terhubung kembali',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  color: theme.scaffoldBackgroundColor,
                  child: PrimaryButtonIcon(
                    label: 'Muat Ulang',
                    onPressed: onPressed,
                    icon: const Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          ),
          isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: Colors.black38,
                  child: const RefreshProgressIndicator(),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
