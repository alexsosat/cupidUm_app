import 'package:cupidum_app/app/models/user/user.dart';

import 'package:cupidum_app/app/providers/match_provider.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';

import 'package:cupidum_app/globals/controller_template.dart';
import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:cupidum_app/globals/overlays/snackbar.dart';
import 'package:get/get.dart';

class MatchesListController extends ControllerTemplate<List<User>> {
  final _provider = MatchProvider();
  final _userProvider = UserProvider();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void refreshContent() {
    change(null, status: RxStatus.loading());
    loadData();
    super.refreshContent();
  }

  void loadData() async {
    await call<List<User>>(
      httpCall: () => _provider.getUserMatches(),
      onSuccess: (matches) => change(matches, status: RxStatus.success()),
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
  }

  void loadUser(String uid) {
    openLoadingDialog("cargando");
    call<User>(
      httpCall: () => _userProvider.getUser(uid),
      onSuccess: (user) {
        Get.back();
        Get.toNamed(Routes.view_profile, arguments: user);
      },
      onCallError: (error) {
        Get.back();
        snackbarMessage("A ocurrido un error inesperado", error.toString());
      },
      onError: (error) {
        Get.back();
        snackbarMessage("A ocurrido un error inesperado", error.toString());
      },
    );
  }
}
