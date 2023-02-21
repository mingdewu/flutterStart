import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget{
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title : const Text("ContainerWidget")
      ),
      body: Container(
      alignment: Alignment.center,
      constraints:const BoxConstraints(maxHeight: 100),
      child:Container(
        color:Colors.green,
        width: 300,
        height: 300,
        transform:Matrix4.rotationZ(0.1)
      )
      ),
    );
  }
}