import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';

class MessagesList extends StatelessWidget {
  final String chatId;

  MessagesList({required this.chatId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ChatLoaded) {
          return ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              var message = state.messages[index];
              return ListTile(
                title: Text(message.msg),
                subtitle: Text(message.time.toDate().toString()),
              );
            },
          );
        } else if (state is ChatError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text("No messages"));
      },
    );
  }
}