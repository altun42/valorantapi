import 'package:get/get.dart';
import 'package:valorantapi/modules/homeDetail/home_detail_binding.dart';
import 'package:valorantapi/modules/homeDetail/home_detail_secreen.dart';

import '../modules/home/home_screen.dart';
import '../modules/home/home_screen_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () =>  HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: Routes.HOMEDETAIL,
        page: () =>  HomeDetailScreen(),
        binding: HomeDetailBinding()),
  ];
}
