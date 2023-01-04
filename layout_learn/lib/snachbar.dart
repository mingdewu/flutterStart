import 'package:flutter/material.dart';
import 'package:layout_learn/main2.dart';

void main() => runApp(const SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SnackBar Demo',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Snackbar demo'),
            ),
            body: const SnackBarPage(),
        )
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: ElevatedButton(
        onPressed:(){
          final snackBar = SnackBar(content: const Text(
            'Hello'
          ),
            action: SnackBarAction(
              label:'Undo',
              onPressed: (){

              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
