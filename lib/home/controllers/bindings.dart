import 'package:led_banner/home/controllers/banner_controller.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:get/get.dart';

class EditorBindings implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => EditorController());
    Get.lazyPut(() => BannerController());

  }
}
