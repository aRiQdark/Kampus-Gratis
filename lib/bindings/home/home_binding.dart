// import 'package:get/get.dart';
// import 'package:kampus_gratis/controllers/artikel/artikel_controller.dart';
// import 'package:kampus_gratis/controllers/beranda/beranda_controller.dart';
// import 'package:kampus_gratis/controllers/bottom%20navbar/bottom_navbar_controller.dart';
// import 'package:kampus_gratis/controllers/iklan/iklan_controller.dart';
// import 'package:kampus_gratis/controllers/login/login_controller.dart';
// import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
// import 'package:kampus_gratis/services/providers/artikel/artikel_provider.dart';
// import 'package:kampus_gratis/services/providers/auth/auth_provider.dart';
// import 'package:kampus_gratis/services/providers/iklan/iklan_provider.dart';
// import 'package:kampus_gratis/services/providers/users/users_provider.dart';
// import 'package:kampus_gratis/services/repository/artikel/artikel_repository.dart';
// import 'package:kampus_gratis/services/repository/auth/auth_repository.dart';
// import 'package:kampus_gratis/services/repository/iklan/iklan_repository.dart';
// import 'package:kampus_gratis/services/repository/users/users_repository.dart';

// class HomeBinding implements Bindings {
//   @override
//   void dependencies() {
//     //repository
//     Get.lazyPut<ArtikelRepository>(() => ArtikelRepository(Get.find()));
//     Get.lazyPut<IklanRepository>(() => IklanRepository(Get.find()));
//     Get.lazyPut<UsersRepository>(() => UsersRepository(Get.find()));

//     //provider
//     Get.lazyPut<ArtikelProvider>(() => ArtikelProvider(Get.find()));
//     Get.lazyPut<IklanProvider>(() => IklanProvider(Get.find()));
//     Get.lazyPut<UsersProvider>(() => UsersProvider(Get.find()));

//     // sementara
//     Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find()));
//     Get.lazyPut<AuthProvider>(() => AuthProvider(Get.find()));
//     Get.lazyPut<LoginController>(() => LoginController(Get.find()));

//     //controller
//     Get.lazyPut<BerandaController>(() => BerandaController(Get.find()));
//     Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
//     Get.lazyPut<IklanController>(() => IklanController(Get.find()));
//     Get.lazyPut<ArtikelController>(() => ArtikelController(Get.find()));
//     Get.lazyPut<ProfilController>(() => ProfilController(Get.find()));
//   }
// }
