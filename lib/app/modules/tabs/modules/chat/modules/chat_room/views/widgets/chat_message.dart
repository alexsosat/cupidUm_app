import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.uid,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: uid == "123" ? _myMessage(context) : _notMyMessage(context),
      ),
    );
  }

  Widget _myMessage(BuildContext context) => Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              )),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _notMyMessage(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
          decoration: const BoxDecoration(
              color: Color(0xffE4E5E8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
          child: Text(
            message,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      );
}
