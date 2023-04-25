import 'package:flutter/material.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/friendList.dart';
import 'package:lifeline/achienvement.dart';
class projectPage extends StatelessWidget {
  const projectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Screen'),
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

ElevatedButton projectButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> projectPage()),
    );
    }, child: const Text("project Page"));
}