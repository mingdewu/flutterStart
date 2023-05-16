import 'package:flutter/material.dart';
import 'package:lifeline/components/userchat.dart';
import 'package:lifeline/src/profile_image.dart';
import 'package:lifeline/src/project.dart';
import 'package:lifeline/src/talk.dart';
import 'package:lifeline/src/quit.dart';
import 'package:lifeline/src/achievment.dart';
import 'package:lifeline/models/chat_users.dart';
import 'chats.dart';

class friendsListPage extends StatefulWidget {
  const friendsListPage({super.key});

  @override
  State<friendsListPage> createState() => _friendsListPageState();
}

class _friendsListPageState extends State<friendsListPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Friend A",
        secondaryText: "Good idea!",
        image: "images/1.jpg",
        time: "now"),
    ChatUsers(
        text: "Friend B",
        secondaryText: "OK, Let's Go!",
        image: "images/1.jpg",
        time: "yesterday"),
    ChatUsers(
        text: "Friend C",
        secondaryText: "Maybe i was wrong!",
        image: "images/1.jpg",
        time: "05/12"),
    ChatUsers(
        text: "Friend D",
        secondaryText: "I will go to hospital tomorrow!",
        image: "images/1.jpg",
        time: "05/11"),
    ChatUsers(
        text: "Friend E",
        secondaryText: "Dont do that",
        image: "images/1.jpg",
        time: "05/06"),
    ChatUsers(
        text: "Friend F",
        secondaryText: "Please clean your room",
        image: "images/1.jpg",
        time: "Last month"),
    ChatUsers(
        text: "Friend G",
        secondaryText: "Can you help me?",
        image: "images/1.jpg",
        time: "Last year"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: Icon(Icons.search,
                          color: Colors.grey.shade400, size: 20),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.all(8.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade100))),
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
            ),
            body: ListView.builder(
              
              itemCount: chatUsers.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUserLIst(
                    text: chatUsers[index].text,
                    secondaryText: chatUsers[index].secondaryText,
                    image: chatUsers[index].image,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 1|| index ==3)?true:false,);
              },
            )));
  }
}

Column myFriendListPage(BuildContext context) {
  return Column(
    children: [
      Container(
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        height: 50.0,
        child: yearsList(context),
      ),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListView(children: const <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
          ])),
    ],
  );
}

ElevatedButton friendListButton(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const friendsListPage(),
            ));
      },
      child: const Text("friendListButton Page"));
}

ListView yearsList(BuildContext context) {
  return ListView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
        width: 160.0,
        color: Colors.red,
        child: yearlabel(context, "2021"),
      ),
      Container(
        width: 160.0,
        color: Colors.blue,
        child: yearlabel(context, "2022"),
      ),
      Container(
        width: 160.0,
        color: Colors.yellow,
        child: yearlabel(context, "2023"),
      ),
      Container(
        width: 160.0,
        color: Colors.black,
      ),
    ],
  );
}

Stack yearlabel(BuildContext context, String _thisyear) {
  return Stack(
    children: [
      ListTile(
        title: Text(_thisyear),
      )
    ],
  );
}

SliverList thisYearFriends(BuildContext context) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
      childCount: 5,
    ),
  );
}

ListView friends2023(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.map),
        title: Text('Map'),
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Album'),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text('Phone'),
      ),
      ListTile(
        leading: Icon(Icons.contacts),
        title: Text('Contact'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Setting'),
      ),
    ],
  );
}
