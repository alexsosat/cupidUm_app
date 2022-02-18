import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:get/get.dart';

class CreateUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUserController>(
      () => CreateUserController(),
    );
  }
}
