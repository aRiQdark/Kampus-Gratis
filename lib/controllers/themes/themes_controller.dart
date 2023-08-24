import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemesController extends GetxController {
  final storage = GetStorage();

  var theme = 'light';
  var isActive = false.obs;

  void setToggle(bool val) {
    storage.write('toggle', val);
  }

  void readToggle() {
    isActive.value = storage.read('toggle') ?? true;
  }

  @override
  void onInit() {
    super.onInit();

    getThemeState();
    readToggle();
  }

  getThemeState() {
    if (storage.read('theme') != null) {
      return setTheme(storage.read('theme'));
    }

    setTheme('light');
  }

  void setTheme(String value) {
    theme = value;
    storage.write('theme', value);

    if (value == 'system') Get.changeThemeMode(ThemeMode.system);
    if (value == 'light') Get.changeThemeMode(ThemeMode.light);
    if (value == 'dark') Get.changeThemeMode(ThemeMode.dark);

    update();
  }
}
