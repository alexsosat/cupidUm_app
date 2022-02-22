import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/hobby_select_controller.dart';
import 'package:cupidum_app/globals/buttons/select_button_list/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_helper/flutter_icons_helper.dart';
import 'package:get/get.dart';

class HobbySelection extends GetView<HobbySelectController> {
  HobbySelection({Key? key}) : super(key: key);

  final helper = IconHelper();

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (hobbies) {
        final int hobbyHalf = (hobbies!.length / 2).ceil();

        List<Hobby> list1 = hobbies.sublist(0, hobbyHalf);
        List<Hobby> list2 = hobbies.sublist(hobbyHalf, hobbies.length);

        return Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: list1
                      .map((hobby) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SelectableButton(
                              child: Row(
                                children: [
                                  Icon(
                                    helper.getIconByName(hobby.icon),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(hobby.title),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: list2
                      .map((hobby) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SelectableButton(
                              child: Row(
                                children: [
                                  Icon(
                                    helper.getIconByName(hobby.icon),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(hobby.title),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
