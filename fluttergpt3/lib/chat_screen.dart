import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpt3/api_services.dart';
import 'package:flutter_gpt3/ttf.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'chat_model.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speaking";
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  AvatarGlow(
        endRadius: 75.0,
        animate: isListening ,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.greenAccent,
        repeat: true,
        repeatPauseDuration: Duration(milliseconds:100),
        showTwoGlows: true,
        child:GestureDetector(
          onTapDown: (details) async {
           if(!isListening){
             var available = await speechToText.initialize();
             if (available){
               setState(() {
                 isListening = true;
                 speechToText.listen(
                   onResult: (result){
                     setState(() {
                       text=result.recognizedWords;
                     });
                   },
                 );
               });
             }
           }
          },
          onTapUp: (details) async{
            setState(() {
              isListening = false;
            });
            await speechToText.stop();
            if(text.isNotEmpty && text !="Hold the button and start speaking"){
                messages.add(ChatMessage(text: text, type: ChatMessageType.user));
                var msg = await ApiServices.sendMessage(text);
                msg = msg.trim();
                setState(() {
                  messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
                });
                Future.delayed(Duration(milliseconds: 500),(){
                  TextToSpeech.speak(msg);
                });
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Failed")));
            }

            // messages.add(ChatMessage(text:text, type:ChatMessageType.user));
            // var msg = await ApiServices.sendMessage(text);
            //
            // setState(() {
            //   messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
            // });
          },
          child: CircleAvatar(
            backgroundColor: Colors.cyanAccent,
            radius: 35,
            child:Icon(isListening ? Icons.mic:Icons.mic_none,color:Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        leading: const Icon(Icons.sort_rounded,color: Colors.greenAccent,),
        centerTitle: true,
        backgroundColor:Colors.cyan,
        elevation: 0.0,
        toolbarHeight: 100,
        title: const Padding(
          padding:EdgeInsets.all(8.0),
          child: Text("Flutter ChatGPT" ,textAlign: TextAlign.center,),
    ),
      ),
      body: Container(
        color: Colors.black26,
        padding: const EdgeInsets.symmetric(horizontal:20,vertical: 16),
        margin:const EdgeInsets.only(bottom: 120),
        child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize:24,color: isListening?Colors.black87:Colors.black26,fontWeight:  FontWeight.w600),
            ),
            const SizedBox(height: 12,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical:12),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    shrinkWrap:true,
                    itemCount:messages.length,
                    itemBuilder:(BuildContext context,int index){
                      var chat = messages[index];
                      return chatBubble(
                        chattext:chat.text,
                        type:chat.type,
                      );
                    }),
              ),),
            const SizedBox(height: 12,),
            const Text(
              "Voice Assistant",
              style: TextStyle(
                color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget chatBubble( {required chattext, required ChatMessageType? type}){
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.cyanAccent,
          child:type == ChatMessageType.bot ?Image.asset('assets/openai_logo.png'):Icon(Icons.person,color: Colors.white,)
        ),
        const SizedBox(width:12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color:type==ChatMessageType.bot?Colors.cyanAccent:Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Text("$chattext",
              style:
              TextStyle(
                  color:type==ChatMessageType.bot?Colors.black87: Colors.black,
                  fontSize: 15,
                  fontWeight: type==ChatMessageType.bot?FontWeight.w600:FontWeight.w300
              ),
            ),
          ),
        ),
      ],
    );
  }
}
