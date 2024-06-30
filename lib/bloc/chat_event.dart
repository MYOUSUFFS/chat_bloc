import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends ChatEvent {
  final String chatId;
  final String userId;

  const LoadMessages(this.chatId, this.userId);

  @override
  List<Object> get props => [chatId, userId];
}

class SendMessage extends ChatEvent {
  final String chatId;
  final String userId;
  final String message;

  const SendMessage(this.chatId, this.userId, this.message);

  @override
  List<Object> get props => [chatId, userId, message];
}
