import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/message.dart';
import '../repositories/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({required this.chatRepository}) : super(ChatInitial()) {
    on<LoadMessages>((event, emit) async {
      emit(ChatLoading());
      try {
        await emit.forEach<List<Message>>(
          chatRepository.getMessages(event.chatId, event.userId),
          onData: (messages) {
            return ChatLoaded(messages);
          },
          onError: (_, __) {
            return const ChatError("Checking...");
          },
        );
      } catch (_) {
        emit(const ChatError("Failed to load messages"));
      }
    });

    on<SendMessage>((event, emit) async {
      try {
        await chatRepository.sendMessage(
            event.chatId, event.userId, event.message);
      } catch (_) {
        emit(const ChatError("Failed to send message"));
      }
    });
  }
}
