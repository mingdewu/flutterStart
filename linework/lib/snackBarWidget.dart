import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySnackBar(),
    );
  }
}
class MySnackBar extends StatefulWidget {
  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar>{
  final GlobalKey<ScaffoldState> _key=GlobalKey<ScaffoldState>();

  void _showBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Hello World'),
      action: SnackBarAction(
        label: 'action',
        onPressed: (){
          print('called');
        },
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text('showSnackBar'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(onPressed: _showBar, child: const Text('OK'))
            ],
          ),
        ),
      )
    );
  }
}