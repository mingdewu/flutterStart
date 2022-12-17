import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/',
    routes:{
      '/': (constext) =>  const FirstRoute(),
      '/second' :(constext) => const SecondRoute(),
    },
  ));
}



class FirstRoute extends StatelessWidget{
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Open route'),
      ),
      body:Center(
        child:GestureDetector(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        )
      )
    );
  }


}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
              Navigator.pop(context);
          },
          child :const Text('Go back'),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});


  @override
  MyCustomFormState createState(){
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[],
      ),
    )
  }
}
