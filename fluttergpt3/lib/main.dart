import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gpt3/ttf.dart';
import 'package:flutter_gpt3/tts_screen.dart';

import 'chat_screen.dart';
void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor:Colors.transparent));

  TextToSpeech.initTTS();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speech to Text',
      home:  const ChatPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
