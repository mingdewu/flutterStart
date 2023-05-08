import 'package:chat/src/models/message.dart';

abstract class IMessageService {
  Future<bool> send(Message message);
  Stream<Message> message({
    required User activeUser
  })
}
