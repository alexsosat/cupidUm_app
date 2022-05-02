import 'dart:convert';

import 'package:cupidum_app/app/modules/tabs/modules/matches/controllers/matches_list_controller.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchesList extends GetView<MatchesListController> {
  const MatchesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Matches",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: controller.obx(
              (matches) => ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: matches!.length,
                itemBuilder: (context, index) => ListTile(
                  minVerticalPadding: 20,
                  title: Text(matches[index].name),
                  leading: CircleAvatar(
                    backgroundImage:
                        MemoryImage(base64Decode(matches[index].image)),
                  ),
                  trailing: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  onTap: () {
                    controller.loadUser(matches[index].uid);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
