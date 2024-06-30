// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/message.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _getConversationId(String user1, String user2) {
    print(user1.hashCode);
    print(user2.hashCode);
    return user1.hashCode <= user2.hashCode
        ? '${user1}_$user2'
        : '${user2}_$user1';
  }

  Stream<List<Message>> getMessages(String chatId, String userId) {
    String conversationId = _getConversationId(userId, chatId);
    final re = _firestore
        .collection('chats')
        .doc(conversationId)
        .collection('message')
        .orderBy('time')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromDocument(doc)).toList();
    });
    debugPrint(re.toString());
    return re;
  }

  Future<void> sendMessage(String chatId, String userId, String message) {
    String conversationId = _getConversationId(userId, chatId);
    return _firestore
        .collection('chats')
        .doc(conversationId)
        .collection('message')
        .add({
      'msg': message,
      'time': FieldValue.serverTimestamp(),
      'userId': userId,
      'chatId': chatId,
    });
  }
}
