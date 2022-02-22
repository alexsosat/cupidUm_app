import 'package:cupidum_app/app/models/user/gender.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/globals/buttons/select_button_list/selectable_button_list.dart';
import 'package:cupidum_app/globals/buttons/select_button_list/selectable_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/create_appbar.dart';

class GenderInfoView extends GetView<CreateUserController> {
  const GenderInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CreateUserAppBar(
          showLeading: true,
          onNext: () => controller.saveObjectiveInfo(),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        children: [
          Text(
            "Género",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 35),
          SelectableButtonList(
            options: [
              SelectableItem<Gender>(
                title: "Mujer",
                value: Gender.female,
              ),
              SelectableItem<Gender>(
                title: "Hombre",
                value: Gender.male,
              ),
              SelectableItem<Gender>(
                title: "Prefiero no decir",
                value: Gender.other,
              ),
            ],
            onChange: (value) => controller.gender = value as Gender,
          ),
        ],
      ),
    );
  }
}
