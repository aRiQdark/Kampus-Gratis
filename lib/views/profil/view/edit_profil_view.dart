import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class EditProfilView extends GetView<ProfilController> {
  EditProfilView({Key? key}) : super(key: key);
  final ProfilController _profilController = Get.find<ProfilController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => controller.isLoading.value
            ? Container(
                color: Colors.black38,
                width: Get.width,
                height: Get.height,
                child: const CircularProgressIndicator.adaptive(),
              )
            : const SizedBox()),
        KGScaffold(
          appBar: const KGAppBar(
              backButton: true, title: "Edit Profil", withIconKG: false),
          body: _profilController.obx(
            (data) => ListView(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     ClipOval(
                //       child: SizedBox(
                //         width: 100,
                //         height: 100,
                //         child: Image.asset("assets/images/Foto Profil.png"),
                //       ),
                //     )
                //   ],
                // ),
                Center(
                  child: CircleAvatar(
                    radius: 56.0,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 48.0,
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48.0),
                              child: data?.displayPictureLink != null
                                  ? Image.network(
                                      '${data?.displayPictureLink}',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/person2.png',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                                onTap: (() {}),
                                child: SvgPicture.asset(
                                    "assets/icons/edit_profil.svg"))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                const Text(
                  'Nama',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                Container(
                  height: 40.0,
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: Colors.black45),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    hint: const Text('Jenis Kelamin'),
                    value: controller.gender,
                    isExpanded: true,
                    items: controller.items
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.setGender(value);
                    },
                  )),
                ),
                TextField(
                  controller: controller.nameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '${data!.fullName}',
                      hintStyle: const TextStyle(fontSize: 20),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      minimumSize: const Size(150, 40)),
                  onPressed: () async {
                    controller.updateProfile();
                  },
                  child: const Text("Simpan"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
