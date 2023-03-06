import 'package:flutter/material.dart';

class Ani39 extends StatefulWidget {
  Ani39({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  _MyAni39State createState() => _MyAni39State();
}

class _MyAni39State extends State<Ani39> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 3),
        child: isVisible
            ? Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        )
            : const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}