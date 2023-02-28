import 'package:flutter/material.dart';

void main() => runApp(
    AniContainerWidget()
);// class MyhomePage extends StatefulWidget{
//   HomePage createState() => HomePage();
// }
class AniContainerWidget  extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title :"animationContainer",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage( title:'Mypage')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key,required this.title}) :super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends  State<MyHomePage>{
  var _color = Colors.red;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 5),
        color: _color,
        child: const SizedBox(
          width: 300,
          height: 300,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _color = Colors.indigo;
          });
        },
        child:Icon(Icons.add),
      ),
    );
  }
}