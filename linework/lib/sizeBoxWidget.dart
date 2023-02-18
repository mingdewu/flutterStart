import 'package:flutter/material.dart';
class SizeBoxWidget extends StatelessWidget {
  const SizeBoxWidget({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
          title:const Text("SizeBoxWidget")
      ),
      body: const SizedBox(
        width:300,
        height: 300,
        child:DecoratedBox(decoration: BoxDecoration(color: Colors.red))
      ),
    );
  }
}