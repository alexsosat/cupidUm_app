import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/controllers/profile_edit_controller.dart';
import 'package:cupidum_app/globals/overlays/bottomsheet.dart';

class UserImageEditPicker extends GetView<ProfileEditController> {
  final String image;
  const UserImageEditPicker({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openBottomSheet(
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () => controller.setUserProfileImage(ImageSource.camera),
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text("Tomar foto"),
            ),
            ListTile(
              onTap: () => controller.setUserProfileImage(ImageSource.gallery),
              leading: const Icon(Icons.collections),
              title: const Text("Escoger de la galería"),
            ),
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 135,
          height: 135,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: Obx(() {
                  if (controller.userImage.value != null) {
                    return Image.file(
                      File(controller.userImage.value!.path),
                      height: 125,
                      width: 125,
                      fit: BoxFit.cover,
                    );
                  }
                  return Image.memory(
                    base64Decode(image),
                    height: 125,
                    width: 125,
                    fit: BoxFit.cover,
                  );
                }),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                  ),
                  child: const Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
