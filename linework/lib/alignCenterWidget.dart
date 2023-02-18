import 'package:flutter/material.dart';
class AlignCenterWidget extends StatelessWidget{
  const AlignCenterWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 300,
          height:300,
          child:DecoratedBox(
            decoration: BoxDecoration(
              color:Colors.green,
            ),
          )
        ),
      ),
    );
  }
}