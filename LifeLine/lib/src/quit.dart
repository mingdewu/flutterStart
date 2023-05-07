import 'package:flutter/material.dart';
import 'package:lifeline/src/login.dart';

ElevatedButton quitButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> loginPage()),
    );
    }, child: const Text("quit"));
}
