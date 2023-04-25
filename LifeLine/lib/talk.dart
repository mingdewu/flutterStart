import 'package:flutter/material.dart';
import 'package:lifeline/achienvement.dart';
import 'package:lifeline/friendList.dart';
import 'package:lifeline/project.dart';
import 'package:lifeline/quit.dart';
class talkPage extends StatelessWidget {
  const talkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talk Screen"),
      ),
      body: Center(
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

ElevatedButton talkButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> talkPage()),
    );
  }, child: const Text("talk Page"));
}