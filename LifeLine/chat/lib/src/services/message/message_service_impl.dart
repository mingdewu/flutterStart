import 'package:chat/src/services/message/message_service_contract.dart';
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

class MesssageService implements IMessageService {
  final Connection _connection;
  final Rethinkdb r;

  final _controller = StreamController<Message>();

  MesssageService(this.r, this._connection);
}
