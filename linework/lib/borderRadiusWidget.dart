import 'package:flutter/material.dart';

class borderRadiusWidget extends StatelessWidget {
  const borderRadiusWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('borderRadius'),
      ),
      body: Center(
          child:Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color:Colors.black,width: 10),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                boxShadow: const [
                  BoxShadow(blurRadius:10)
                ],
            ),
          ),
      ),
    );
  }
}
