import 'package:cupidum_app/app/models/user/school.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/school_select_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/round_outlined_textfields.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/controllers/profile_edit_controller.dart';
import 'package:cupidum_app/globals/buttons/dropdown/dropdown_button.dart';
import 'package:cupidum_app/globals/buttons/dropdown/dropdown_item.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutInfoEdit extends GetView<SchoolSelectController> {
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_AboutInfoFormState');
  AboutInfoEdit({Key? key}) : super(key: key);

  final profileController = Get.find<ProfileEditController>();
  _onNextPage() {
    if (_formKey.currentState!.validate()) {
      profileController.newUser = profileController.newUser.copyWith(
        description: _descriptionController.text,
      );
      profileController.updateUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (schools) => Form(
          key: _formKey,
          child: FlexListView(
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
              const SizedBox(height: 20),
              Text(
                "Sobre mi",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 35),
              RoundOutlinedTextField(
                controller: _descriptionController,
                labelText: "Descripción",
                hintText: "Ej. Soy una persona amable",
                inputType: TextInputType.multiline,
                inputAction: TextInputAction.done,
                maxLines: 7,
              ),
              const SizedBox(height: 35),
              DropDownButtonOutlined(
                hintText: "Escoge tu facultad",
                onChange: (school) {
                  profileController.newUser.school = school.value;
                },
                values: schools!
                    .map((school) => DropDownItem<School>(
                        title: school.acronym, value: school))
                    .toList(),
              ),
              const Expanded(child: SizedBox()),
              PillButton(
                child: const Text("GUARDAR"),
                onPressed: () => _onNextPage(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
