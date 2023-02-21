import 'package:flutter/material.dart';
class FractionallySizedBoxWidget extends StatelessWidget {
  const FractionallySizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Align(
        alignment: Alignment.center,
        child:FractionallySizedBox(
          widthFactor: 0.75,
          heightFactor: 1,
          child: SizedBox(
              width: 300,
              height:300,
              child:SizedBox(
                width: 1,
                height: 1,
                child: DecoratedBox(decoration: BoxDecoration(color:Colors.green)),
              )
          ),
        ),
      ),
    );
  }
}