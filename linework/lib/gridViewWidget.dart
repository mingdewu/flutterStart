import 'package:flutter/material.dart';
import 'package:linework/multiColumnWidget.dart';

class GridViewWidget extends StatelessWidget{
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:GridView(
        // GridView.count() =  + gridDelegate:
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        scrollDirection: Axis.vertical,
        primary:false,
        padding:const EdgeInsets.all(22),
        children: <Widget>[
          myContainer('1'),
          myContainer('1'),
          myContainer('1'),
          myContainer('1'),
          myContainer('1'),
        ],
      )
    );
  }
}

Container myContainer(String text){
  return Container(
    alignment: Alignment.center,
    width: 100,
    height: 100,
    color: Colors.green,
    child:Text(text),
  );
}
