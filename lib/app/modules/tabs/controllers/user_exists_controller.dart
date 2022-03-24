import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:get/get.dart';

class UserExistsController extends ControllerTemplate {
  final _provider = UserProvider();

  @override
  void refreshContent() {
    change(null, status: RxStatus.loading());
    loadData();
    super.refreshContent();
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    await call<bool>(
      httpCall: () => _provider.checkIfUserExists(),
      onSuccess: (exists) {
        if (exists) {
          change(null, status: RxStatus.success());
        } else {
          Get.offAllNamed(Routes.register_createUser);
        }
      },
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
  }
}
