import 'dart:convert';
import 'dart:io';

import 'package:cupidum_app/app/models/user/gender.dart';
import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/app/models/user/objective.dart';
import 'package:cupidum_app/app/models/user/school.dart';
import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:cupidum_app/globals/overlays/snackbar.dart';
import 'package:cupidum_app/utils/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserController extends ControllerTemplate {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final UserProvider _provider = UserProvider();

  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> userImage = Rx<XFile?>(null);

  DateTime? bornDate;
  String? name;
  String? description;
  Objective? objective;
  Gender? gender;
  List<Hobby> hobbies = List.empty(growable: true);
  School? school;

  nextPage() => pageController.animateToPage(
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
    this.name = "$name $lastName";
    if (bornDate != null && userImage.value != null) {
      nextPage();
    } else {
      snackbarMessage(
        "Favor de llenar los campos",
        "Creo que olvidaste llenar algunos campos",
      );
    }
  }

  saveObjectiveInfo() {
    if (objective != null) {
      nextPage();
    } else {
      snackbarMessage(
        "Campo vacío",
        "Favor de elegir antes un campo antes de continuar",
      );
    }
  }

  saveGenderInfo() {
    if (gender != null) {
      nextPage();
    } else {
      snackbarMessage(
        "Campo vacío",
        "Favor de elegir antes un campo antes de continuar",
      );
    }
  }

  saveHobbiesInfo() {
    if (hobbies.length >= 3) {
      nextPage();
    } else {
      snackbarMessage(
        "Favor de seleccionar al menos cinco Hobbies",
        "Necesitamos saber tus gustos para poder buscar personas con tus mismos gustos",
      );
    }
  }

  saveAboutInfo(String desc) async {
    openLoadingDialog("Creando perfil");
    description = desc;
    if (school != null) {
      User user = User(
        uid: Get.find<AuthenticationController>().userUID!,
        name: name!,
        description: description!,
        gender: gender!,
        objective: objective!,
        bornDate: bornDate!,
        age: calculateAge(bornDate!),
        school: school!,
        hobbies: hobbies,
        image: base64Encode(await userImage.value!.readAsBytes()),
      );
      await call(
        httpCall: () => _provider.createUser(user),
        onSuccess: (value) {
          Get.back();
          Get.toNamed(Routes.main);
        },
        onCallError: (exception) {
          Get.back();
          snackbarMessage("Ocurrio un error", value.toString());
        },
        onError: (exception) {
          Get.back();
          snackbarMessage("Ocurrio un error", value.toString());
        },
      );
    } else {
      snackbarMessage(
        "Favor de ingresar una escuela",
        "Creo que olvidaste colocar tu facultad",
      );
    }
  }

  setBornDate(DateTime date) => bornDate = date;

  setUserProfileImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 75,
    );
    if (image != null) {
      userImage(image);
    }
  }
}
