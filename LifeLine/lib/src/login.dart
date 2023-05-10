import 'package:flutter/material.dart';
import 'package:lifeline/src/talk.dart';
import 'package:lifeline/src/register.dart';
import 'package:lifeline/src/friendList.dart';
class loginPage extends StatefulWidget{
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>{
  String infoText = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              buildLogo(),
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value){
                  setState(() {
                    email=value;
                  });
                },
              ),
              SizedBox(width: 50.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value){
                  setState(() {
                    password =value;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(infoText),
              ),
              loginButton(context),
              registerButton(context),
            ],
          ),
        )
    );
  }
}

ElevatedButton loginButton(BuildContext context){
  return ElevatedButton(onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> talkPage()),
    );
    }, child: const Text("Login"));
}

Widget buildLogo() =>
    Container(
      margin: const EdgeInsets.only(left:15.0,top:0,right: 15.0),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          color: Colors.white
      ),
      alignment: Alignment.topRight,
      padding:const EdgeInsets.all(10),

      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLogo1(),
                  buildLogo2(),
                  SizedBox(width: 50.0),
                ],
              )
          )
        ]
      ),
    );

Widget buildLogo1() =>
    const Center(
      child:  Text(
        'Life Line',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent
        ),
      ),
    );

Widget buildLogo2()=>
    const Center(
      child: Text('Connect Myself',style: TextStyle(
          fontSize: 20,
          color: Colors.blueAccent
      ),
      ),
    );

