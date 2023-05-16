// import 'package:lifeline/models/local_message.dart';

// abstract class BaseViewModel {
//   IDatasource _datasource;
//   BaseViewModel(this._datasource);

//   Future<void> addMessage(LocalMessage message) async {
//     if (!_isExistingChat(message.chatId)) await _createNewChat(message.chatId);
//     await _datasource.addMessage(message);
//   }

//   Future<bool> _isExistingChat(String chatId) async {
//     return await _datasource.findCHat(chatId) != null;
//   }

//   Future<void> _createNewChat(String chatId) async{
//     final chat = Chat(chatId);
//     await
//   }
// }
