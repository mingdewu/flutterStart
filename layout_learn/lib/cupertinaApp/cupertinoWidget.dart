import 'package:flutter/cupertino.dart';

class Ts1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: const Center(child:Text('123')),
      ),
    );
  }
}

void main() =>runApp(Ts1());