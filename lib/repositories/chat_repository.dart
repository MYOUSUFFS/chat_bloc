import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getMessages(String chatId) {
    return _firestore.collection('chats').orderBy('time').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Message.fromDocument(doc)).toList());
  }

  Future<void> sendMessage(String chatId, String userId, String message) {
    return _firestore.collection('chats').doc(chatId).set({
      'msg': message,
      'time': FieldValue.serverTimestamp(),
      'type': userId,
    });
  }
}
