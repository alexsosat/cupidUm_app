import 'dart:convert';
import 'dart:typed_data';

import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:get/get.dart';

class HomeController extends ControllerTemplate {
  final _provider = UserProvider();
  Uint8List? userImage;
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
    await call<User>(
      httpCall: () => _provider.getUser(),
      onSuccess: (user) {
        userImage = base64Decode(user.image);
      },
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );

    change(null, status: RxStatus.success());
  }
}
