import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/themes/themes_controller.dart';

class ToggleTema extends StatelessWidget {
  ToggleTema({Key? key}) : super(key: key);
  final ThemesController _themesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlutterSwitch(
            activeColor: Colors.grey,
            inactiveColor: Colors.grey,
            activeText: "Dark",
            inactiveText: "Light",
            value: _themesController.isActive.value,
            valueFontSize: 10.0,
            width: 70,
            borderRadius: 30.0,
            showOnOff: true,
            onToggle: (val) {
              _themesController.isActive.value = val;
              _themesController.setToggle(val);

              val == false
                  ? _themesController.setTheme('light')
                  : _themesController.setTheme('dark');
            },
          ),
        ],
      ),
    );
  }
}
