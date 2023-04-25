import 'package:flutter/material.dart';
import 'package:lifeline/login.dart';

ElevatedButton quitButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const loginPage()),
    );
    }, child: const Text("quit"));
}
