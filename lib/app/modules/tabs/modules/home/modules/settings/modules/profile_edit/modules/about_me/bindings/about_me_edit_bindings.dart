import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/school_select_controller.dart';
import 'package:get/get.dart';

class AboutEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchoolSelectController());
  }
}
