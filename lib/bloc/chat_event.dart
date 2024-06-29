import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends ChatEvent {
  final String chatId;

  const LoadMessages(this.chatId);

  @override
  List<Object> get props => [chatId];
}

class SendMessage extends ChatEvent {
  final String chatId;
  final String userId;
  final String message;

  const SendMessage(this.chatId, this.userId, this.message);

  @override
  List<Object> get props => [chatId, userId, message];
}