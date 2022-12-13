import 'package:flutter/material.dart';
void main() {
  runApp(const  MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home:  buildHomePage('ABC')
    );
  }
  Widget buildHomePage(String title){
    const titleText = Padding(
      padding:EdgeInsets.all(20),
      child:Text(
        "BCD",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing:0.5,
          fontSize: 30,
        ),
      )
    );
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );
    return Scaffold(
      appBar:AppBar(
        title:Text(title),
      ),
      body: Center(
        child:stars
      )
    );
  }
}