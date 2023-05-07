import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  // 最初に表示するWidget
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'ChatApp',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      home: LoginPage(),
    );
  }
}

// ログイン画面用Widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = "";
  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText:'メールアドレス' ),
                onChanged: (String value){
                  setState(() {
                    email=value;
                  });
                },
              ),
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
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                      );
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context){
                          return ChatPage();
                        })
                      );
                    }catch(e){
                      setState((){
                        infoText= "登録に失敗しました：${e.toString()}";
                      });
                    };
                  },
                )
              ),
              const SizedBox(height:8),
              // Container(
              // width:double.infinity,
              //     child:ElevatedButton(
              //         child:Text('ログイン'),
              // onPressd:() async {
              //   try {
              //     final FirebaseAuth auth = FirebaseAuth.instance;
              //     await auth.signInWithEmailAndPassword(
              //     email:email,
              //     password:password,
              //     );
              //    await Navigator.of(context).pushReplacement(
              //    MaterialPageroute(builder:(context){
              //      return ChatPage();
              //    }),
              //    );
              //   } catch (e){
              //     setState(){
              //       infoText = "ログインできない、${e.toString()}";
              //     }
              //   }
              // }))
            ],
          ),
        ),
      ),
    );
  }
}

// チャット画面用Widget
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャット'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              // ログイン画面に遷移＋チャット画面を破棄
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // 投稿画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddPostPage();
            }),
          );
        },
      ),
    );
  }
}

// 投稿画面用Widget
class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャット投稿'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('戻る'),
          onPressed: () {
            // 1つ前の画面に戻る
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
