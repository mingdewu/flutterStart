import 'package:flutter/material.dart';
class TextBaseLineWidget extends StatelessWidget {
  const TextBaseLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.blue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Text(
              '感情',
              style:Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '韓国',
              style:Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}