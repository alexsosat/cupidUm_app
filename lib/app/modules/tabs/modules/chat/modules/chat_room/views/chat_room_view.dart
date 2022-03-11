import 'package:cupidum_app/app/modules/tabs/modules/chat/modules/chat_room/views/widgets/chat_message.dart';
import 'package:cupidum_app/app/modules/tabs/modules/chat/modules/chat_room/views/widgets/chat_room_appbar.dart';
import 'package:flutter/material.dart';

class ChatRoomView extends StatefulWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView>
    with TickerProviderStateMixin {
  final _inputController = TextEditingController();
  final _focusNode = FocusNode();

  bool _isWriting = false;

  List<ChatMessage> _messages = [];

  @override
  void dispose() {
    //TODO: off socket
    _inputController.dispose();
    _focusNode.dispose();
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight + 40),
        child: ChatRoomAppbar(),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
              reverse: true,
            ),
          ),
          const Divider(height: 1),
          _inputChat(),
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _inputController,
                onSubmitted: _handleSubmit,
                textInputAction: TextInputAction.send,
                onChanged: (value) {
                  setState(() {
                    _isWriting = value.isNotEmpty;
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: "Enviar mensaje"),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: _isWriting
                        ? () => _handleSubmit(_inputController.text.trim())
                        : null,
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String value) {
    if (value.isEmpty) return;

    final newMessage = ChatMessage(
      message: value,
      uid: "123",
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );

    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;

      _inputController.clear();
      _focusNode.requestFocus();
    });
  }
}
