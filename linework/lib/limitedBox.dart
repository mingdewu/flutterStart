import 'package:flutter/material.dart';
class LimitedBoxWidget extends StatelessWidget{
  const LimitedBoxWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          for (var _ in Iterable<int>.generate(10).toList())
            LimitedBox(
              maxHeight: 100,
              child:Container(
                color: const Color.fromARGB(25, 93, 251, 331),
              )
            )
        ],
      )
    );
  }
}