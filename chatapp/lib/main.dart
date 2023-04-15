import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future<void> main() async{
  // 最初に表示するWidget
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String infoText = '';
  String email ='';
  String password = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value){
                  setState(() {
                    email=value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value){
                  setState(() {
                    password= value;
                  });
                },
              ),
              Container(
                padding:const EdgeInsets.all(8),
                child:Text(infoText),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final result = await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ユーザー登録に成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return ChatPage(result.user!);
                        }),
                      );
                    } catch (e) {
                      // ユーザー登録に失敗した場合
                      setState(() {
                        infoText = "登録に失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
              Container(
                  width:double.infinity,
                  child:OutlinedButton(
                    child: Text('ログイン'),
                    onPressed: () async{
                      try{
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final result =await auth.signInWithEmailAndPassword(email: email, password: password);
                        await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context){
                              return ChatPage(result.user!);
                        }),
                        );
                      } catch(e){
                        setState(() {
                          infoText= "ログインに失敗しました:${e.toString()}";
                        });
                      }
                    },
              ))
            ],
          ),
        ),
      ),
    );
  }
}


// チャット画面用Widget
class ChatPage extends StatelessWidget {
  ChatPage(this.user);
  final User user;
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
              await FirebaseAuth.instance.signOut();
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('ログイン情報:${user.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // 投稿画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddPostPage(user);
            }),
          );
        },
      ),
    );
  }
}
class AddPostPage extends StatefulWidget{
  AddPostPage(this.user);
  final  User user;
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

// 投稿画面用Widget
class _AddPostPageState  extends State<AddPostPage> {

  String messageText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャット投稿'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "メッセージ"),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onChanged: (String value){
                setState(() {
                  messageText = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
            child: ElevatedButton(
             child: Text("投稿"),
            onPressed: () async{
               final date =DateTime.now().toLocal().toIso8601String();
               final email = widget.user.email;
               await FirebaseFirestore.instance.collection("posts").doc().set({
            'text': messageText,
            'email': email,
            'date': date
              });
               Navigator.of(context).pop();
            },
            ),
            )
            ],
          ),
        ),
      ),
    );
  }
}