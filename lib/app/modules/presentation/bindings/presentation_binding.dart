import 'package:get/get.dart';

import '../controllers/presentation_controller.dart';

class PresentationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresentationController>(() => PresentationController());
  }
}
