import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

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
              "Chat",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: 2,
              itemBuilder: (context, index) => ListTile(
                minVerticalPadding: 20,
                title: const Text("data"),
                leading: const CircleAvatar(
                  child: Text("AS"),
                ),
                trailing: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () => Get.toNamed(Routes.chat("0")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
