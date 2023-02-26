import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget{
  PageViewWidget({super.key});

  final items = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.lightBlue,
    ),
    Container(
      color: Colors.red,
    )
  ];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: const Text('PageView')),
        body: PageView.builder(
         itemBuilder:(context,index){
           return items[index];
         },
          itemCount:items.length,
        ),
      )
    );
  }
}