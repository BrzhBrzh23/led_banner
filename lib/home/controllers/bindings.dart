import 'package:led_banner/home/controllers/editor_controller.dart';
import 'package:get/get.dart';

class EditorBindings implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => EditorController());
  }
}
