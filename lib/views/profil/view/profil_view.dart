import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/login/login_controller.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/views/profil/component/profile_widget.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class ProfilView extends GetView<ProfilController> {
  ProfilView({Key? key}) : super(key: key);
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: const KGAppBar(
        backButton: false,
        title: 'Profil',
        withIconKG: true,
      ),
      body: Column(
        children: [
          ProfilWidget(controller),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
              children: [
                ListTile(
                  onTap: () {
                    Get.toNamed('/data-diri');
                  },
                  leading: SvgPicture.asset(
                    "assets/icons/icon_pendaftaran.svg",
                    width: 24,
                    fit: BoxFit.fitWidth,
                  ),
                  title: const Text("Pendaftaran"),
                ),
                const SizedBox(height: kSpacing1),
                ListTile(
                  onTap: () {},
                  leading:
                      SvgPicture.asset("assets/icons/icon_transkipnilai.svg"),
                  title: const Text("Transkip Nilai"),
                ),
                const SizedBox(height: kSpacing1),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset("assets/icons/icon_keamanan.svg"),
                  title: const Text("Keamanan"),
                ),
                const SizedBox(height: kSpacing1),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset("assets/icons/icon_pengaturan.svg"),
                  title: const Text("Pengaturan"),
                ),
                const SizedBox(height: kSpacing1),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset("assets/icons/icon_konsultasi.svg"),
                  title: const Text("Konsultasi dan Layanan"),
                ),
                const SizedBox(height: kSpacing1),
                ListTile(
                  onTap: () {
                    _loginController.signOut();
                  },
                  leading: SvgPicture.asset("assets/icons/icon_logout.svg"),
                  title: const Text("Keluar"),
                ),
              ],
            ),
          )
        ],
      ),
      bottomMenuIndex: 3,
    );
  }
}
