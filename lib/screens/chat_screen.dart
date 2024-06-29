import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../repositories/chat_repository.dart';
import '../widgets/message_input.dart';
import '../widgets/messages_list.dart';

class ChatScreen extends StatelessWidget {
  final String chatId = "exampleChatId"; // Replace with dynamic chat ID
  final String userId = "exampleUserId"; // Replace with dynamic user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: BlocProvider(
        create: (context) => ChatBloc(chatRepository: ChatRepository())
          ..add(LoadMessages(chatId)),
        child: Column(
          children: [
            Expanded(child: MessagesList(chatId: chatId)),
            MessageInput(chatId: chatId, userId: userId),
          ],
        ),
      ),
    );
  }
}