import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/hobby_selection.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/controllers/profile_edit_controller.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestsInfoEditView extends StatefulWidget {
  const InterestsInfoEditView({Key? key}) : super(key: key);

  @override
  State<InterestsInfoEditView> createState() => _InterestsInfoEditViewState();
}

class _InterestsInfoEditViewState extends State<InterestsInfoEditView> {
  final controller = Get.find<ProfileEditController>();

  @override
  void initState() {
    controller.newUser.hobbies = [];
    super.initState();
  }

  @override
  void dispose() {
    controller.newUser.hobbies = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlexListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: const Size(50, 50),
            ),
            onPressed: () => Get.back(),
            child: const Icon(Icons.chevron_left),
          ),
          Text(
            "Tus intereses",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 15),
          Text(
            "Seleccione algunos de sus intereses y deje que todos sepan lo que le apasiona.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 35),
          HobbySelection(
            onItemSelect:
                (index, half, isSecondColumn, hobby, hobbyController) {
              int getIndex = isSecondColumn ? index + half : index;

              if (hobbyController.hobbySelected[getIndex]) {
                controller.newUser.hobbies!.add(hobby);
              } else {
                controller.newUser.hobbies!.remove(hobby);
              }
            },
          ),
          const Expanded(child: SizedBox()),
          PillButton(
            child: const Text("GUARDAR"),
            onPressed: () => controller.updateUser(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
