import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'chat_detail_page.dart';

class ChatUserLIst extends StatefulWidget {
  // const ChatUserLIst({super.key});
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  ChatUserLIst(
      {super.key,
      required this.text,
      required this.secondaryText,
      required this.image,
      required this.time,
      required this.isMessageRead});
  @override
  State<ChatUserLIst> createState() => _ChatUserLIstState();
}

class _ChatUserLIstState extends State<ChatUserLIst> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage();
        }));
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(widget.image),
                maxRadius: 30,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.text),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.secondaryText,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    )
                  ],
                ),
              ))
            ])),
            Text(
              widget.time,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
  }
}
