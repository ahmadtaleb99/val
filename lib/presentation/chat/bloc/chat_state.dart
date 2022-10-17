part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}


class ChatLoaded extends ChatState {

  final List<Message> messages;
  final List<String> preDefinedMessages;
  final bool isMessageReady;
  final bool isMessageSent;
  final String  currentMsg;
  @override
  List<Object> get props => [preDefinedMessages,currentMsg,messages,isMessageReady,isMessageSent];

  const ChatLoaded({
    required this.messages,
    required this.preDefinedMessages,
    required this.isMessageReady,
    required this.isMessageSent,
    required this.currentMsg,
  });

  ChatLoaded copyWith({
    List<Message>? messages,
    List<String>? preDefinedMessages,
    bool? isMessageReady,
    bool? isMessageSent,
    String? currentMsg,
  }) {
    return ChatLoaded(
      messages: messages ?? this.messages,
      preDefinedMessages: preDefinedMessages ?? this.preDefinedMessages,
      isMessageReady: isMessageReady ?? this.isMessageReady,
      isMessageSent: isMessageSent ?? this.isMessageSent,
      currentMsg: currentMsg ?? this.currentMsg,
    );
  }
}