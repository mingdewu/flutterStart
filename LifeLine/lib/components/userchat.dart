import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatUserLIst extends StatefulWidget {
  // const ChatUserLIst({super.key});
  String text;
  String secondaryText;
  String image;
  String time;

  ChatUserLIst(
      {super.key,
      required this.text,
      required this.secondaryText,
      required this.image,
      required this.time});
  @override
  State<ChatUserLIst> createState() => _ChatUserLIstState();
}

class _ChatUserLIstState extends State<ChatUserLIst> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              maxRadius: 30,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.text),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.secondaryText,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                )
              ],
            )
          ]),
          Text(
            widget.time,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }
}
