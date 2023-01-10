import 'package:flutter/material.dart';
import 'package:layout_learn/get_input.dart';


void   main() => runApp(const MyApp());
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title:'Retrieve Text Input',
      home:MyCustomForm()
    );
  }
}
class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue(){
    print('Second text fff:${myController.text}');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("ABCDEFG"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [TextField(
            onChanged: (text){
              print('First:$text');
            },
          ),
            TextField(
              controller: myController,
            )
          ],
        ),
      )
    );
  }
}