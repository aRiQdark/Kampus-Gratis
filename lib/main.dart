import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/bindings/app_binding.dart';
import 'package:kampus_gratis/controllers/app_controller.dart';
import 'package:kampus_gratis/controllers/themes/themes_controller.dart';
import 'package:kampus_gratis/firebase_options.dart';
import 'package:kampus_gratis/routes/app_routes.dart';
import 'package:kampus_gratis/themes/app_theme.dart';
import 'package:kampus_gratis/utils/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await FlutterDownloader.initialize(
    debug:
        true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl:
        true, // option: set to false to disable working with http links (default: false)
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemesController themeController = Get.put(ThemesController());
  final AppController _appController =
      Get.put(AppController(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _appController.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: 'Kampus Gratis',
            locale: const Locale('id', 'ID'),
            localizationsDelegates: const [
              // ... app-specific localization delegate[s] here
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('id', 'ID'), // Indonesia
              // ... other locales the app supports
            ],
            debugShowCheckedModeBanner: false,
            getPages: AppRoutes.routes,
            initialRoute: (snapshot.data?.emailVerified == true)
                ? AppRoutes.home
                : AppRoutes.onboarding,

            initialBinding: AppBinding(),
            theme: KGAppTheme.of(context),
            // darkTheme: Themes.darkTheme,
            // themeMode: getThemeMode(themeController.theme),
          );
        } else {
          return const LoadingView();
        }
      },
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}
