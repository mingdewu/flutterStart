import 'package:flutter/material.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/friendList.dart';
import 'package:lifeline/achienvement.dart';
import 'package:lifeline/project.dart';
class chatPage extends StatelessWidget{
  const chatPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(),
        body:Center(
            child: Column(
              children: [
                talkButton(context),
                friendListButton(context),
                achievementButton(context),
                projectButton(context),
                quitButton(context),
              ],
            )
        ),
    );
  }
}

ElevatedButton routerButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> talkPage()),
    );
  }, child: const Text("chat"));
}

