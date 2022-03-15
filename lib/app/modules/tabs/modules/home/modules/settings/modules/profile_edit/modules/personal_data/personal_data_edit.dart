import 'package:cupidum_app/app/models/user/user_form.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/controllers/profile_edit_controller.dart';
import 'package:cupidum_app/utils/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/date_picker_button.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/round_outlined_textfields.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:get/get.dart';

class PersonalDataEditView extends GetView<ProfileEditController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_MainInfoFormState');
  PersonalDataEditView({Key? key}) : super(key: key);
  void onNextPressed() {
    if (_formKey.currentState!.validate()) {
      controller.newUser = controller.newUser.copyWith(
        name: "${_nameController.text} ${_lastNameController.text}",
      );
      Get.find<ProfileEditController>().updateUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              "Perfil",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            RoundOutlinedTextField(
              controller: _nameController,
              labelText: "Nombre",
              hintText: "Ej. Javier",
              inputAction: TextInputAction.next,
            ),
            RoundOutlinedTextField(
              controller: _lastNameController,
              labelText: "Apellidos",
              hintText: "Ej. Ramon Gonzalez",
              inputAction: TextInputAction.done,
            ),
            DatePickerButton(
              onSave: (date) {
                controller.newUser = UserForm(
                  bornDate: date,
                  age: calculateAge(date),
                );
              },
            ),
            const Expanded(child: SizedBox()),
            PillButton(
              child: const Text("GUARDAR"),
              onPressed: () => onNextPressed(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
