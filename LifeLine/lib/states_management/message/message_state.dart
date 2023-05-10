abstract class MessageState extends Equatable {
  const MessageState();
  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {}

class MessageSentSuccess extends MessageState {
  final Message message;
  const MessageSentSuccess(this.message);

  @override
  List<Object> get props => [message];
}

