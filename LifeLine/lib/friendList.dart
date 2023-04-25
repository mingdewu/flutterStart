import 'package:flutter/material.dart';
import 'package:lifeline/project.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/achienvement.dart';
class friendsListPage extends StatelessWidget {
  const friendsListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendsList Screen'),
      ),
      body: Center(
        child: Container(
          child:Column(
            children: [
              talkButton(context),
              friendListButton(context),
              achievementButton(context),
              projectButton(context),
              quitButton(context),
            ],
          )
        ),
      ),
    );
  }
}

ElevatedButton friendListButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const friendsListPage()),
    );
  }, child: const Text("friendListButton Page"));
}
