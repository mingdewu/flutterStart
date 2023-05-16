import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lifeline/components/chat_bubble.dart';
import 'package:lifeline/components/chat_message.dart';

import 'chat_detail_page_appbar.dart';

enum MessageType{
  Sender,
  Receiver,
}

class ChatDetailPage extends StatelessWidget {
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "I'm fine, Working from home", type: MessageType.Receiver),
    ChatMessage(message: "Oh! Nice. Same here man", type: MessageType.Sender),
  ];
  List<SendMenuItems> menuItems = [
    SendMenuItems(text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailPageAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return ChatBubble(
                
              )
            }),
          Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 16,right: 16,bottom: 8),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Row(children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius:BorderRadius.circular(30),
                ),
                child: Icon(Icons.add,color:Colors.white,size:21,),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type message...",
                    hintStyle:TextStyle(color:Colors.grey.shade500),
                    border: InputBorder.none
                  ),
                ),
              )
            ]),
          ),
        ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          child: FloatingActionButton(
            onPressed:(){},
          ), ),
      )
      ],
      ),
    );
  }
}