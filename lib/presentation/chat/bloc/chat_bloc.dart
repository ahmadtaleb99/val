import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:val/domain/model/models.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {


    on<ChatMessagesRequested>(_onChatMessagesRequested);
    on<MessageWritten>(_onMessageWritten);
    on<TypingTextFieldBecameEmpty>(_onTypingTextFieldBecameEmpty);
    on<MessageSent>(_onMessageSent);


  }




  Future<void> _onChatMessagesRequested(
      ChatEvent event, Emitter<ChatState> emit) async {
    emit( const ChatLoaded(messages: [
      // Message(text: 'is the offer still on?', date: '2:51', user: User(name: 'ahmad taleb', id: '0')),
      // Message(text: 'is the offer still on?', date: '2:51', user: User(name: 'ahmad taleb', id: '0')),
      // Message(text: 'is the offer still on?', date: '2:51', user: User(name: 'ahmad taleb', id: '0')),
      // Message(text: 'is the offer still on?', date: '2:51', user: User(name: 'ahmad taleb', id: '0')),
      // Message(text: 'no', date: '2:51', user: User(name: 'test', id: '1')),
    ], isMessageReady: false,isMessageSent:false, currentMsg: '', preDefinedMessages: ['what\'s the price?','Is there delivery?','Is there delivery?','Is there delivery?']));



  } Future<void> _onMessageWritten(
      MessageWritten event, Emitter<ChatState> emit) async {
    final newState = (state as ChatLoaded);
    emit(newState.copyWith(isMessageReady: true,currentMsg: event.message));
  }


  Future<void> _onTypingTextFieldBecameEmpty(
      ChatEvent event, Emitter<ChatState> emit) async {
    final newState = (state as ChatLoaded);
    emit(newState.copyWith(isMessageReady: false));
  }



  Future<void> _onMessageSent(
      MessageSent event, Emitter<ChatState> emit) async {
    final newState = (state as ChatLoaded);
    final messages = List<Message>.from(newState.messages);

    emit(newState.copyWith(messages: messages..add(event.message),isMessageSent: true,isMessageReady: false,currentMsg: ''));

    emit((state as ChatLoaded).copyWith(isMessageSent: false));
  }


}



class Message{
  final String text;
  final String date;
  final User user;
  final String? media;

  const Message({
    required this.text,
    required this.date,
    required this.user,
     this.media,
  });
}