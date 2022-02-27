import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/hobby_selection.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/create_appbar.dart';

class HobbiesInfoView extends GetView<CreateUserController> {
  const HobbiesInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CreateUserAppBar(
          showLeading: true,
          onNext: () => controller.saveHobbiesInfo(),
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
            "Tus intereses",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 15),
          Text(
            "Seleccione algunos de sus intereses y deje que todos sepan lo que le apasiona.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 35),
          HobbySelection(),
          const Expanded(child: SizedBox()),
          PillButton(
            child: const Text("GUARDAR"),
            onPressed: () => controller.saveHobbiesInfo(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
