import 'package:get/get.dart';
import 'package:valorantapi/modules/homeDetail/home_detail_controller.dart';

class HomeDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeDetailController>(() => HomeDetailController());
  }

}