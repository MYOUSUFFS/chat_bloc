import 'package:chat_bloc/widgets/button.dart';
import 'package:flutter/material.dart';

class ForExampleChat extends StatelessWidget {
  const ForExampleChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExChatButton(chatId: 'user1', userId: 'user2', isUserId: true),
            SizedBox(height: 20),
            ExChatButton(chatId: 'user2', userId: 'user1'),
          ],
        ),
      ),
    );
  }
}
