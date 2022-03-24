import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/hobby_select_controller.dart';
import 'package:get/get.dart';

import '../controllers/school_select_controller.dart';

class CreateUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUserController>(
      () => CreateUserController(),
    );
    Get.lazyPut<HobbySelectController>(
      () => HobbySelectController(),
    );

    Get.lazyPut<SchoolSelectController>(
      () => SchoolSelectController(),
    );
  }
}
