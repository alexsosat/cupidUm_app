import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/school_select_controller.dart';
import 'package:get/get.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileEditController());
    Get.lazyPut(() => SchoolSelectController());
  }
}
