import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lifeline/components/chat_message.dart';

enum MessageType{
  Sender,
  Receiver,
}

class ChatBubble extends StatefulWidget {
  ChatMessage chatMessage;
  ChatBubble({required this.chatMessage});
  // const ChatBubble({super.key});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: (
          widget.chatMessage.type == MessageType.Receiver?Alignment.topLeft:Alignment.topRight),
          child: Container(
            color:(widget.chatMessage.type == MessageType.Receiver?Colors.white:Colors.grey.shade400),
            child: Text(widget.chatMessage.message),
          ),),
    );
  }
}
