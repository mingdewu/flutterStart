import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpt3/api_services.dart';
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
    return SafeArea(
        child: Scaffold(
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
                speechToText.stop();


                messages.add(ChatMessage(text:text, type:ChatMessageType.user));
                var msg = await ApiServices.sendMessage(text);
                
                setState(() {
                  messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                radius: 35,
                child:Icon(isListening ? Icons.mic:Icons.mic_none,color:Colors.white),
              ),
            )
          ),
          appBar: AppBar(
            leading: Icon(Icons.sort_rounded,color: Colors.greenAccent,),
            centerTitle: true,
            backgroundColor:Colors.cyan,
            toolbarHeight: 100,
            title: const Padding(
              padding:EdgeInsets.all(8.0),
              child: Text("Flutter ChatGPT" ,textAlign: TextAlign.center,),
        ),
      ),
          body: SingleChildScrollView(
            reverse:true,
            physics:const BouncingScrollPhysics(),
            child: Container(

              // color: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal:24,vertical: 16),
              margin:const EdgeInsets.only(bottom: 150),
              child: Column(
                children: [
                  Text(
                    text,
                    style:
                    TextStyle(fontSize:24,color: isListening?Colors.black87:Colors.black26,fontWeight:  FontWeight.w600),
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
                        }
                      ),
                    ),
                  ),
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
          ),
    )
    );
  }

  Widget chatBubble( {required chattext, required ChatMessageType? type}){
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.cyanAccent,
          child:Icon(Icons.person,color: Colors.white,)
        ),
        const SizedBox(width:12),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Text("$chattext",
              style:
              TextStyle(
                  color: Colors.cyanAccent,fontSize: 15,fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ],
    );
  }
}
