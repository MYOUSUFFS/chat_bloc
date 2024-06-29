import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String msg;
  final Timestamp time;
  final String type;

  Message({
    required this.msg,
    required this.time,
    required this.type,
  });

  factory Message.fromDocument(DocumentSnapshot doc) {
    return Message(
      msg: doc['msg'],
      time: doc['time'],
      type: doc['type'],
    );
  }
}
