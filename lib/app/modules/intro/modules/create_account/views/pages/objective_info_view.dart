import 'package:cupidum_app/app/models/user/objective.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:cupidum_app/globals/buttons/select_button_list/selectable_button_list.dart';
import 'package:cupidum_app/globals/buttons/select_button_list/selectable_item.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/create_appbar.dart';

class ObjectiveInfoView extends GetView<CreateUserController> {
  const ObjectiveInfoView({Key? key}) : super(key: key);

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
      body: FlexListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        children: [
          Text(
            "¿Qué buscas?",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 35),
          SelectableButtonList(
            options: [
              SelectableItem<Objective>(
                title: "Una cita",
                value: Objective.relationship,
              ),
              SelectableItem<Objective>(
                title: "Solo amigos",
                value: Objective.friendship,
              ),
            ],
            onChange: (value) => controller.objective = value as Objective,
          ),
          const Expanded(child: SizedBox()),
          PillButton(
            child: const Text("GUARDAR"),
            onPressed: () => controller.saveObjectiveInfo(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
