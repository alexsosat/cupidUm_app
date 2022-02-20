import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:cupidum_app/globals/overlays/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserController extends GetxController {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> userImage = Rx<XFile?>(null);

  DateTime? bornDate;
  String? name;

  _nextPage() => pageController.animateToPage(
        ++currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );

  previousPage() => pageController.animateToPage(
        --currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );

  saveMainInfo(String name, String lastName) {
    name = "$name $lastName";
    if (bornDate != null) {
      _nextPage();
    } else {
      snackbarMessage(
        "Favor de ingresar una fecha",
        "Creo que olvidaste colocar tu fecha de nacimiento",
      );
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
