import 'package:flutter/material.dart';
class EdgeInsertsWidget extends StatelessWidget{
  const EdgeInsertsWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedBox(
        constraints:  const BoxConstraints(maxHeight: 100),
        child:const SizedBox(
          width: 300,
            height: 300,
          child:DecoratedBox(decoration: BoxDecoration(
            color: Colors.blue,
          ))
        )
    ),
    );
  }
}