import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{

  static FlutterTts tts = FlutterTts();

  static initTTS(){
    tts.setLanguage("zh-CN");
    tts.setPitch(1.0);
    tts.setSpeechRate(0.5);
    tts.setVolume(0.5);
  }

  static speak(String text) async{
    tts.setStartHandler(() {
      print("Flutter Text to Speech is running");
    });

    tts.setCompletionHandler(() { print("Flutter Text to Speech is completed");});
    await tts.awaitSpeakCompletion(true);
    tts.speak(text);
  }
}