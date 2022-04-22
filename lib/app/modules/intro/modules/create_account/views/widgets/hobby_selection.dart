import 'package:flutter/material.dart';
import 'package:flutter_icons_helper/flutter_icons_helper.dart';
import 'package:get/get.dart';

import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/hobby_select_controller.dart';
import 'package:cupidum_app/globals/buttons/select_button_list/selectable_button.dart';

class HobbySelection extends StatelessWidget {
  final controller = Get.find<HobbySelectController>();
  final helper = IconHelper();

  final Function(int index, int half, bool secondColumn, Hobby hobby,
      HobbySelectController controller) onItemSelect;

  HobbySelection({
    Key? key,
    required this.onItemSelect,
  }) : super(key: key);

  List<Widget> _buildButtons(
      List<Hobby> hobbies, int half, bool isSecondColumn) {
    List<Widget> returnable = List.empty(growable: true);

    for (int i = 0; i < hobbies.length; i++) {
      returnable.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SelectableButton(
            child: Row(
              children: [
                Icon(
                  helper.getIconByName(hobbies[i].icon),
                ),
                const SizedBox(width: 15),
                Flexible(child: Text(hobbies[i].title)),
              ],
            ),
            onPressed: () {
              controller.selectHobby(
                i,
                half,
                isSecondColumn,
                hobbies[i],
              );
              onItemSelect(i, half, isSecondColumn, hobbies[i], controller);
            },
            isActive: isSecondColumn
                ? controller.hobbySelected[i + half]
                : controller.hobbySelected[i],
          ),
        ),
      );
    }

    return returnable;
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (hobbies) {
        final int hobbyHalf = (hobbies!.length / 2).ceil();

        List<Hobby> list1 = hobbies.sublist(0, hobbyHalf);
        List<Hobby> list2 = hobbies.sublist(hobbyHalf, hobbies.length);

        return Obx(() {
          return Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: _buildButtons(list1, hobbyHalf, false),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: _buildButtons(list2, hobbyHalf, true),
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
