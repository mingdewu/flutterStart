import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(const SnackBarDemo());

class SnackBarDemo extends StatelessWidget{
  const SnackBarDemo({super.key}) ;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'SnackBar',
      home: Scaffold(
        appBar: AppBar(
          title:const Text('SnackBar'),
        ),
        body:const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget{
  const SnackBarPage({super.key});
  @override
  Widget build(BuildContext context){
    return Center(
      child:ElevatedButton(
        onPressed: (){
          final snackBar = SnackBar(
              content: const Text('Yay! A SnackBar Coming'),
              action: SnackBarAction(
              label: 'Undo',
              onPressed: (){
              
            },
          )
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child:const Text(
          'Show data 今日は',
          style:TextStyle(fontFamily:'NotoSansJP'),)
      ),
    );
  }
}