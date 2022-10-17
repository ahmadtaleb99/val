part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}



class  PictureSendRequested extends ChatEvent{
  @override
  List<Object?> get props => [];
}

class  MessageSent extends ChatEvent{
  final Message message;

  const MessageSent(this.message);

  @override
  List<Object?> get props => [];
}


class  MessageWritten extends ChatEvent{
  final String message;
  @override
  List<Object?> get props => [message];

  MessageWritten(this.message);
}

class  TypingTextFieldBecameEmpty extends ChatEvent{
  @override
  List<Object?> get props => [];

  TypingTextFieldBecameEmpty();
}



class  ChatMessagesRequested extends ChatEvent{
  @override
  List<Object?> get props => [];
}