import 'package:flutter/material.dart';
import 'package:lifeline/quit.dart';
class registerPage extends StatelessWidget{
  const registerPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(),
        body:Container(
          alignment:Alignment.center,
          width: 100,
          color:Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              registerButton(context),
            ],
          ),
        )
    );
  }
}


ElevatedButton registerButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> registerPage()),
    );
  }, child: const Text("Register"));
}
