import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String msg;
  final Timestamp time;
  final String userId;
  final String chatId;

  Message({
    required this.msg,
    required this.time,
    required this.userId,
    required this.chatId,
  });

  factory Message.fromDocument(DocumentSnapshot doc) {
    return Message(
      msg: doc['msg'],
      time: doc['time'],
      userId: doc['userId'],
      chatId: doc['chatId'],
    );
  }
}
