import 'package:flutter/material.dart';
class SpacerWidget extends StatelessWidget{
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Container(),
      const Spacer(
        flex: 1,
      ),
      Container(),
    const Spacer(
      flex: 1,
    ),
    ],
    ),
    );
  }
}