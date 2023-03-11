
import 'package:flutter/material.dart';

class Ani2 extends StatefulWidget{
  Ani2({Key? key,required this.title}): super(key: key);
  final String title;

  @override
  _MyAni2State createState() => _MyAni2State();
}

class _MyAni2State extends State<Ani2>{
  bool isVisible = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
            ),
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 3),
          child: isVisible
            ? Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
            )
            : const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            isVisible =!isVisible;
          });
        },
        child:  const Icon(Icons.add),
      )
    );
  }
}

