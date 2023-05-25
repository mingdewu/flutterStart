import 'package:flutter/material.dart';
import 'package:flutter_gpt3/ttf.dart';
import 'package:flutter_gpt3/tts_screen.dart';

import 'chat_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  TextToSpeech.initTTS();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const ChatPage(),
    );
  }
}
