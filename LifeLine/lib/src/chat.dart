import 'package:flutter/material.dart';
import 'package:lifeline/src/talk.dart';
import 'package:lifeline/src/quit.dart';
import 'package:lifeline/src/friendList.dart';
import 'package:lifeline/src/achievment.dart';
import 'package:lifeline/src/project.dart';
class chatPage extends StatelessWidget{
  const chatPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(
          title: Text("abc"),
        ),
        body:Center(
            child: Column(
              children: [
                talkButton(context),
                // friendListButton(context),
                // achievementButton(context),
                quitButton(context),
              ],
            )
        ),
    );
  }
}

// ElevatedButton routerButton(BuildContext context){
//   return ElevatedButton(onPressed: (){
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context)=> talkPage()),
//     );
//   }, child: const Text("chat"));
// }

