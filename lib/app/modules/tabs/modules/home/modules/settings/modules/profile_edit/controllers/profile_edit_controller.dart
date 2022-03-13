import 'dart:convert';

import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/controllers/settings_controller.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:cupidum_app/globals/overlays/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditController extends ControllerTemplate {
  final UserProvider _provider = UserProvider();
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> userImage = Rx<XFile?>(null);

  setUserProfileImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 75,
    );
    if (image != null) {
      await call(
        httpCall: () async => _provider.updateUser({
          "image": base64Encode(await image.readAsBytes()),
        }),
        onSuccess: (data) => openDialogWindow(
            title: "Imagen de perfil modificada correctamente",
            message: "Se ha modificado tu foto de perfil"),
        onCallError: (e) => snackbarMessage(
          "Error al modificar la imagen",
          e.toString(),
        ),
        onError: (e) => snackbarMessage(
          "Error al modificar la imagen",
          e.toString(),
        ),
      );
      Get.find<HomeController>().refreshContent();
      Get.find<SettingsController>().refreshContent();
      userImage(image);
    }
  }
}
