import 'package:chat_bloc/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ExChatButton extends StatelessWidget {
  const ExChatButton({
    super.key,
    required this.chatId,
    required this.userId,
    this.isUserId = false,
  });
  final String chatId;
  final String userId;
  final bool isUserId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              chatId: chatId,
              userId: userId,
            ),
          ),
        );
      },
      child: Text(chatId),
    );
  }
}
