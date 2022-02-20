import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/create_appbar.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/date_picker_button.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/image_picker.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/round_outlined_textfields.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:cupidum_app/globals/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainInfoView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_MainInfoFormState');
  MainInfoView({Key? key}) : super(key: key);

  void onNextPressed() {
    if (_formKey.currentState!.validate()) {
      Get.find<CreateUserController>().saveMainInfo(
        _nameController.text,
        _lastNameController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CreateUserAppBar(
          onNext: () => onNextPressed(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: FlexListView(
          scrollPhysics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          children: [
            Text(
              "Perfil",
              style: Theme.of(context).textTheme.headline2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: UserImagePicker(),
            ),
            RoundOutlinedTextField(
              controller: _nameController,
              labelText: "Nombre",
              hintText: "Ej. Javier",
            ),
            RoundOutlinedTextField(
              controller: _lastNameController,
              labelText: "Apellidos",
              hintText: "Ej. Ramon Gonzalez",
              inputAction: TextInputAction.done,
            ),
            const DatePickerButton(),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: PillButton(
                    child: const Text("GUARDAR"),
                    onPressed: () => onNextPressed(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
