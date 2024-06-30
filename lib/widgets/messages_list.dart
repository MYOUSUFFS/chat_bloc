// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                var message = state.messages[index];
                bool isSender = message.chatId == chatId;
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: isSender ? 0 : 70,
                      right: isSender ? 70 : 0),
                  decoration: BoxDecoration(
                    color: !isSender
                        ? Colors.green.shade100
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Text(
                        message.msg,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(message.time.toDate().toString()),
                      ),
                    ],
                  ),
                );
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     if (message.chatId == chatId)
                //       Padding(
                //         padding: const EdgeInsets.only(left: 16),
                //         child: Text(message.chatId),
                //       ),
                //     ListTile(
                //       title: Text(message.msg),
                //       subtitle: Text(message.time.toDate().toString()),
                //     ),
                //   ],
                // );
              },
            ),
          );
        } else if (state is ChatError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text("No messages"));
      },
    );
  }
}
