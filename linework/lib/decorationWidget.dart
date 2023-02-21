import 'package:flutter/material.dart';

class decorationWidget extends StatelessWidget {
  const decorationWidget({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOXDECORATION Border'),
      ),
      body: Center(
        child:Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color:Colors.black,width: 10)
          ),
        )
      ),
    );
  }
}
