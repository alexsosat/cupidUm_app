import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends ControllerTemplate<User> {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
  final _provider = UserProvider();
  final oriPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

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
    await call<User>(
      httpCall: () => _provider.getUser(),
      onSuccess: (user) {
        change(user, status: RxStatus.success());
      },
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
  }

  void changePasswordFirebase() async {
    print("hey");
    fb.User? user = _auth.currentUser;
    final cred = fb.EmailAuthProvider.credential(
        email: user!.email!, password: oriPasswordController.text);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPasswordController.text).then((_) {
        print("successfully changed the password");
      }).catchError((error) {
        Get.snackbar(
          "Error al actualizar contraseña",
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    }).catchError((err) {
      Get.snackbar(
        "Error al reautenticar",
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}
