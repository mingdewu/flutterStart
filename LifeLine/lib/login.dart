import 'package:flutter/material.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/register.dart';
import 'package:lifeline/quit.dart';
class loginPage extends StatelessWidget{
  const loginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginButton(context),
              registerButton(context),
            ],
          ),
        )
    );
  }
}

ElevatedButton loginButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> talkPage()),
    );
    }, child: const Text("Login"));
}


