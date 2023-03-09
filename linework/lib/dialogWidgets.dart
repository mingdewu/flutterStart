import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor:Colors.black87,
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Mydialog(),
              buildColumn(),
            ],
          ),
        ),
      )

    );
  }
  Widget buildColumn() =>
      // #docregion Column
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:EdgeInsets.all(15),
        child: const Text(
          "FriendList",
          style: TextStyle(color: Colors.white),
        ),
      ),

    ],
  );
}

class Mydialog extends StatefulWidget{

  @override
  _MyDialogState createState()=> _MyDialogState();
}

class _MyDialogState extends State<Mydialog>{
  var _value = '';

  Future _askUser() async {
// SimpleDialogの場合
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.group),
              title: const Text('選択肢１'),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: Icon(Icons.insert_emoticon),
              title: const Text('選択肢2'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              ElevatedButton(
                onPressed: _askUser,
                child: const Text('開く'),
              ),
              OutlinedButton(onPressed: (){}, child: const Text(
                'outline button'
              )),

            ],
          ),
        ),
      ),
    );
  }

}
