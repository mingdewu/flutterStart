import 'package:flutter/material.dart';
import 'package:lifeline/colors.dart';
import 'package:lifeline/src/profile_image.dart';

class Chats extends StatefulWidget {
  const Chats();

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (_,index) =>_chatItem(), separatorBuilder: (_,__) =>Divider(), itemCount: 3);
  }

  _chatItem() => ListTile(
    leading: ProfileImage(imageUrl:"https://picsum.photos/seed/picsum/200/300",online: true),
    title: Text('Lisa',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black),
    ),
    subtitle: Text(
      'Thank you',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Colors.black),
    ),
    trailing: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("14:00",
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.black),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Container(
              height: 15.0,
              width: 15.0,
              color: kPrimary,
              alignment: Alignment.center,
              child:  Text("2",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white),),
            ),
          ),
        )
      ],
    ),
  );
}
