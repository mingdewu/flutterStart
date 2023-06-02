import 'package:flutter/material.dart';
import 'package:flutter_gpt3/ttf.dart';

class TTS extends StatelessWidget {
  const TTS({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("text to speech"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
          ),
          ElevatedButton(onPressed: (){
            TextToSpeech.speak(textController.text);
            },
              child: const Text("Speak")),
        ],
      )
    );
  }
}
