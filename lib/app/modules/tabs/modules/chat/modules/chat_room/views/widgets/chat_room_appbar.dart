import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomAppbar extends StatelessWidget {
  const ChatRoomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text(
              "Adriana",
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CircleAvatar(
              child: Text("AS"),
            ),
          ],
        ),
      ),
    );
    // return AppBar(
    //   leading: OutlinedButton(
    //     style: OutlinedButton.styleFrom(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //       minimumSize: const Size(50, 50),
    //     ),
    //     onPressed: () => Get.back(),
    //     child: const Icon(Icons.chevron_left),
    //   ),
    //   title: Text(
    //     "Adriana",
    //     style: TextStyle(
    //       color: Get.isDarkMode ? Colors.white : Colors.black,
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   elevation: 0,
    //   backgroundColor: Colors.transparent,
    // );
  }
}
