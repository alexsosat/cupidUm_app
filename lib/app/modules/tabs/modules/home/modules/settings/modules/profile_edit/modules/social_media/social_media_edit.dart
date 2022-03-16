import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/controllers/profile_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/round_outlined_textfields.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SocialMediaEditView extends GetView<ProfileEditController> {
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>(debugLabel: '_SocialMediaFormState');
  SocialMediaEditView({Key? key}) : super(key: key);
  void onNextPressed() {
    if (_formKey.currentState!.validate()) {
      controller.newUser = controller.newUser.copyWith(
        instagram: _instagramController.text,
        height: double.tryParse(_heightController.text),
        weight: double.tryParse(_weightController.text),
        phone: _phoneController.text,
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
              "Datos adicionales",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            RoundOutlinedTextField(
              controller: _instagramController,
              labelText: "Instagram",
              hintText: "Ej. @javier89",
              inputAction: TextInputAction.next,
            ),
            RoundOutlinedTextField(
              controller: _heightController,
              labelText: "Altura",
              hintText: "Ej. 1.89",
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
            ),
            RoundOutlinedTextField(
              controller: _weightController,
              labelText: "Peso",
              hintText: "Ej. 60.4",
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
            ),
            RoundOutlinedTextField(
              controller: _phoneController,
              labelText: "Celular",
              hintText: "Ej. 1234567890",
              inputType: TextInputType.phone,
              inputAction: TextInputAction.done,
              formatters: [FilteringTextInputFormatter.digitsOnly],
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
