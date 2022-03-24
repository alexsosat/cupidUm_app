import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/hobby_select_controller.dart';
import 'package:get/get.dart';

class InterestsEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HobbySelectController());
  }
}
