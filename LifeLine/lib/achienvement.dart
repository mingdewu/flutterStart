import 'package:flutter/material.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/project.dart';
import 'package:lifeline/quit.dart';
import 'package:lifeline/friendList.dart';
class achievementPage extends StatelessWidget {
  const achievementPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AchievementPage Screen'),
      ),
      body: Center(
        child: Container(
        child: Column(
          children: [
            talkButton(context),
            friendListButton(context),
            achievementButton(context),
            projectButton(context),
            quitButton(context),
          ],
        ),
    ),
    )
    );
  }
}

ElevatedButton achievementButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const achievementPage()),
    );
    }, child: const Text("achienvement Page"));
}
