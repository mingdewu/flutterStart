import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget FutureBuilder(
future:Repository().fetch(),
build: (context,snapshop){
  if (snapshot.connectionState == ConnectionState.done){
    if (snapshothasError{
      return //
}
if (!snapshot.hasData){
  return //
}
return Text('{snapshot.data}');
}
  else{
    return const CircularProgressIndicator();
  }
}
),

class Repository {
      Future<int> fetch(){
        return Future.delayed(Duration(seconds:1)).then((_){
          return 1;
});
}
}