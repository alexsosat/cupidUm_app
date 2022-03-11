import 'package:cupidum_app/app/modules/tabs/modules/chat/modules/chat_room/views/widgets/chat_room_appbar.dart';
import 'package:flutter/material.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight + 40),
        child: ChatRoomAppbar(),
      ),
    );
  }
}
