import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpt3/api_services.dart';
import 'package:flutter_gpt3/chat_model.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {

  SpeechToText speechToText = SpeechToText();
  var text = "Please speak";
  var isListening = false;

  final List<ChatMessage> messages=[];

  var scrollController = ScrollController();

  ScrollMethod(){
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        child: GestureDetector(
          onTapDown: (details) async{
           if (!isListening){
             var available = await speechToText.initialize();
             if (available){
               setState(() {
                 isListening = true;
                 speechToText.listen(
                   onResult: (result){
                     setState(() {
                       text = result.recognizedWords;
                     });
                   }
                 );
               });
             }
           }
          },
          onTapUp: (details) async{
            setState(() {
              isListening = false;
            });
            speechToText.stop();
            messages.add(ChatMessage(text: text,type:ChatMessageType.user));
            var msg = await ApiServices.sendMessage(text);

            setState((){
              messages.add(ChatMessage(text:msg,type:ChatMessageType.bot));
            });
          },
          child: const CircleAvatar(
            backgroundColor: Colors.cyanAccent,
            child: Icon(Icons.mic),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Speech to Text"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              text,
            ),
            const SizedBox(height:12),
            Expanded(
                child: Container(
                  color:Colors.cyan,
                  child: ListView.builder(
                  shrinkWrap: true,
                  controller:scrollController,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context,int index){
                    var chat = messages[index];
                    return chatBubble(
                      chattext: chat.text,
                      type: chat.type
                    );
              }),
            )),
            const SizedBox(height:12),
            const Text("Text"),
          ],
        ),
      ),
    );
  }
  Widget chatBubble({required chattext,required ChatMessageType? type}){
    return Row(
      children: [
        const CircleAvatar(
          child: Icon(Icons.person,color: Colors.white),
        ),
        const SizedBox(width:12),
        Expanded(
          child: Container(
            child:  Text(
                "$chattext"
            ),
          ),
        )
      ],
    );
  }
}
