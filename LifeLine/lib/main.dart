import 'package:flutter/material.dart';
import 'package:lifeline/src/login.dart';
import 'package:lifeline/src/talk.dart';
void main() => runApp(
    const MyApp()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
//
// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children:[
//               buttonFunction(context, '/login'),
//             ]
//         ),
//       ),
//     );
//   }
// }
//
// buttonFunction(context,var route){
//   return ElevatedButton(
//     onPressed: () {
//       Navigator.pushNamed(context, route);
//     },
//     child:  Text('Launch '+route),
//   );
// }




