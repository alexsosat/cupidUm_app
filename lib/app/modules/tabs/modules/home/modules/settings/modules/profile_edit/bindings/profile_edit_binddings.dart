import 'package:get/get.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileEditController());
  }
}
