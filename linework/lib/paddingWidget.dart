import 'package:flutter/material.dart';
class PaddingWidget extends StatelessWidget{
  const PaddingWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(
            width: 300,
            height:300,
            child:DecoratedBox(
              decoration: BoxDecoration(
                color:Colors.green,
              ),
              child: Padding(
                padding:EdgeInsets.all(16.0),
                child:DecoratedBox(decoration: BoxDecoration(color: Colors.black,))
              ),
            )
      ),
    );
  }
}