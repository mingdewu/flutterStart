import 'package:flutter/material.dart';
import 'package:lifeline/login.dart';
import 'package:lifeline/talk.dart';
import 'package:lifeline/quit.dart';
void main() => runApp(
    MyApp()
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Line',
      initialRoute: "/",
      routes: {
        '/': (context) =>  loginPage(),
        '/login': (context) => talkPage(),
        //'/register': (context) => const registerPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('First Page')
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              buttonFunction(context, '/login'),
            ]
        ),
      ),
    );
  }
}

buttonFunction(context,var route){
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child:  Text('Launch '+route),
  );
}




