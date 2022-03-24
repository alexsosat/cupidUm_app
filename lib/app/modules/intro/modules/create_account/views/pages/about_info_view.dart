import 'package:cupidum_app/app/models/user/school.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/school_select_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/create_appbar.dart';
import 'package:cupidum_app/globals/buttons/dropdown/dropdown_button.dart';
import 'package:cupidum_app/globals/buttons/dropdown/dropdown_item.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/round_outlined_textfields.dart';

class AboutInfoView extends GetView<SchoolSelectController> {
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_AboutInfoFormState');
  AboutInfoView({Key? key}) : super(key: key);

  _onNextPage() {
    if (_formKey.currentState!.validate()) {
      Get.find<CreateUserController>()
          .saveAboutInfo(_descriptionController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CreateUserAppBar(
          showLeading: true,
          onNext: () => _onNextPage(),
        ),
      ),
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
                onChange: (school) =>
                    Get.find<CreateUserController>().school = school.value,
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
