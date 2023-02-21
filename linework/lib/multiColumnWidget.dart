import 'package:flutter/material.dart';
class MultiColumnWidget extends StatelessWidget{
  const MultiColumnWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(),
      body:Container(
        alignment:Alignment.center,
        width: 100,
        color:Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myContainer(),
            myContainer(),
            myContainer(),
          ],
        ),
      )
    );
  }
}

Container myContainer({double size = 50}){
  return Container(
    margin : const EdgeInsets.all(8),
    width:size,
    height: size,
    color: Colors.blue,
  );
}