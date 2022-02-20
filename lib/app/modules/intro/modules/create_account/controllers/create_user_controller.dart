import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserController extends GetxController {
  final PageController pageController = PageController();
  final int currentIndex = 0;

  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> userImage = Rx<XFile?>(null);

  DateTime? bornDate;
  String? name;

  saveMainInfo(String name, String lastName) {
    name = "$name $lastName";

    if (bornDate != null) {
      pageController.animateToPage(
        1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    } else {
      openDialogWindow(title: "Favor de ingresar una fecha", message: "");
    }
  }

  setBornDate(DateTime date) => bornDate = date;

  setUserProfileImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      userImage(image);
    }
  }
}
